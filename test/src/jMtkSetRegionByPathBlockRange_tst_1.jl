"""
    region = jMtkSetRegionByPathBlockRange_tst_1()

# Purpose:
Generate the output of `jMtkSetRegionByPathBlockRange` for testing purposes.

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
IDL> start_block = 32
IDL> end_block = 40
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> HELP, region, /STRUCT
** Structure <a53fd28>, 4 tags, length=32, data length=32, refs=1:
   GEO_CTR_LAT     DOUBLE           67.286285
   GEO_CTR_LON     DOUBLE          -95.222042
   HEXTENT_XLAT    DOUBLE           633462.50
   HEXTENT_YLON    DOUBLE           307862.50
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSetRegionByPathBlockRange_tst_1.jl")
jMtkSetRegionByPathBlockRange_tst_1

julia> region = jMtkSetRegionByPathBlockRange_tst_1();

julia> @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(67.28628518822661, -95.22204196033839)), MTKt_Extent(633462.5, 307862.5))
Test Passed

julia> @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(67.28628518822661, -95.22204196033839))
Test Passed

julia> @test region.geo.ctr == MTKt_GeoCoord(67.28628518822661, -95.22204196033839)
Test Passed

julia> @test region.geo.ctr.lat == 67.28628518822661
Test Passed

julia> @test region.geo.ctr.lon == -95.22204196033839
Test Passed

julia> @test region.hextent == MTKt_Extent(633462.5, 307862.5)
Test Passed

julia> @test region.hextent.xlat == 633462.5
Test Passed

julia> @test region.hextent.ylon == 307862.5
Test Passed
```
"""
function jMtkSetRegionByPathBlockRange_tst_1()
    path = 37
    start_block = 32
    end_block = 40
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    return region
end
