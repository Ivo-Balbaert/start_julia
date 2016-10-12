# ok on Linux
# not ok on Windows: ERROR: error compiling anonymous: could not load module libc: 
# The specified module could not be found.

# calling a function in a shared library:
lang = ccall( (:getenv, "libc"),Ptr{UInt8}, (Ptr{UInt8},), "LANGUAGE")
unsafe_string(lang) #> "en_US"

# test existence of library:
Libdl.find_library(["libc"]) #> "libc"
