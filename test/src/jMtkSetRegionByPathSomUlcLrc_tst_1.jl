"""
    region = jMtkSetRegionByPathSomUlcLrc_tst_1()

# Purpose:
Generate the output of `jMtkSetRegionByPathSomUlcLrc` for testing purposes.

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
IDL> path = 27
IDL> ulc_som_x = 15600000.0
IDL> ulc_som_y = -300.0
IDL> lrc_som_x = 16800000.0
IDL> lrc_som_y = 2000.0
IDL> status = MTK_SETREGION_BY_PATH_SOM_ULC_LRC(path, ulc_som_x, ulc_som_y, lrc_som_x, lrc_som_y, region)
IDL> HELP, region, /STRUCT
** Structure <a39a528>, 4 tags, length=32, data length=32, refs=1:
   GEO_CTR_LAT     DOUBLE           35.384618
   GEO_CTR_LON     DOUBLE          -102.05138
   HEXTENT_XLAT    DOUBLE           600137.50
   HEXTENT_YLON    DOUBLE           1287.5000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSetRegionByPathSomUlcLrc_tst_1.jl")
jMtkSetRegionByPathSomUlcLrc_tst_1

julia> region = jMtkSetRegionByPathSomUlcLrc_tst_1();

julia> @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(35.38461751504492, -102.05138161671469)), MTKt_Extent(600137.5, 1287.5))
Test Passed

julia> @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(35.38461751504492, -102.05138161671469))
Test Passed

julia> @test region.geo.ctr == MTKt_GeoCoord(35.38461751504492, -102.05138161671469)
Test Passed

julia> @test region.geo.ctr.lat == 35.38461751504492
Test Passed

julia> @test region.geo.ctr.lon == -102.05138161671469
Test Passed

julia> @test region.hextent == MTKt_Extent(600137.5, 1287.5)
Test Passed

julia> @test region.hextent.xlat == 600137.5
Test Passed

julia> @test region.hextent.ylon == 1287.5
Test Passed
```
"""
function jMtkSetRegionByPathSomUlcLrc_tst_1()
    path = 27
    ulc_som_x = 15600000.0
    ulc_som_y = -300.0
    lrc_som_x = 16800000.0
    lrc_som_y = 2000.0
    region = jMtkSetRegionByPathSomUlcLrc(path, ulc_som_x, ulc_som_y, lrc_som_x, lrc_som_y)
    return region
end
