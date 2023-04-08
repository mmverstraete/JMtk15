"""
    degrees, minutes, seconds = jMtkDdToDegMinSec(decdeg)

# Purpose:
Convert decimal degrees to degrees, minutes, and seconds.

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

julia> degrees, minutes, seconds = jMtkDdToDegMinSec(decdeg);

julia> degrees
65

julia> minutes
30

julia> seconds
0.0
````
"""
function jMtkDdToDegMinSec(decdeg)
    degrees = Ref{Int32}(0)
    minutes = Ref{Int32}(0)
    seconds = Ref{Float64}(0.0)
    status = ccall((:MtkDdToDegMinSec, mtklib),
        Cint,
        (Cdouble, Ref{Cint}, Ref{Cint}, Ref{Cdouble}),
        decdeg, degrees, minutes, seconds)
    if status != 0
        error("jMtkDdToDegMinSec status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return degrees[], minutes[], seconds[]
end
