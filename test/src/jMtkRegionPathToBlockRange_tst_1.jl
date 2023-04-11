"""
    start_block, end_block = jMtkRegionPathToBlockRange_tst_1()

# Purpose:
Generate the output of `jMtkRegionPathToBlockRange` for testing purposes.

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
IDL> path = 37
IDL> latitude = 66.0
IDL> longitude = -89.0
IDL> lat_extent = 10.0
IDL> lon_extent = 10.0
IDL> status = MTK_SETREGION_BY_LATLON_EXTENT(latitude, longitude, lat_extent, lon_extent, 'degrees', region)
IDL> status = MTK_REGION_PATH_TO_BLOCKRANGE(region, path, start_block, end_block)
IDL> PRINT, start_block, end_block
          32          40
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkRegionPathToBlockRange_tst_1.jl")
jMtkRegionPathToBlockRange_tst_1

julia> start_block, end_block = jMtkRegionPathToBlockRange_tst_1();

julia> @test (start_block, end_block) == (32, 40)
Test Passed
```
"""
function jMtkRegionPathToBlockRange_tst_1()
    path = 37
    latitude = 66.0
    longitude = -89.0
    lat_extent = 10.0
    lon_extent = 10.0
    extent_units = "degrees"
    region = jMtkSetRegionByLatLonExtent(latitude, longitude, lat_extent, lon_extent, extent_units)
    start_block, end_block = jMtkRegionPathToBlockRange(region, path)
    return start_block, end_block
end
