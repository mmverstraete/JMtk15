"""
    nattrs, attrlist = jMtkGridAttrList(filename, gridname)

# Purpose:
List the attributes for a specified grid/file.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
"/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"

julia> gridname = "RedBand"
"RedBand"

julia> nattrs, attrlist = jMtkGridAttrList(filename, gridname);

julia> nattrs
7

julia> attrlist
7-element Vector{String}:
 "Block_size.resolution_x"
 "Block_size.resolution_y"
 "Block_size.size_x"
 "Block_size.size_y"
 "Scale factor"
 "std_solar_wgted_height"
 "SunDistanceAU"
```
"""
function jMtkGridAttrList(filename::AbstractString, gridname::AbstractString)
    nattrs = Ref{Cint}(0)
    attrlist = Ref{Ptr{Ptr{UInt8}}}()
    status = ccall((:MtkGridAttrList, mtklib),
        Cint,
        (Cstring, Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}),
        filename, gridname, nattrs, attrlist)
    if status != 0
        error("jMtkGridAttrList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_attrlist = [unsafe_string(unsafe_load(attrlist[], i)) for i in 1:nattrs[]]
    status = @ccall mtklib.MtkStringListFree(
        nattrs[]::Cint,
        attrlist::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkGridAttrList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return nattrs[], julia_attrlist
end
