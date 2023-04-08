"""
    somx, somy = jMtkLSToSomXY_tst_1100()

# Purpose:
Generate the output of `jMtkLSToSomXY` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> line = 97.5
IDL> sample = 345.6
IDL> status = MTK_LS_TO_SOMXY(mapinfo, line, sample, somx, somy)
IDL> PRINT, somx, somy
       22634150.      -218240.00
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLSToSomXY_tst_1100.jl")
jMtkLSToSomXY_tst_1100

julia> somx, somy = jMtkLSToSomXY_tst_1100();

julia> @test (somx, somy) == (2.263415e7, -218240.0)
Test Passed
```
"""
function jMtkLSToSomXY_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf"
    path = jMtkFileToPath(filename)
    start_block = 108
    end_block = 108
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "NIRBand"
    fieldname = "NIR Radiance/RDQI"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    line = 97.5
    sample = 345.6
    somx, somy = jMtkLSToSomXY(mapinfo, line, sample)
    return somx, somy
end
