"""
    latitude, longitude = jMtkLSToLatLon_tst_1000()

# Purpose:
Generate the output of `jMtkLSToLatLon` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> start_block = 110
IDL> end_block = 110
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'GeometricParameters'
IDL> fieldname = 'AnScatter'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 5.2
IDL> sample = 16.5
IDL> status = MTK_LS_TO_LATLON(mapinfo, line, sample, latitude, longitude)
IDL> PRINT, latitude, longitude
      -24.763422       32.173787
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToLatLon_tst_1000.jl")
jMtkLSToLatLon_tst_1000

julia> latitude, longitude = jMtkLSToLatLon_tst_1000();

julia> @test (latitude, longitude) == (-24.763422014332374, 32.17378749123402)
Test Passed
```
"""
function jMtkLSToLatLon_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    path = jMtkFileToPath(filename)
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

    gridname = "GeometricParameters"
    fieldname = "AnScatter"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

    line = 5.2
    sample = 16.5
    latitude, longitude = jMtkLSToLatLon(mapinfo, line, sample)
    return latitude, longitude
end
