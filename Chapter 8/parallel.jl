# julia -p n  # starts n processes on the local machine
julia -p 10  # starts REPL with 10 workers
workers()
# 10-element Array{Int64,1}:
#   2
#   3
#   4
#   5
#   ⋮
#   8
#   9
#  10
#  11

# iterate over workers:
for pid in workers()
	# do something with pid
end
myid() # 1
addprocs(5)
# 5-element Array{Any,1}:
#  12
#  13
#  14
#  15
#  16
nprocs() # 16
rmprocs(3) # worker with id 3 is removed

# cluster of computers:
julia --machinefile machines driver.jl 
# Run processes specified in driver.jl on hosts listed in machines

# primitive operations with processes:
r1 = remotecall(2, x -> x^2, 1000) #> RemoteRef(2,1,20)
fetch(r1) #> 1000000

remotecall_fetch(5, sin, 2pi) # -2.4492935982947064e-16

r2 = @spawnat 4 sqrt(2) # lets worker 4 calculate sqrt(2)
fetch(r2)  #> 1.4142135623730951
r = [@spawnat i sqrt(5) for i=1:length(workers())]
r3 = @spawn sqrt(5) #> RemoteRef(5,1,26)
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
require("functions")

# broadcast data to all workers:
for pid in workers()
   remotecall(pid, x -> (global data; data = x; nothing), data)
end