"""
    line, sample = jMtkSomXYToLS_tst_1100()

# Purpose:
Generate the output of `jMtkSomXYToLS` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf'
IDL> path = 168
IDL> start_block = 108
IDL> end_block = 108
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'NIRBand'
IDL> fieldname = 'NIR Radiance/RDQI'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> somx = 22634150.
IDL> somy = -218240.00
IDL> status = MTK_SOMXY_TO_LS(mapinfo, somx, somy, line, sample)
IDL> PRINT, line, sample
      97.5000      345.600
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLS_tst_1100.jl")
jMtkSomXYToLS_tst_1100

julia> line, sample = jMtkSomXYToLS_tst_1100();

julia> @test (line, sample) == (97.5f0, 345.6f0)
Test Passed
```
"""
function jMtkSomXYToLS_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf"
    path = jMtkFileToPath(filename)
    start_block = 108
    end_block = 108
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "NIRBand"
    fieldname = "NIR Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    somx = 22634150.
    somy = -218240.00
    line, sample = jMtkSomXYToLS(mapinfo, somx, somy)
    return line, sample
end
