"""
    nfields, fieldlist = jMtkFileGridToFieldList(filename, gridname)

# Purpose:
Return a string array of fields associated with a given gridname.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf"

julia> gridname = "GreenBand"
"GreenBand"

julia> nfields, fieldlist = jMtkFileGridToFieldList(filename, gridname);

julia> nfields
6

julia> fieldlist
6-element Vector{String}:
 "Green Radiance/RDQI"
 "Green Radiance"
 "Green RDQI"
 "Green DN"
 "Green Equivalent Reflectance"
 "Green Brf"
```
"""
function jMtkFileGridToFieldList(filename::AbstractString, gridname::AbstractString)
    nfields = Ref{Cint}(0)
    fieldlist = Ref{Ptr{Ptr{UInt8}}}()
    status = ccall((:MtkFileGridToFieldList, mtklib),
        Cint,
        (Cstring, Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}),
        filename, gridname, nfields, fieldlist)
    if status != 0
        error("jMtkFileGridToFieldList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_fieldlist = [unsafe_string(unsafe_load(fieldlist[], i)) for i in 1:nfields[]]
    status = @ccall mtklib.MtkStringListFree(
        nfields[]::Cint,
        fieldlist::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkFileGridToFieldList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return nfields[], julia_fieldlist
end
