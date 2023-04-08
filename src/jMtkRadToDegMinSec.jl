"""
    degrees, minutes, seconds = jMtkRadToDegMinSec(radians)

# Purpose:
Convert radians to degrees, minutes, and seconds.

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

julia> radians = 1.14406333
1.14406333

julia> degrees, minutes, seconds = jMtkRadToDegMinSec(radians)
(65, 33, 0.0010968595743179321)
"""
function jMtkRadToDegMinSec(radians)
    degrees = Ref{Int32}(0)
    minutes = Ref{Int32}(0)
    seconds = Ref{Float64}(0.0)
    status = ccall((:MtkRadToDegMinSec, mtklib),
        Cint,
        (Cdouble, Ref{Cint}, Ref{Cint}, Ref{Cdouble}),
        radians, degrees, minutes, seconds)
    if status != 0
        error("jMtkRadToDegMinSec status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return degrees[], minutes[], seconds[]
end
