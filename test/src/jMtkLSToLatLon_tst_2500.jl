"""
    latitude, longitude = jMtkLSToLatLon_tst_2500()

# Purpose:
Generate the output of `jMtkLSToLatLon` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf'
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> start_block = 108
IDL> end_block = 108
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'Motion_17.6_km'
IDL> fieldname = 'CloudTopHeightOfMotion'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 2.8
IDL> sample = 15.9
IDL> status = MTK_LS_TO_LATLON(mapinfo, line, sample, latitude, longitude)
IDL> PRINT, latitude, Longitude
      -21.872393       32.706175
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToLatLon_tst_2500.jl")
jMtkLSToLatLon_tst_2500

julia> latitude, longitude = jMtkLSToLatLon_tst_2500();

julia> @test (latitude, longitude) == (-21.872392767809703, 32.70617471105444)
Test Passed
```
"""
function jMtkLSToLatLon_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    path = jMtkFileToPath(filename)
    start_block = 108
    end_block = 108
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

    gridname = "Motion_17.6_km"
    fieldname = "CloudTopHeightOfMotion"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

    line = 2.8
    sample = 15.9
    latitude, longitude = jMtkLSToLatLon(mapinfo, line, sample)
    return latitude, longitude
end
