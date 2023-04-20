"""
    databuf, mapinfo = jMtkReadData_tst_1500()

# Purpose:
Generate the output of `jMtkReadData` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf'
IDL> path = 168
IDL> start_block = 112
IDL> end_block = 112
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'RCCM'
IDL> fieldname = 'Cloud'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> PRINT, databuf[387:391, 21:26]
   4   2   3   4   4
   4   4   3   4   4
   4   4   2   4   2
   4   3   1   4   4
   4   2   1   4   4
   4   2   2   4   4
IDL> PRINT, mapinfo.resfactor
           4
IDL> PRINT, mapinfo.nline, mapinfo.nsample
         128         512
IDL> PRINT, mapinfo.som_ulc_x, mapinfo.som_ulc_y
       23090100.      -668800.00
IDL> PRINT, mapinfo.som_ctr_x, mapinfo.som_ctr_y
       23159950.      -387750.00
IDL> PRINT, mapinfo.som_lrc_x, mapinfo.som_lrc_y
       23229800.      -106700.00
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

julia> include(JMtk15_test * "src/jMtkReadData_tst_1500.jl")
jMtkReadData_tst_1500

julia> databuf, mapinfo = jMtkReadData_tst_1500();

julia> @test Int.(transpose(databuf[388:392, 22:27])) == [
       4  2  3  4  4
       4  4  3  4  4
       4  4  2  4  2
       4  3  1  4  4
       4  2  1  4  4
       4  2  2  4  4]
Test Passed

julia> @test mapinfo.resfactor == 4
Test Passed

julia> @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
Test Passed

julia> @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.30901e7, -668800.0), MTKt_SomCoord(2.315995e7, -387750.0), MTKt_SomCoord(2.32298e7, -106700.0))
Test Passed

julia> @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.30901e7, -668800.0)
Test Passed

julia> @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.315995e7, -387750.0)
Test Passed

julia> @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.32298e7, -106700.0)
Test Passed

julia> @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-26.0721209058142, 28.681521176903196), MTKt_GeoCoord(-26.575431877271235, 34.28232743548915), MTKt_GeoCoord(-26.978298006176956, 31.40606162364945), MTKt_GeoCoord(-27.83108760787897, 34.173044569161036), MTKt_GeoCoord(-27.3224387040438, 28.51053243188757))
Test Passed

julia> @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-26.0721209058142, 28.681521176903196)
Test Passed

julia> @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-26.575431877271235, 34.28232743548915)
Test Passed

julia> @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-26.978298006176956, 31.40606162364945)
Test Passed

julia> @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-27.83108760787897, 34.173044569161036)
Test Passed

julia> @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-27.3224387040438, 28.51053243188757)
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
function jMtkReadData_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf"
    path = 168
    start_block = 112
    end_block = 112
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "RCCM"
    fieldname = "Cloud"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    return databuf, mapinfo
end
