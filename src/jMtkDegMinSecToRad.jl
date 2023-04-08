"""
    radians = jMtkDegMinSecToRad(deg, minutes, seconds)

# Purpose:
Convert degrees, minutes, and seconds to radians.

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

julia> degrees = 65
65

julia> minutes = 33
33

julia> seconds = 0.001
0.001

julia> radians = jMtkDegMinSecToRad(degrees, minutes, seconds)
1.1440633295304197
````
"""
function jMtkDegMinSecToRad(degrees, minutes, seconds)
    radians = Ref{Float64}(0.0)
    status = ccall((:MtkDegMinSecToRad, mtklib),
        Cint,
        (Cint, Cint, Cdouble, Ref{Cdouble}),
        degrees, minutes, seconds, radians)
    if status != 0
        error("jMtkDegMinSecToRad status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return radians[]
end
