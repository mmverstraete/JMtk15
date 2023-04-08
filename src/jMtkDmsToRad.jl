"""
    radians = jMtkDmsToRad(packed_dms)

# Purpose:
Convert packed degrees/minutes/seconds to radians.

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

julia> packed_dms = 65033000.010
6.503300001e7

julia> radians = jMtkDmsToRad(packed_dms)
1.144063373163641
```
"""
function jMtkDmsToRad(packed_dms)
    radians = Ref{Float64}(0.0)
    status = ccall((:MtkDmsToRad, mtklib),
        Cint,
        (Cdouble, Ref{Cdouble}),
        packed_dms, radians)
    if status != 0
        error("jMtkDmsToRad status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return radians[]
end
