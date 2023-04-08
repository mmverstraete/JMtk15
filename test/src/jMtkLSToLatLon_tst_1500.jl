"""
    latitude, longitude = jMtkLSToLatLon_tst_1500()

# Purpose:
Generate the output of `jMtkLSToLatLon` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> start_block = 110
IDL> end_block = 110
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'RCCM'
IDL> fieldname = 'Glitter'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 60.5
IDL> sample = 300.3
IDL> status = MTK_LS_TO_LATLON(mapinfo, line, sample, latitude, longitude)
IDL> PRINT, latitude, longitude
      -24.491394       32.515787
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToLatLon_tst_1500.jl")
jMtkLSToLatLon_tst_1500

julia> latitude, longitude = jMtkLSToLatLon_tst_1500();

julia> @test (latitude, longitude) == (-24.491393852709678, 32.515787119559384)
Test Passed
```
"""
function jMtkLSToLatLon_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf"
    path = jMtkFileToPath(filename)
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

    gridname = "RCCM"
    fieldname = "Glitter"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

    line = 60.5
    sample = 300.3
    latitude, longitude = jMtkLSToLatLon(mapinfo, line, sample)
    return latitude, longitude
end
