"""
    filetype = jMtkFileType(filename)

# Purpose:
Determine the MISR product file type.

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

julia> filetype = jMtkFileType(filename)
"AS_LAND"
```
"""
function jMtkFileType(filename::AbstractString)
    ft = Ref{Cint}(0)
    status = ccall((:MtkFileType, mtklib),
        Cint,
        (Cstring, Ref{Cint}),
        filename, ft)
    if status != 0
        error("jMtkFileType status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    filetype = MTKt_FileType_Desc[ft[] + 1]
    return filetype
end
