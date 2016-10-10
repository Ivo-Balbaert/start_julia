typeof(2) #> Int64
typeof(Int64) #> DataType
typeof(Complex{Int64}) #> DataType
typeof(Any) #> DataType
typeof(DataType) #> DataType

supertype(Int64) #> Signed
supertype(Signed) #> Integer
supertype(Integer) #> Real
supertype(Real) #> Number
supertype(Number) #> Any
supertype(Any) #> Any

subtypes(Integer) #> 4-element Array{Any,1}:
# BigInt
# Bool
# Signed
# Unsigned
subtypes(Signed) #> 5-element Array{Any,1}:
# Int128
# Int16
# Int32
# Int64
# Int8
subtypes(Int64) #> 0-element Array{Any,1}
typeof(Union{}) #> UnionType

Bool <: Integer #> true
Bool <: Any #> true
Bool <: Char #> false
issubtype(Bool, Integer) #> true
issubtype(Float64, Integer) #> false

typeof(5) #> Int64
isa(5, Number) #> true
