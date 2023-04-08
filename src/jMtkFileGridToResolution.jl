"""
    resolution = jMtkFileGridToResolution(filename, gridname)

# Purpose:
Return the resolution in meters of a given grid.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"

julia> gridname = "RedBand"
"RedBand"

julia> resolution = jMtkFileGridToResolution(filename, gridname)
275
```
"""
function jMtkFileGridToResolution(filename::AbstractString, gridname::AbstractString)
    resolution = Ref{Cint}()
    status = ccall((:MtkFileGridToResolution, mtklib),
        Cint,
        (Cstring, Cstring, Ref{Cint}),
        filename, gridname, resolution)
    if status != 0
        error("jMtkFileGridToResolution status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return resolution[]
end
