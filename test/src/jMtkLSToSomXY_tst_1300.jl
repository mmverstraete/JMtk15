"""
    somx, somy = jMtkLSToSomXY_tst_1300()

# Purpose:
Generate the output of `jMtkLSToSomXY` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> line = 52.7
IDL> sample = 325.2
IDL> status = MTK_LS_TO_SOMXY(mapinfo, line, sample, somx, somy)
IDL> PRINT, somx, somy
       22725670.      -258280.00
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToSomXY_tst_1300.jl")
jMtkLSToSomXY_tst_1300

julia> somx, somy = jMtkLSToSomXY_tst_1300();

julia> @test (somx, somy) == (2.272567e7, -258280.0)
Test Passed
```
"""
function jMtkLSToSomXY_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
    path = jMtkFileToPath(filename)
    start_block = 109
    end_block = 109
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "GreenBand"
    fieldname = "Green Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    line = 52.7
    sample = 325.2
    somx, somy = jMtkLSToSomXY(mapinfo, line, sample)
    return somx, somy
end
