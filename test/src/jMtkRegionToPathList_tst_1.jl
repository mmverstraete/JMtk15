"""
    path_cnt, path_list = jMtkRegionToPathList_tst_1()

# Purpose:
Generate the output of `jMtkRegionToPathList` for testing purposes.

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
IDL> latitude = 40.0
IDL> longitude = -120.0
IDL> lat_extent = 0.1
IDL> lon_extent = 0.1
IDL> extent_units = 'degrees'
IDL> status = MTK_SETREGION_BY_LATLON_EXTENT(latitude, longitude, lat_extent, lon_extent, extent_units, region)
IDL> status = MTK_REGION_TO_PATHLIST(region, path_cnt, path_list)
IDL> PRINT, path_cnt
           5
IDL> PRINT, path_list
          41          42          43          44          45
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkRegionToPathList_tst_1.jl")
jMtkRegionToPathList_tst_1

julia> path_cnt, path_list = jMtkRegionToPathList_tst_1();

julia> @test path_cnt == 5
Test Passed

julia> @test path_list == [41, 42, 43, 44, 45]
Test Passed
```
"""
function jMtkRegionToPathList_tst_1()
    center_lat = 40.0
    center_lon = -120.0
    lat_extent = 0.1
    lon_extent = 0.1
    extent_units = "degrees"
    region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)
    path_cnt, path_list = jMtkRegionToPathList(region)
    return path_cnt, path_list
end
