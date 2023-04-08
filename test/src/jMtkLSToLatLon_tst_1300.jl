"""
    latitude, longitude = jMtkLSToLatLon_tst_1300()

# Purpose:
Generate the output of `jMtkLSToLatLon` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> start_block = 112
IDL> end_block = 112
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'BlueBand'
IDL> fieldname = 'Blue Radiance/RDQI'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 72.1
IDL> sample = 199.4
IDL> status = MTK_LS_TO_LATLON(mapinfo, line, sample, latitude, longitude)
IDL> PRINT, latitude, Longitude
      -27.006269       30.777888
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToLatLon_tst_1300.jl")
jMtkLSToLatLon_tst_1300

julia> latitude, longitude = jMtkLSToLatLon_tst_1300();

julia> @test (latitude, longitude) == (-27.006268920147406, 30.77788841016984)
Test Passed
```
"""
function jMtkLSToLatLon_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    path = jMtkFileToPath(filename)
    start_block = 112
    end_block = 112
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

    gridname = "BlueBand"
    fieldname = "Blue Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

    line = 72.1
    sample = 199.4
    latitude, longitude = jMtkLSToLatLon(mapinfo, line, sample)
    return latitude, longitude
end
