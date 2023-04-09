"""
    mapinfo = jMtkSnapToGrid_tst_1()

# Purpose:
Generate the output of `jMtkSnapToGrid` for testing purposes.

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
IDL> center_lat = 66.0
IDL> center_lon = -89.0
IDL> lat_extent = 1.5
IDL> lon_extent = 1.0
IDL> extent_units = 'degrees'
IDL> status = MTK_SETREGION_BY_LATLON_EXTENT(latitude, longitude, lat_extent, lon_extent, extent_units, region)
IDL> path = 37
IDL> resolution = 275
IDL> status = MTK_SNAP_TO_GRID(path, resolution, region, mapinfo)
IDL> HELP, mapinfo, /STRUCT
** Structure <f054808>, 37 tags, length=1072, data length=1064, refs=1:
   PATH            LONG                37
   START_BLOCK     LONG                36
   END_BLOCK       LONG                37
   RESOLUTION      LONG               275
   RESFACTOR       LONG                 1
   NLINE           LONG               704
   NSAMPLE         LONG               512
   PIXEL_CENTER    LONG                 1
   SOM_PATH        LONG                37
   SOM_ULC_X       DOUBLE           12388888.
   SOM_ULC_Y       DOUBLE           1055587.5
   SOM_CTR_X       DOUBLE           12485550.
   SOM_CTR_Y       DOUBLE           1125850.0
   SOM_LRC_X       DOUBLE           12582212.
   SOM_LRC_Y       DOUBLE           1196112.5
   GEO_ULC_LAT     DOUBLE           67.031795
   GEO_ULC_LON     DOUBLE          -89.538267
   GEO_URC_LAT     DOUBLE           66.460995
   GEO_URC_LON     DOUBLE          -86.699616
   GEO_CTR_LAT     DOUBLE           65.977994
   GEO_CTR_LON     DOUBLE          -89.065521
   GEO_LRC_LAT     DOUBLE           64.923469
   GEO_LRC_LON     DOUBLE          -88.628704
   GEO_LLC_LAT     DOUBLE           65.459020
   GEO_LLC_LON     DOUBLE          -91.340718
   PP_PATH         LONG                37
   PP_PROJCODE     LONG                 0
   PP_ZONECODE     LONG                22
   PP_SPHERECODE   LONG                 0
   PP_PROJPARAM    DOUBLE    Array[15]
   PP_ULC_BLOCK1   DOUBLE    Array[2]
   PP_LRC_BLOCK1   DOUBLE    Array[2]
   PP_NBLOCK       LONG       -2147483648
   PP_NLINE        LONG        1096613731
   PP_NSAMPLE      LONG                 0
   PP_RELOFFSET    FLOAT     Array[179]
   PP_RESOLUTION   LONG                 0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSnapToGrid_tst_1.jl")
jMtkSnapToGrid_tst_1

julia> mapinfo = jMtkSnapToGrid_tst_1();

julia> @test mapinfo.path == 37
Test Passed

julia> @test mapinfo.start_block == 36
Test Passed

julia> @test mapinfo.end_block == 37
Test Passed

julia> @test mapinfo.resolution == 275
Test Passed

julia> @test mapinfo.nline == 704
Test Passed

julia> @test mapinfo.nsample == 512
Test Passed

julia> @test mapinfo.som.ulc == MTKt_SomCoord(1.23888875e7, 1.0555875e6)
Test Passed

julia> @test mapinfo.som.ctr.x == 1.248555e7
Test Passed

julia> @test mapinfo.som.lrc.y == 1.1961125e6
Test Passed

julia> @test mapinfo.geo.ulc.lat == 67.03179518448705
Test Passed

julia> @test mapinfo.geo.urc.lon == -86.6996155055143
Test Passed

julia> @test mapinfo.pp.ulc[1] == 7.46075e6
Test Passed

julia> @test mapinfo.pp.lrc[2] == 527450.0
Test Passed
```
"""
function jMtkSnapToGrid_tst_1()
    path = 37
    resolution = 275
    center_lat = 66.0
    center_lon = -89.0
    lat_extent = 1.5
    lon_extent = 1.0
    extent_units = "degrees"
    region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)
    mapinfo = jMtkSnapToGrid(path, resolution, region)
    return mapinfo
end
