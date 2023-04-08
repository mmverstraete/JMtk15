"""
    latitude, longitude = jMtkLSToLatLon_tst_1100()

# Purpose:
Generate the output of `jMtkLSToLatLon` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf'
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> start_block = 111
IDL> end_block = 111
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'BRF Conversion Factors'
IDL> fieldname = 'NIRConversionFactor'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 3.8
IDL> sample = 17.6
IDL> status = MTK_LS_TO_LATLON(mapinfo, line, sample, latitude, longitude)
IDL> PRINT, latitude, Longitude
      -25.808810       32.082302
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToLatLon_tst_1100.jl")
jMtkLSToLatLon_tst_1100

julia> latitude, longitude = jMtkLSToLatLon_tst_1100();

julia> @test (latitude, longitude) == (-25.808810030321773, 32.082301626959335)
Test Passed
```
"""
function jMtkLSToLatLon_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"
    path = jMtkFileToPath(filename)
    start_block = 111
    end_block = 111
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

    gridname = "BRF Conversion Factors"
    fieldname = "NIRConversionFactor"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

    line = 3.8
    sample = 17.6
    latitude, longitude = jMtkLSToLatLon(mapinfo, line, sample)
    return latitude, longitude
end
