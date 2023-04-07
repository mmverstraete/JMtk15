"""
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList(filename, gridname, fieldname)

# Purpose:
Return the dimension names and sizes for a given file, grid, and field.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"

julia> gridname = "1.1_KM_PRODUCTS"
"1.1_KM_PRODUCTS"

julia> fieldname = "Bidirectional_Reflectance_Factor"
"Bidirectional_Reflectance_Factor"

julia> ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList(filename, gridname, fieldname);

julia> ndims
2

julia> dimnames
2-element Vector{String}:
 "Band_Dim"
 "Camera_Dim"

julia> dimsizes
2-element Vector{Int32}:
 4
 9
```
"""
function jMtkFileGridFieldToDimList(filename::AbstractString, gridname::AbstractString, fieldname::AbstractString)
    ndims = Ref{Cint}(0)
    dimnames = Ref{Ptr{Ptr{UInt8}}}()
    dimsizes = Ref{Ptr{Cint}}()
    status = ccall((:MtkFileGridFieldToDimList, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}, Ref{Ptr{Cint}}),
        filename, gridname, fieldname, ndims, dimnames, dimsizes)
    if status != 0
        error("jMtkFileGridFieldToDimList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_dimnames = [unsafe_string(unsafe_load(dimnames[], i)) for i in 1:ndims[]]
    julia_dimsizes = [unsafe_load(dimsizes[], i) for i in 1:ndims[]]
    status = @ccall mtklib.MtkStringListFree(
        ndims::Ref{Cint},
        dimnames::Ref{Ptr{Ptr{UInt8}}},
        dimsizes::Ref{Ptr{Cint}})::Cint
    if status != 0
        error("jMtkFileGridFieldToDimList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return ndims[], julia_dimnames, julia_dimsizes
end
