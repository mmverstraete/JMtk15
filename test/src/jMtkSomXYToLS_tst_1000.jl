"""
    line, sample = jMtkSomXYToLS_tst_1000()

# Purpose:
Generate the output of `jMtkSomXYToLS` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> filename = root + 'MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf'
IDL> path = 168
IDL> start_block = 111
IDL> end_block = 111
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = 'GeometricParameters'
IDL> fieldname = 'SolarZenith'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> somx = 22989230.
IDL> somy = -153670.00
IDL> status = MTK_SOMXY_TO_LS(mapinfo, somx, somy, line, sample)
IDL> PRINT, line, sample
      1.80000      27.8000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLS_tst_1000.jl")
jMtkSomXYToLS_tst_1000

julia> line, sample = jMtkSomXYToLS_tst_1000();

julia> @test (line, sample) == (1.8f0, 27.8f0)
Test Passed
```
"""
function jMtkSomXYToLS_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    path = jMtkFileToPath(filename)
    start_block = 111
    end_block = 111
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "GeometricParameters"
    fieldname = "SolarZenith"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    somx = 22989230.
    somy = -153670.00
    line, sample = jMtkSomXYToLS(mapinfo, somx, somy)
    return line, sample
end
