"""
    databuf, mapinfo = jMtkReadData_tst_1000()

# Purpose:
Generate the output of `jMtkReadData` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> filename = root + 'MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf'
IDL> path = 168
IDL> start_block = 111
IDL> end_block = 111
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'GeometricParameters'
IDL> fieldname = 'SolarZenith'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> PRINT, databuf[15:18, 3:4]
       31.394946       31.283454       31.172320       31.061547
       31.499543       31.388437       31.277690       31.167306
IDL> PRINT, mapinfo.resfactor
          64
IDL> PRINT, mapinfo.nline, mapinfo.nsample
           8          32
IDL> PRINT, mapinfo.som_ulc_x, mapinfo.som_ulc_y
       22957550.      -642950.00
IDL> PRINT, mapinfo.som_ctr_x, mapinfo.som_ctr_y
       23019150.      -370150.00
IDL> PRINT, mapinfo.som_lrc_x, mapinfo.som_lrc_y
       23080750.      -97350.000
IDL> PRINT, mapinfo.pp_projcode, mapinfo.pp_zonecode, mapinfo.pp_spherecode
           0          22           0
IDL> PRINT, mapinfo.pp_projparam[2:6]
       6378137.0   -0.0066943480       0.0000000       98018014.  -1.3001505e+08
IDL> PRINT, mapinfo.pp_projparam[10], mapinfo.pp_projparam[13]
       98.880000       180.00000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadData_tst_1000.jl")
jMtkReadData_tst_1000

julia> databuf, mapinfo = jMtkReadData_tst_1000();

julia> @test typeof(databuf) == Matrix{Float64}
Test Passed

julia> @test size(databuf) == (32, 8)
Test Passed

julia> @test transpose(databuf[16:19, 4:5]) == [
       31.3949458411467 31.283454456643128 31.172319983604712 31.061547430619207;
       31.49954269576102 31.38843722293199 31.27768970248382 31.16730618391117]
Test Passed

julia> @test mapinfo.resfactor == 64
Test Passed

julia> @test (mapinfo.nline, mapinfo.nsample) == (8, 32)
Test Passed

julia> @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.295755e7, -642950.0), MTKt_SomCoord(2.301915e7, -370150.0), MTKt_SomCoord(2.308075e7, -97350.0))
Test Passed

julia> @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.295755e7, -642950.0)
Test Passed

julia> @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.301915e7, -370150.0)
Test Passed

julia> @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.308075e7, -97350.0)
Test Passed

julia> @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-24.912833295792158, 29.09305892265543), MTKt_GeoCoord(-25.390243230498008, 34.47763492777933), MTKt_GeoCoord(-25.72932186715566, 31.72061762407402), MTKt_GeoCoord(-26.497900285059888, 34.383017256768206), MTKt_GeoCoord(-26.0162837384446, 28.948916592857373))
Test Passed

julia> @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-24.912833295792158, 29.09305892265543)
Test Passed

julia> @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-25.390243230498008, 34.47763492777933)
Test Passed

julia> @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-25.72932186715566, 31.72061762407402)
Test Passed

julia> @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-26.497900285059888, 34.383017256768206)
Test Passed

julia> @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-26.0162837384446, 28.948916592857373)
Test Passed

julia> @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
Test Passed

julia> @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
Test Passed

julia> @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
Test Passed

julia> @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
Test Passed

julia> @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 8, 32)
Test Passed

julia> @test mapinfo.pp.reloffset[1:4] == [0.0, 1.0, 0.0, 1.0]
Test Passed
```
"""
function jMtkReadData_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    path = 168
    start_block = 111
    end_block = 111
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "GeometricParameters"
    fieldname = "SolarZenith"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    return databuf, mapinfo
end
