"""
    status = jMtkFileGridFieldCheck(filename, gridname, fieldname)

# Purpose:
Return "SUCCESS" (MTKt_status = 0) if the specified filename, gridname, and fieldname are valid,
    or an error message otherwise.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"

julia> gridname = "NIRBand"
"NIRBand"

julia> fieldname = "NIR Radiance/RDQI"
"NIR Radiance/RDQI"

julia> status = jMtkFileGridFieldCheck(filename, gridname, fieldname)
"SUCCESS"
```
"""
function jMtkFileGridFieldCheck(filename::AbstractString, gridname::AbstractString, fieldname::AbstractString)
    status = ccall((:MtkFileGridFieldCheck, mtklib),
        Cint,
        (Cstring, Cstring, Cstring),
        filename, gridname, fieldname)
    if status != 0
        error("jMtkFileGridFieldCheck status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return jMtkErrorMessage(status)
end
