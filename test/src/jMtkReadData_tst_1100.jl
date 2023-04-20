"""
    databuf, mapinfo = jMtkReadData_tst_1100()

# Purpose:
Generate the output of `jMtkReadData` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15)

# Verification:
```idl
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf'
IDL> path = 168
IDL> start_block = 108
IDL> end_block = 108
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'NIRBand'
IDL> fieldname = 'NIR Radiance/RDQI'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> PRINT, databuf[251:255, 4:9]
    9968   10720   10488    9420    7828
    9936   10816   11192   11000   10764
    9212    9552    9996   10176   10448
    8664    8668    8588    8364    9104
    8568    8576    8324    8212    8116
    8928    8972    8728    8732    8688
IDL> PRINT, mapinfo.resfactor
           4
IDL> PRINT, mapinfo.nline, mapinfo.nsample
         128         512
IDL> PRINT, mapinfo.som_ulc_x, mapinfo.som_ulc_y
       22526900.      -598400.00
IDL> PRINT, mapinfo.som_ctr_x, mapinfo.som_ctr_y
       22596750.      -317350.00
IDL> PRINT, mapinfo.som_lrc_x, mapinfo.som_lrc_y
       22666600.      -36300.000
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

julia> include(JMtk15_test * "src/jMtkReadData_tst_1100.jl")
jMtkReadData_tst_1100

julia> databuf, mapinfo = jMtkReadData_tst_1100();

julia> @test Int.(transpose(databuf[252:256, 5:10])) == [
       9968  10720  10488   9420   7828
       9936  10816  11192  11000  10764
       9212   9552   9996  10176  10448
       8664   8668   8588   8364   9104
       8568   8576   8324   8212   8116
       8928   8972   8728   8732   8688]
Test Passed

julia> @test mapinfo.resfactor == 4
Test Passed

julia> @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
Test Passed

julia> @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.25269e7, -598400.0), MTKt_SomCoord(2.259675e7, -317350.0), MTKt_SomCoord(2.26666e7, -36300.0))
Test Passed

julia> @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.25269e7, -598400.0)
Test Passed

julia> @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.259675e7, -317350.0)
Test Passed

julia> @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.26666e7, -36300.0)
Test Passed

julia> @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-21.097325373532644, 29.99582427938279), MTKt_GeoCoord(-21.55799831374879, 35.39028205545153), MTKt_GeoCoord(-21.97741330429874, 32.627475397777744), MTKt_GeoCoord(-22.814872931137558, 35.29073891830416), MTKt_GeoCoord(-22.350387571641914, 29.84908666726994))
Test Passed

julia> @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-21.097325373532644, 29.99582427938279)
Test Passed

julia> @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-21.55799831374879, 35.39028205545153)
Test Passed

julia> @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-21.97741330429874, 32.627475397777744)
Test Passed

julia> @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-22.814872931137558, 35.29073891830416)
Test Passed

julia> @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-22.350387571641914, 29.84908666726994)
Test Passed

julia> @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
Test Passed

julia> @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
Test Passed

julia> @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
Test Passed

julia> @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
Test Passed

julia> @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 128, 512)
Test Passed

julia> @test mapinfo.pp.reloffset[1:4] == [0.0, 16.0, 0.0, 16.0]
Test Passed
```
"""
function jMtkReadData_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"
    path = 168
    start_block = 108
    end_block = 108
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "NIRBand"
    fieldname = "NIR Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    return databuf, mapinfo
end
