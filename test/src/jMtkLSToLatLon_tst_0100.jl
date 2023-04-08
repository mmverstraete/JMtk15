"""
    latitude, longitude = jMtkLSToLatLon_tst_0100()

# Purpose:
Generate the output of `jMtkLSToLatLon` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> start_block = 110
IDL> end_block = 110
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'Standard'
IDL> fieldname = 'GeoLatitude'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 50.0
IDL> sample = 125.0
IDL> status = MTK_LS_TO_LATLON(mapinfo, line, sample, latitude, longitude)
IDL> PRINT, latitude, longitude
      -24.216289       30.635971
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToLatLon_tst_0100.jl")
jMtkLSToLatLon_tst_0100

julia> latitude, longitude = jMtkLSToLatLon_tst_0100();

julia> @test (latitude, longitude) == (-24.216289492769953, 30.63597054987332)
Test Passed
```
"""
function jMtkLSToLatLon_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    path = jMtkFileToPath(filename)
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

    gridname = "Standard"
    fieldname = "GeoLatitude"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

    line = 50.0
    sample = 125.0
    latitude, longitude = jMtkLSToLatLon(mapinfo, line, sample)
    return latitude, longitude
end
