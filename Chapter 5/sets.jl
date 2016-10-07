s = Set(Any[11, 14, 13, 7, 14, 11])
s1 = Set(Any[11, 25])
s2 = Set(Any[25, 3.14])
union(s1, s2) #> Set(Any[3.14,25,11])
intersect(s1, s2) #> Set(Any[25])
setdiff(s1, s2) #> Set(Any[11])
setdiff(s2, s1) #> Set(Any[3.14])
issubset(s1, s2) #> false
issubset(s1, Set(Any[11, 25, 36])) #> true

push!(s1, 32) #>
in(32, s1) #> true
in(100, s1) #> false

x = Set([1:100]) #> Set(UnitRange{Int64}[1:100])
x = Set(collect(1:100)) # Set([2,89,11,29,74,57,31,78,70,33  …  19,51,22,6,24,73,53,23,27,56])
@time 2 in x # elapsed time 4.888e-6 seconds
x2 = Set([1:1000000])
x2 = Set(collect(1:1000000))
@time 2 in x2 # elapsed time 5.378e-6 seconds

st = Set()
push!(st, (1,2))
st2 = Set(Any[(1, 2), (5, 6)])
