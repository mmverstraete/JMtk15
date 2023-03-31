"""
    fversion = jMtkFileVersion(filename)

# Purpose:
Return the file version identifier of a MISR product file.

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
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BF_F03_0024.hdf"

julia> fversion = jMtkFileVersion(filename)
"F03_0024"
````
"""
function jMtkFileVersion(filename::AbstractString)
    fversion = zeros(Cuchar, 10)
    status = ccall((:MtkFileVersion, mtklib),
        Cint,
        (Cstring, Ref{Cuchar}),
        filename, fversion)
    if status != 0
        error("jMtkFileVersion status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    fversion = StringView(fversion)
    fversion = rstrip(fversion, '\0')
    return fversion
end
