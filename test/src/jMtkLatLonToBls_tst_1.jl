"""
    block, line, sample = jMtkLatLonToBls_tst_1()

# Purpose:
Generate the output of `jMtkLatLonToBls` for testing purposes.

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
IDL> resolution = 1100
IDL> latitude = 57.1
IDL> longitude = 65.7
IDL> status = MTK_LATLON_TO_BLS(path, resolution, latitude, longitude, block, line, sample)
IDL> PRINT, block, line, sample
          45      19.5220      207.886
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLatLonToBls_tst_1.jl")
jMtkLatLonToBls_tst_1

julia> block, line, sample = jMtkLatLonToBls_tst_1();

julia> @test (block, line, sample) == (45, 19.521484f0, 207.88611f0)
Test Passed
```
"""
function jMtkLatLonToBls_tst_1()
    path = 160
    resolution = 1100
    latitude = 57.1
    longitude = 65.7
    block, line, sample = jMtkLatLonToBls(path, resolution, latitude, longitude)
    return block, line, sample
end
