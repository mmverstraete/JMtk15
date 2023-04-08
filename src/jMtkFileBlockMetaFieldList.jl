"""
    nfields, fieldlist = jMtkFileBlockMetaFieldList(filename, blockmeta)

# Purpose:
List block metadata fields of a file.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"

julia> blockmeta = "PerBlockMetadataCommon"
"PerBlockMetadataCommon"

julia> nfields, fieldlist = jMtkFileBlockMetaFieldList(filename, blockmeta);

julia> nfields
7

julia> fieldlist
7-element Vector{String}:
 "Block_number"
 "Ocean_flag"
 "Block_coor_ulc_som_meter.x"
 "Block_coor_ulc_som_meter.y"
 "Block_coor_lrc_som_meter.x"
 "Block_coor_lrc_som_meter.y"
 "Data_flag"
```
"""
function jMtkFileBlockMetaFieldList(filename, blockmeta)
    nfields = Ref{Cint}()
    fieldlist = Ref{Ptr{Ptr{UInt8}}}()
    status = ccall((:MtkFileBlockMetaFieldList, mtklib),
        Cint,
        (Cstring, Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}),
        filename, blockmeta, nfields, fieldlist)
    if status != 0
        error("jMtkFileBlockMetaFieldList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_fieldlist = [Base.unsafe_string(Base.unsafe_load(fieldlist[], i)) for i in 1:nfields[]]
    status = @ccall mtklib.MtkStringListFree(
        nfields[]::Cint,
        fieldlist::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkFileBlockMetaFieldList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return nfields[], julia_fieldlist
end
