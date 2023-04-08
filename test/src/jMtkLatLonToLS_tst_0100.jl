"""
    line, sample = jMtkLatLonToLS_tst_0100()

# Purpose:
Generate the output of `jMtkLatLonToLS` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> gridname = 'Regional'
IDL> fieldname = 'RegAveSceneElev'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> latitude = -24.216289
IDL> longitude = 30.635970
IDL> status = MTK_LATLON_TO_LS(mapinfo, latitude, longitude, line, sample)
IDL> PRINT, line, sample
      2.65625      7.34374
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLatLonToLS_tst_0100.jl")
jMtkLatLonToLS_tst_0100

julia> line, sample = jMtkLatLonToLS_tst_0100();

julia> @test (line, sample) == (2.6562471f0, 7.3437467f0)
Test Passed
```
"""
function jMtkLatLonToLS_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    path = jMtkFileToPath(filename)
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "Regional"
    fieldname = "RegAveSceneElev"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    latitude = -24.216289
    longitude = 30.635970
    line, sample = jMtkLatLonToLS(mapinfo, latitude, longitude)
    return line, sample
end
