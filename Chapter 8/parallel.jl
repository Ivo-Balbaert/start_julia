# start the following on the command line:
# julia -p n  # starts n processes on the local machine
# julia -p 8  # starts REPL with 8 workers
workers()
# 8-element Array{Int64,1}:
#   2
#   3
#   4
#   5
#   ⋮
#   8
#   9

# iterate over workers:
for pid in workers()
	# do something with pid
end
myid() # 1
addprocs(5)
# 5-element Array{Any,1}:
#  10
#  11
#  12
#  13
#  14
nprocs() # 14
rmprocs(3) # worker with id 3 is removed

# cluster of computers:
# julia --machinefile machines driver.jl
# Run processes specified in driver.jl on hosts listed in machines

# primitive operations with processes:
r1 = remotecall(x -> x^2, 2, 1000) #> Future(2,1,11,Nullable{Any}())
fetch(r1) #> 1000000

remotecall_fetch(sin, 5, 2pi) # -2.4492935982947064e-16

r2 = @spawnat 4 sqrt(2) # lets worker 4 calculate sqrt(2)
fetch(r2)  #> 1.4142135623730951
r = [@spawnat w sqrt(5) for w in workers()]
# or in a freshly started REPL:
# r = [@spawnat i sqrt(5) for i=1:length(workers())]
# 8-element Array{Future,1}:
#  Future(2,1,24,#NULL)
#  Future(3,1,25,#NULL)
#  Future(4,1,26,#NULL)
#  Future(5,1,27,#NULL)
#  Future(6,1,28,#NULL)
#  Future(7,1,29,#NULL)
#  Future(8,1,30,#NULL)
#  Future(9,1,31,#NULL)
r3 = @spawn sqrt(5) #> Future(2,1,32,Nullable{Any}())
fetch(r3) #> 2.23606797749979

# using @everywhere to make functions available to all workers:
@everywhere w = 8
@everywhere println(myid()) # 1
        # From worker 2:  2
        # From worker 3:  3
        # From worker 4:  4
        # From worker 7:  7
        # From worker 5:  5
        # From worker 6:  6
        # From worker 8:  8
        # From worker 9:  9

@everywhere include("defs.jl")
@everywhere function fib(n)
	if (n < 2) then
	return n
	else return fib(n-1) + fib(n-2)
	end
end
include("functions.jl")

# broadcast data to all workers:
d = "Julia"
for pid in workers()
   remotecall(x -> (global d; d = x; nothing), pid, d)
end
