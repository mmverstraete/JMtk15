"""
    path = jMtkFileToPath(filename)

# Purpose:
Return the path number for a MISR product file.

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
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"

julia> path = jMtkFileToPath(filename)
168
```
"""
function jMtkFileToPath(filename::AbstractString)
    path = Ref{Cint}(0)
    status = ccall((:MtkFileToPath, mtklib),
        Cint,
        (Cstring, Ref{Cint}),
        filename, path)
    if status != 0
        error("jMtkFileToPath status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    else
        return path[]
    end
end
