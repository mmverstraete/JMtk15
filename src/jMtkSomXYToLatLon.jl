"""
    latitude, longitude = jMtkSomXYToLatLon(path, somx, somy)

# Purpose:
Converts from Space Oblique Mercator (SOM) X and Y coordinates to decimal latitude
   and longitude or a given MISR path.

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

julia> path = 230
230

julia> somx = 17145920.0
1.714592e7

julia> somy = 222090.0
222090.0

julia> latitude, longitude = jMtkSomXYToLatLon(path, somx, somy)
(26.737612422281604, -54.149627910796426)
```
"""
function jMtkSomXYToLatLon(path, somx, somy)
    latitude = Ref{Float64}(0.0)
    longitude = Ref{Float64}(0.0)
    status = ccall((:MtkSomXYToLatLon, mtklib),
        Cint,
        (Cint, Cdouble, Cdouble, Ref{Cdouble}, Ref{Cdouble}),
        path, somx, somy, latitude, longitude)
    if status != 0
        error("jMtkSomXYToLatLon status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return latitude[], longitude[]
end
