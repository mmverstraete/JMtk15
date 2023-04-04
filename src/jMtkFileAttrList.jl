"""
    attrcnt, attrlist = jMtkFileAttrList(filename);

# Purpose:
List the attributes of a specified MISR product file.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BF_F03_0024.hdf"
"/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BF_F03_0024.hdf"

julia> attrcnt, attrlist = jMtkFileAttrList(filename);

julia> attrcnt
31

julia> attrlist
31-element Vector{String}:
 "HDFEOSVersion"
 "StructMetadata.0"
 "Path_number"
 "AGP_version_id"
 "DID_version_id"
 "Number_blocks"
 "Ocean_blocks_size"
 "Ocean_blocks.count"
 "Ocean_blocks.numbers"
 "SOM_parameters.som_ellipsoid.a"
 "SOM_parameters.som_ellipsoid.e2"
 "SOM_parameters.som_orbit.aprime"
 "SOM_parameters.som_orbit.eprime"
 "SOM_parameters.som_orbit.gama"
 "SOM_parameters.som_orbit.nrev"
 ⋮
 "SOM_parameters.som_orbit.P2P1"
 "SOM_parameters.som_orbit.lambda0"
 "Origin_block.ulc.x"
 "Origin_block.ulc.y"
 "Origin_block.lrc.x"
 "Origin_block.lrc.y"
 "Start_block"
 "End block"
 "Cam_mode"
 "Num_local_modes"
 "Local_mode_site_name"
 "Orbit_QA"
 "Camera"
 "coremetadata"
```
"""
function jMtkFileAttrList(filename::AbstractString)
    attrcnt = Ref{Cint}(0)
    attrlist = Ref{Ptr{Ptr{Cuchar}}}()
    status = ccall((:MtkFileAttrList, mtklib),
        Cint,
        (Cstring, Ptr{Cint}, Ptr{Ptr{Ptr{Cuchar}}}),
        filename, attrcnt, attrlist)
    if status != 0
        error("jMtkFileAttrList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_attrlist = [unsafe_string(unsafe_load(attrlist[], i)) for i in 1:attrcnt[]]
    status = @ccall mtklib.MtkStringListFree(
        attrcnt[]::Cint,
        attrlist::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkFileAttrList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return attrcnt[], julia_attrlist
end
