"""
    latitude, longitude = jMtkBlsToLatLon_tst_1()

# Purpose:
Generate the output of `jMtkBlsToLatLon` for testing purposes.

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
IDL> path = 189
IDL> resolution = 275
IDL> block = 47
IDL> line = 12.5
IDL> sample = 50.5
IDL> status = MTK_BLS_TO_LATLON(path, resolution, block, line, sample, latitude, longitude)
IDL> PRINT, latitude, longitude
       55.161373       16.435318
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkBlsToLatLon_tst_1.jl")
jMtkBlsToLatLon_tst_1

julia> latitude, longitude = jMtkBlsToLatLon_tst_1();

julia> @test (latitude, longitude) == (55.16137325083296, 16.435317837222424)
Test Passed
```
"""
function jMtkBlsToLatLon_tst_1()
    path = 189
    resolution = 275
    block = 47
    line = 12.5
    sample = 50.5
    latitude, longitude = jMtkBlsToLatLon(path, resolution, block, line, sample)
    return latitude, longitude
end
