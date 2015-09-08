using PyCall

pyeval("10*10") #> 100
@pyimport math
println(math.sin(math.pi / 2)) #> 1.0
