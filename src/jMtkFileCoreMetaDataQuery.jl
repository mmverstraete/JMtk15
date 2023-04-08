"""
    nparams, paramlist = jMtkFileCoreMetaDataQuery(filename)

# Purpose:
Return the number of coremetadata parameters and a list of all coremetadata
    parameter names for a given file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# WARNING:
This function currently crashes when applied to `GP_GMP` data files.

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"

julia> nparams, paramlist = jMtkFileCoreMetaDataQuery(filename);

julia> nparams
43

julia> paramlist
43-element Vector{String}:
 "LOCALGRANULEID"
 "PRODUCTIONDATETIME"
 "LOCALVERSIONID"
 "PGEVERSION"
 "MEASUREDPARAMETERCONTAINER"
 "AUTOMATICQUALITYFLAGEXPLANATION"
 "AUTOMATICQUALITYFLAG"
 "QAPERCENTMISSINGDATA"
 "PARAMETERNAME"
 "ORBITCALCULATEDSPATIALDOMAINCONTAINER"
 ⋮
 "PARAMETERVALUE"
 "ADDITIONALATTRIBUTESCONTAINER"
 "ADDITIONALATTRIBUTENAME"
 "PARAMETERVALUE"
 "ASSOCIATEDPLATFORMINSTRUMENTSENSORCONTAINER"
 "ASSOCIATEDSENSORSHORTNAME"
 "ASSOCIATEDPLATFORMSHORTNAME"
 "OPERATIONMODE"
 "ASSOCIATEDINSTRUMENTSHORTNAME"
```
"""
function jMtkFileCoreMetaDataQuery(filename::AbstractString)
    nparams = Ref{Cint}(0)
    paramlist = Ref{Ptr{Ptr{Cuchar}}}()
    status = ccall((:MtkFileCoreMetaDataQuery, mtklib),
        Cint,
        (Cstring, Ptr{Cint}, Ptr{Ptr{Ptr{Cuchar}}}),
        filename, nparams, paramlist)
    if status != 0
        error("jMtkFileCoreMetaDataQuery status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_paramlist = [unsafe_string(unsafe_load(paramlist[], i)) for i in 1:nparams[]]
    status = @ccall mtklib.MtkStringListFree(
        nparams[]::Cint,
        paramlist::Ref{Ptr{Ptr{Cuchar}}})::Cint
    if status != 0
        error("jMtkFileCoreMetaDataQuery: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return nparams[], julia_paramlist
end
