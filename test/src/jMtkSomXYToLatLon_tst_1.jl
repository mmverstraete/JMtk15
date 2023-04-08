"""
    latitude, longitude = jMtkSomXYToLatLon_tst_1()

# Purpose:
Generate the output of `jMtkSomXYToLatLon` for testing purposes.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
```idl
IDL> path = 230
IDL> somx = 17145920.0
IDL> somy = 222090.0
IDL> status = MTK_SOMXY_TO_LATLON(path, somx, somy, latitude, longitude)
IDL> PRINT, latitude, longitude
       26.737612      -54.149628
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLatLon_tst_1.jl")
jMtkSomXYToLatLon_tst_1

julia> latitude, longitude = jMtkSomXYToLatLon_tst_1();

julia> @test (latitude, longitude) == (26.737612422281604, -54.149627910796426)
Test Passed
```
"""
function jMtkSomXYToLatLon_tst_1()
    path = 230
    somx = 17145920.0
    somy = 222090.0
    latitude, longitude = jMtkSomXYToLatLon(path, somx, somy)
    return latitude, longitude
end
