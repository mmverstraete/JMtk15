"""
    somx, somy = jMtkLatLonToSomXY(path, lat, lon)

# Purpose:
Convert from decimal latitude and longitude to Space Oblique Mercator (SOM) X and Y
   coordinates for a given MISR path.

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

julia> path = 160
160

julia> latitude = 57.1
57.1

julia> longitude = 65.7
65.7

julia> somx, somy = jMtkLatLonToSomXY(path, latitude, longitude)
(1.3677973731411265e7, 686274.716033836)
```
"""
function jMtkLatLonToSomXY(path, latitude, longitude)
    somx = Ref{Float64}(0.0)
    somy = Ref{Float64}(0.0)
    status = ccall((:MtkLatLonToSomXY, mtklib),
        Cint,
        (Cint, Cdouble, Cdouble, Ref{Cdouble}, Ref{Cdouble}),
        path, latitude, longitude, somx, somy)
    if status != 0
        error("MTK error $status: ", jMtkErrorMessage(status))
    end
    return somx[], somy[]
end
