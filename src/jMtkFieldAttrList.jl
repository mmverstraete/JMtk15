"""
    nattrs, attrlist = jMtkFieldAttrList(filename, fieldname)

# Purpose:
List the attributes for a specified field.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"
"/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"

julia> fieldname = "StandardEstimateCloudFraction"
"StandardEstimateCloudFraction"

julia> nattrs, attrlist = jMtkFieldAttrList(filename, fieldname);

julia> nattrs
1

julia> attrlist
1-element Vector{String}:
 "_FillValue"
```
"""
function jMtkFieldAttrList(filename::AbstractString, fieldname::AbstractString)
    nattrs = Ref{Cint}(0)
    attrlist = Ref{Ptr{Ptr{UInt8}}}()
    status = ccall((:MtkFieldAttrList, mtklib),
        Cint,
        (Cstring, Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}),
        filename, fieldname, nattrs, attrlist)
    if status != 0
        error("jMtkFieldAttrList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_attrlist = [unsafe_string(unsafe_load(attrlist[], i)) for i in 1:nattrs[]]
    status = @ccall mtklib.MtkStringListFree(
        nattrs[]::Cint,
        attrlist::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkFieldAttrList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return nattrs[], julia_attrlist
end
