"""
    packed_dms = jMtkDdToDms(decdeg)

# Purpose:
Convert decimal degrees to packed degrees/minutes/seconds.

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

julia> decdeg = 65.5
65.5

julia> packed_dms = jMtkDdToDms(decdeg)
6.503e7
```
"""
function jMtkDdToDms(decdeg)
    packed_dms = Ref{Float64}(0.0)
    status = ccall((:MtkDdToDms, mtklib),
        Cint,
        (Cdouble, Ref{Cdouble}),
        decdeg, packed_dms)
    if status != 0
        error("jMtkDdToDms status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return packed_dms[]
end
