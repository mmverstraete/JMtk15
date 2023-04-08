"""
    line, sample = jMtkSomXYToLS_tst_1500()

# Purpose:
Generate the output of `jMtkSomXYToLS` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> somx = 23149830.
IDL> somy = -528220.00
IDL> status = MTK_SOMXY_TO_LS(mapinfo, somx, somy, line, sample)
IDL> PRINT, line, sample
      54.3000      127.800
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLS_tst_1500.jl")
jMtkSomXYToLS_tst_1500

julia> line, sample = jMtkSomXYToLS_tst_1500();

julia> @test (line, sample) == (54.3f0, 127.8f0)
Test Passed
```
"""
function jMtkSomXYToLS_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf"
    path = jMtkFileToPath(filename)
    start_block = 112
    end_block = 112
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "RCCM"
    fieldname = "Cloud"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    somx = 23149830.
    somy = -528220.00
    line, sample = jMtkSomXYToLS(mapinfo, somx, somy)
    return line, sample
end
