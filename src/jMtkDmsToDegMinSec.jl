"""
    degrees, minutes, seconds = jMtkDmsToDegMinSec(packed_dms)

# Purpose:
Convert packed degrees/minutes/seconds to degrees, minutes, and seconds.

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

julia> packed_dms = 65033011.1
6.50330111e7

julia> degrees, minutes, seconds = jMtkDmsToDegMinSec(packed_dms)
(65, 33, 11.100000001490116)
```
"""
function jMtkDmsToDegMinSec(packed_dms)
    degrees = Ref{Int32}(0)
    minutes = Ref{Int32}(0)
    seconds = Ref{Float64}(0.0)
    status = ccall((:MtkDmsToDegMinSec, mtklib),
        Cint,
        (Cdouble, Ref{Cint}, Ref{Cint}, Ref{Cdouble}),
        packed_dms, degrees, minutes, seconds)
    if status != 0
        error("jMtkDmsToDegMinSec status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return degrees[], minutes[], seconds[]
end
