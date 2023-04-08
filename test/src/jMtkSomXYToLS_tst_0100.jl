"""
    line, sample = jMtkSomXYToLS_tst_0100()

# Purpose:
Generate the output of `jMtkSomXYToLS` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> somx = 22924110.
IDL> somy = -405350.00
IDL> status = MTK_SOMXY_TO_LS(mapinfo, somx, somy, line, sample)
IDL> PRINT, line, sample
      6.10000      12.5000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLS_tst_0100.jl")
jMtkSomXYToLS_tst_0100

julia> line, sample = jMtkSomXYToLS_tst_0100();

julia> @test (line, sample) == (6.1f0, 12.5f0)
Test Passed
```
"""
function jMtkSomXYToLS_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    path = jMtkFileToPath(filename)
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "Regional"
    fieldname = "RegAveSceneElev"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    somx = 22924110.
    somy = -405350.00
    line, sample = jMtkSomXYToLS(mapinfo, somx, somy)
    return line, sample
end
