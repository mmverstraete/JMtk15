"""
    line, sample = jMtkSomXYToLS_tst_2500()

# Purpose:
Generate the output of `jMtkSomXYToLS` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> filename = root + 'MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc'
IDL> path = 168
IDL> start_block = 110
IDL> end_block = 110
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> gridname = '1.1_KM_PRODUCTS'
IDL> fieldname = 'Normalized_Difference_Vegetation_Index'
IDL> status = MTK_READDATA(filename, gridname, fieldname, region, databuf, mapinfo)
IDL> somx = 22879120.
IDL> somy = -358600.00
IDL> status = MTK_SOMXY_TO_LS(mapinfo, somx, somy, line, sample)
IDL> PRINT, line, sample
      64.2000      250.000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToLS_tst_2500.jl")
jMtkSomXYToLS_tst_2500

julia> line, sample = jMtkSomXYToLS_tst_2500();

julia> @test (line, sample) == (64.2f0, 250.0f0)
Test Passed
```
"""
function jMtkSomXYToLS_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    path = jMtkFileToPath(filename)
    start_block = 110
    end_block = 110
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    gridname = "1.1_KM_PRODUCTS"
    fieldname = "Normalized_Difference_Vegetation_Index"
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
    somx = 22879120.
    somy = -358600.00
    line, sample = jMtkSomXYToLS(mapinfo, somx, somy)
    return line, sample
end
