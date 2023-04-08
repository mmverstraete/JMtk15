"""
    somx, somy = jMtkLSToSomXY_tst_1500()

# Purpose:
Generate the output of `jMtkLSToSomXY` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> path = 168
IDL> start_block = 112
IDL> end_block = 112
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'RCCM'
IDL> fieldname = 'Cloud'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> line = 54.3
IDL> sample = 127.8
IDL> status = MTK_LS_TO_SOMXY(mapinfo, line, sample, somx, somy)
IDL> PRINT, somx, somy
       23149830.      -528220.00
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToSomXY_tst_1500.jl")
jMtkLSToSomXY_tst_1500

julia> somx, somy = jMtkLSToSomXY_tst_1500();

julia> @test (somx, somy) == (2.314983e7, -528220.0)
Test Passed
```
"""
function jMtkLSToSomXY_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf"
    path = jMtkFileToPath(filename)
    start_block = 112
    end_block = 112
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "RCCM"
    fieldname = "Cloud"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    line = 54.3
    sample = 127.8
    somx, somy = jMtkLSToSomXY(mapinfo, line, sample)
    return somx, somy
end
