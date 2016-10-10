type Person
    name:: String
    height::Float64
end

fieldnames(Person) #> 2-element Array{Symbol,1}: :name  :height
Person.types  #> (String,Float64)

code_lowered(+, (Int, Int))
# 1-element Array{LambdaInfo,1}:
#  LambdaInfo template for +{T<:Union{Int128,Int16,Int32,Int64,Int8,UInt128,UInt16
# ,UInt32,UInt64,UInt8}}(x::T, y::T) at int.jl:32


code_typed(+, (Int, Int))
# 1-element Array{Any,1}:
#  LambdaInfo for +(::Int64, ::Int64)
