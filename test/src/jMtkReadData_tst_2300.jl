"""
    databuf, mapinfo = jMtkReadData_tst_2300()

# Purpose:
Generate the output of `jMtkReadData` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf'
IDL> path = 168
IDL> start_block = 107
IDL> end_block = 107
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'Stereo_1.1_km'
IDL> fieldname = 'CloudTopHeight'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> PRINT, databuf[243:247, 60:65]
     277     524     286     292     284
     281     536     303     299      33
       4     551     298     314      -4
     284     305     299     285     290
     283     292     527     565     291
     546     550     539     557     561
IDL> PRINT, mapinfo.resfactor
           4
IDL> PRINT, mapinfo.nline, mapinfo.nsample
         128         512
IDL> PRINT, mapinfo.som_ulc_x, mapinfo.som_ulc_y
       22386100.      -580800.00
IDL> PRINT, mapinfo.som_ctr_x, mapinfo.som_ctr_y
       22455950.      -299750.00
IDL> PRINT, mapinfo.som_lrc_x, mapinfo.som_lrc_y
       22525800.      -18700.000
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

julia> include(JMtk15_test * "src/jMtkReadData_tst_2300.jl")
jMtkReadData_tst_2300

julia> databuf, mapinfo = jMtkReadData_tst_2300();

julia> @test Int.(transpose(databuf[244:248, 61:66])) == [
       277  524  286  292  284
       281  536  303  299   33
         4  551  298  314   -4
       284  305  299  285  290
       283  292  527  565  291
       546  550  539  557  561]
Test Passed

julia> @test mapinfo.resfactor == 4
Test Passed

julia> @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
Test Passed

julia> @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.23861e7, -580800.0), MTKt_SomCoord(2.245595e7, -299750.0), MTKt_SomCoord(2.25258e7, -18700.0))
Test Passed

julia> @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.23861e7, -580800.0)
Test Passed

julia> @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.245595e7, -299750.0)
Test Passed

julia> @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.25258e7, -18700.0)
Test Passed

julia> @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-19.85083825300675, 30.30688322418754), MTKt_GeoCoord(-20.302597970112007, 35.65809597736565), MTKt_GeoCoord(-20.725296200820143, 32.91899135913688), MTKt_GeoCoord(-21.559729345920385, 35.56034690307178), MTKt_GeoCoord(-21.104475164861434, 30.165228506422512))
Test Passed

julia> @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-19.85083825300675, 30.30688322418754)
Test Passed

julia> @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-20.302597970112007, 35.65809597736565)
Test Passed

julia> @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-20.725296200820143, 32.91899135913688)
Test Passed

julia> @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-21.559729345920385, 35.56034690307178)
Test Passed

julia> @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-21.104475164861434, 30.165228506422512)
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
function jMtkReadData_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    path = 168
    start_block = 107
    end_block = 107
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "Stereo_1.1_km"
    fieldname = "CloudTopHeight"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    return databuf, mapinfo
end
