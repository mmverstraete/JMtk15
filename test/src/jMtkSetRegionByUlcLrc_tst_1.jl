"""
    region = MtkSetRegionByUlcLrc_tst_1()

# Purpose:
Generate the output of `MtkSetRegionByUlcLrc` for testing purposes.

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
IDL> ul_lat = 67.0
IDL> ul_lon = -90.0
IDL> lr_lat = 65.0
IDL> lr_lon = -88.0
IDL> status = MTK_SETREGION_BY_ULC_LRC(ul_lat, ul_lon, lr_lat, lr_lon, region)
IDL> HELP, region, /STRUCT
** Structure <a461428>, 4 tags, length=32, data length=32, refs=1:
   GEO_CTR_LAT     DOUBLE           66.000000
   GEO_CTR_LON     DOUBLE          -89.000000
   HEXTENT_XLAT    DOUBLE           111319.54
   HEXTENT_YLON    DOUBLE           111319.54
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSetRegionByUlcLrc_tst_1.jl")
MtkSetRegionByUlcLrc_tst_1

julia> region = jMtkSetRegionByUlcLrc_tst_1();

julia> @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(111319.54315, 111319.54315))
Test Passed

julia> @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0))
Test Passed

julia> @test region.geo.ctr == MTKt_GeoCoord(66.0, -89.0)
Test Passed

julia> @test region.geo.ctr.lat == 66.0
Test Passed

julia> @test region.geo.ctr.lon == -89.0
Test Passed

julia> @test region.hextent == MTKt_Extent(111319.54315, 111319.54315)
Test Passed

julia> @test region.hextent.xlat == 111319.54315
Test Passed

julia> @test region.hextent.ylon == 111319.54315
Test Passed
```
"""
function jMtkSetRegionByUlcLrc_tst_1()
    ul_lat = 67.0
    ul_lon = -90.0
    lr_lat = 65.0
    lr_lon = -88.0
    region = jMtkSetRegionByUlcLrc(ul_lat, ul_lon, lr_lat, lr_lon)
    return region
end
