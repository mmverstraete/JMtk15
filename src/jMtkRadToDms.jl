"""
    packed_dms = jMtkRadToDms(radians)

# Purpose:
Convert radians to packed degrees/minutes/seconds.

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

julia> radians = 1.14406332
1.14406332

julia> packed_dms = jMtkRadToDms(radians)
1.008038627952e6
```
"""
function jMtkRadToDms(radians)
    packed_dms = Ref{Float64}(0.0)
    status = ccall((:MtkRadToDms, mtklib),
        Cint,
        (Cdouble, Ptr{Cdouble}),
        radians, packed_dms)
    if status != 0
        error("jMtkRadToDms status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return packed_dms[]
end
