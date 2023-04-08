"""
    somx, somy = jMtkLatLonToSomXY_tst_1()

# Purpose:
Generate the output of `jMtkLatLonToSomXY` for testing purposes.

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
IDL> path = 160
IDL> latitude = 57.1
IDL> longitude = 65.7
IDL> status = MTK_LATLON_TO_SOMXY(path, latitude, longitude, somx, somy)
IDL> PRINT, somx, somy
       13677974.       686274.57
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLatLonToSomXY_tst_1.jl")
jMtkLatLonToSomXY_tst_1

julia> somx, somy = jMtkLatLonToSomXY_tst_1();

julia> @test (somx, somy) == (1.3677973731411265e7, 686274.716033836)
Test Passed
```
"""
function jMtkLatLonToSomXY_tst_1()
    path = 160
    latitude = 57.1
    longitude = 65.7
    somx, somy = jMtkLatLonToSomXY(path, latitude, longitude)
    return somx, somy
end
