module Package1

push!(LOAD_PATH, "F:\\Julia\\start_julia\\Chapter6") # does not help for LoadError!
include("modules_ext.jl")
using LibA
# ERROR: LoadError: ArgumentError: LibA not found in path
#  in require at loading.jl:249
#  in include at boot.jl:261
#  in include_from_node1 at loading.jl:320
# while loading F:\Julia\start_julia\Chapter 6\modules.jl, in expression starting o
using LibB.varB
using LibC: varC, funcC
import LibD.funcD
importall LibE

export Type1, perc

include("file1.jl")
include("file2.jl")

# code
type Type1
    total
end

perc(a::Type) = a.total * 0.01

end