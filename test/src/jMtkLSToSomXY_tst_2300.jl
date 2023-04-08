"""
    somx, somy = jMtkLSToSomXY_tst_2300()

# Purpose:
Generate the output of `jMtkLSToSomXY` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> path = 168
IDL> start_block = 105
IDL> end_block = 105
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'Stereo_1.1_km'
IDL> fieldname = 'StereoDerivedCloudMask'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 112.3
IDL> sample = 215.6
IDL> status = MTK_LS_TO_SOMXY(mapinfo, line, sample, somx, somy)
IDL> PRINT, somx, somy
       22228030.      -308440.00
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToSomXY_tst_2300.jl")
jMtkLSToSomXY_tst_2300

julia> somx, somy = jMtkLSToSomXY_tst_2300();

julia> @test (somx, somy) == (2.222803e7, -308440.0)
Test Passed
```
"""
function jMtkLSToSomXY_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    path = jMtkFileToPath(filename)
    start_block = 105
    end_block = 105
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "Stereo_1.1_km"
    fieldname = "StereoDerivedCloudMask"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    line = 112.3
    sample = 215.6
    somx, somy = jMtkLSToSomXY(mapinfo, line, sample)
    return somx, somy
end
