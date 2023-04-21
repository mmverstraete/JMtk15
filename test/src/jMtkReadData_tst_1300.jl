"""
    databuf, mapinfo = jMtkReadData_tst_1300()

# Purpose:
Generate the output of `jMtkReadData` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf'
IDL> path = 168
IDL> start_block = 109
IDL> end_block = 109
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'RedBand'
IDL> fieldname = 'Red Radiance/RDQI'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> PRINT, databuf[1010:1014, 200:204]
    4656    4704    4372    4512    4744
    4236    4256    4436    4480    4472
    4468    4624    4200    3764    3764
    4792    4736    4208    3720    3624
    4948    4808    4380    4140    4152
IDL> PRINT, mapinfo.resfactor
           1
IDL> PRINT, mapinfo.nline, mapinfo.nsample
         512        2048
IDL> PRINT, mapinfo.som_ulc_x, mapinfo.som_ulc_y
       22667288.      -616412.50
IDL> PRINT, mapinfo.som_ctr_x, mapinfo.som_ctr_y
       22737550.      -334950.00
IDL> PRINT, mapinfo.som_lrc_x, mapinfo.som_lrc_y
       22807812.      -53487.500
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

julia> include(JMtk15_test * "src/jMtkReadData_tst_1300.jl")
jMtkReadData_tst_1300

julia> databuf, mapinfo = jMtkReadData_tst_1300();

julia> @test typeof(databuf) == Matrix{UInt16}
Test Passed

julia> @test size(databuf) == (2048, 512)
Test Passed

julia> @test Int.(transpose(databuf[1011:1015, 201:205])) == [
       4656  4704  4372  4512  4744
       4236  4256  4436  4480  4472
       4468  4624  4200  3764  3764
       4792  4736  4208  3720  3624
       4948  4808  4380  4140  4152]
Test Passed

julia> @test mapinfo.resfactor == 1
Test Passed

julia> @test (mapinfo.nline, mapinfo.nsample) == (512, 2048)
Test Passed

julia> @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.26672875e7, -616412.5), MTKt_SomCoord(2.273755e7, -334950.0), MTKt_SomCoord(2.28078125e7, -53487.5))
Test Passed

julia> @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.26672875e7, -616412.5)
Test Passed

julia> @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.273755e7, -334950.0)
Test Passed

julia> @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.28078125e7, -53487.5)
Test Passed

julia> @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-22.338655196971448, 29.67470803381622), MTKt_GeoCoord(-22.809586710229873, 35.123460533247695), MTKt_GeoCoord(-23.22882451114302, 32.33086052347723), MTKt_GeoCoord(-24.07360545797157, 35.02132140431515), MTKt_GeoCoord(-23.59848983222742, 29.521588205306525))
Test Passed

julia> @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-22.338655196971448, 29.67470803381622)
Test Passed

julia> @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-22.809586710229873, 35.123460533247695)
Test Passed

julia> @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-23.22882451114302, 32.33086052347723)
Test Passed

julia> @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-24.07360545797157, 35.02132140431515)
Test Passed

julia> @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-23.59848983222742, 29.521588205306525)
Test Passed

julia> @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
Test Passed

julia> @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
Test Passed

julia> @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
Test Passed

julia> @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
Test Passed

julia> @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 512, 2048)
Test Passed

julia> @test mapinfo.pp.reloffset[1:4] == [0.0, 64.0, 0.0, 64.0]
Test Passed
```
"""
function jMtkReadData_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    path = 168
    start_block = 109
    end_block = 109
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "RedBand"
    fieldname = "Red Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    return databuf, mapinfo
end
