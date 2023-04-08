"""
    line, sample = jMtkSomXYToLS_tst_1300()

# Purpose:
Generate the output of `jMtkSomXYToLS` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf'
IDL> path = 168
IDL> start_block = 109
IDL> end_block = 109
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'GreenBand'
IDL> fieldname = 'Green Radiance/RDQI'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> somx = 22725670.
IDL> somy = -258280.00
IDL> status = MTK_SOMXY_TO_LS(mapinfo, somx, somy, line, sample)
IDL> PRINT, line, sample
      52.7000      325.200
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLS_tst_1300.jl")
jMtkSomXYToLS_tst_1300

julia> line, sample = jMtkSomXYToLS_tst_1300();

julia> @test (line, sample) == (52.7f0, 325.2f0)
Test Passed
```
"""
function jMtkSomXYToLS_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
    path = jMtkFileToPath(filename)
    start_block = 109
    end_block = 109
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "GreenBand"
    fieldname = "Green Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    somx = 22725670.
    somy = -258280.00
    line, sample = jMtkSomXYToLS(mapinfo, somx, somy)
    return line, sample
end
