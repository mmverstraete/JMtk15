"""
    databuf, mapinfo = jMtkReadData_tst_0100()

# Purpose:
Generate the output of `jMtkReadData` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> filename = root + 'MISR_AM1_AGP_P168_F01_24.hdf'
IDL> path = 168
IDL> start_block = 110
IDL> end_block = 110
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'Standard'
IDL> fieldname = 'SurfaceFeatureID'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> PRINT, databuf[460:465, 66:70]
   1   1   1   1   1   1
   1   1   1   2   2   2
   1   1   2   2   3   2
   2   2   3   3   2   3
   3   3   3   3   2   2
IDL> PRINT, mapinfo.resfactor
           4
IDL> PRINT, mapinfo.nline, mapinfo.nsample
         128         512
IDL> PRINT, mapinfo.som_ulc_x, mapinfo.som_ulc_y
       22808500.      -633600.00
IDL> PRINT, mapinfo.som_ctr_x, mapinfo.som_ctr_y
       22878350.      -352550.00
IDL> PRINT, mapinfo.som_lrc_x, mapinfo.som_lrc_y
       22948200.      -71500.000
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

julia> include(JMtk15_test * "src/jMtkReadData_tst_0100.jl")
jMtkReadData_tst_0100

julia> databuf, mapinfo = jMtkReadData_tst_0100();

julia> @test typeof(databuf) == Matrix{UInt8}
Test Passed

julia> @test size(databuf) == (512, 128)
Test Passed

julia> @test Int.(transpose(databuf[461:466, 67:71])) == Int.([
        1  1  1  1  1  1
        1  1  1  2  2  2
        1  1  2  2  3  2
        2  2  3  3  2  3
        3  3  3  3  2  2])
Test Passed

julia> @test mapinfo.resfactor == 4
Test Passed

julia> @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
Test Passed

julia> @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.28085e7, -633600.0), MTKt_SomCoord(2.287835e7, -352550.0), MTKt_SomCoord(2.29482e7, -71500.0))
Test Passed

julia> @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.28085e7, -633600.0)
Test Passed

julia> @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.287835e7, -352550.0)
Test Passed

julia> @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.29482e7, -71500.0)
Test Passed

julia> @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-23.58709279748763, 29.353665543180618), MTKt_GeoCoord(-24.0676258508188, 34.84437551586123), MTKt_GeoCoord(-24.479478582488763, 32.028724322255464), MTKt_GeoCoord(-25.323930208545036, 34.740509109113106), MTKt_GeoCoord(-24.838877358123973, 29.195643744542547))
Test Passed

julia> @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-23.58709279748763, 29.353665543180618)
Test Passed

julia> @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-24.0676258508188, 34.84437551586123)
Test Passed

julia> @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-24.479478582488763, 32.028724322255464)
Test Passed

julia> @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-25.323930208545036, 34.740509109113106)
Test Passed

julia> @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-24.838877358123973, 29.195643744542547)

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
function jMtkReadData_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    path = 168
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "Standard"
    fieldname = "SurfaceFeatureID"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    return databuf, mapinfo
end
