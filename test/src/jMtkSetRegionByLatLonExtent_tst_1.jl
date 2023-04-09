"""
    region = jMtkSetRegionByLatLonExtent_tst_1()

# Purpose:
Generate the output of `jMtkSetRegionByLatLonExtent` for testing purposes.

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
IDL> lat_extent = 111000.0
IDL> lon_extent = 111000.0
IDL> extent_units = "meters"
IDL> status = MTK_SETREGION_BY_LATLON_EXTENT(center_lat, center_lon, lat_extent, lon_extent, extent_units, region)
IDL> HELP, region, /STRUCT
** Structure <a3c0728>, 4 tags, length=32, data length=32, refs=1:
   GEO_CTR_LAT     DOUBLE           66.000000
   GEO_CTR_LON     DOUBLE          -89.000000
   HEXTENT_XLAT    DOUBLE           55500.000
   HEXTENT_YLON    DOUBLE           55500.000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSetRegionByLatLonExtent_tst_1.jl")
jMtkSetRegionByLatLonExtent_tst_1

julia> region = jMtkSetRegionByLatLonExtent_tst_1();

julia> @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(55500.0, 55500.0))
Test Passed

julia> @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0))
Test Passed

julia> @test region.geo.ctr == MTKt_GeoCoord(66.0, -89.0)
Test Passed

julia> @test region.geo.ctr.lat == 66.0
Test Passed

julia> @test region.geo.ctr.lon == -89.0
Test Passed

julia> @test region.hextent == MTKt_Extent(55500.0, 55500.0)
Test Passed

julia> @test region.hextent.xlat == 55500.0
Test Passed

julia> @test region.hextent.ylon == 55500.0
Test Passed
```
"""
function jMtkSetRegionByLatLonExtent_tst_1()
    center_lat = 66.0
    center_lon = -89.0
    lat_extent = 111000.0
    lon_extent = 111000.0
    extent_units = "meters"
    region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units);
    return region
end
