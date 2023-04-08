"""
    latitude, longitude = jMtkBlsToLatLon(path, resolution, block, line, sample)

# Purpose:
Convert from block, line and sample to latitude and longitude for a given MISR path
   and resolution.

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

julia> path = 189
189

julia> resolution = 275
275

julia> block = 47
47

julia> line = 12.5
12.5

julia> sample = 50.5
50.5

julia> latitude, longitude = jMtkBlsToLatLon(path, resolution, block, line, sample)
(55.16137325083296, 16.435317837222424)
```
"""
function jMtkBlsToLatLon(path, resolution, block, line, sample)
    latitude = Ref{Float64}(0.0)
    longitude = Ref{Float64}(0.0)
    status = ccall((:MtkBlsToLatLon, mtklib),
        Cint,
        (Cint, Cint, Cint, Cfloat, Cfloat, Ref{Cdouble}, Ref{Cdouble}),
        path, resolution, block, line, sample, latitude, longitude)
    if status != 0
        error("jMtkBlsToLatLon status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return latitude[], longitude[]
end
