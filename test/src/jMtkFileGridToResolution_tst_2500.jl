"""
    resolution = jMtkFileGridToResolution_tst_2500()

# Purpose:
Generate the output of `jMtkFileGridToResolution` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> gridname = '4.4_KM_PRODUCTS'
IDL> status = MTK_FILE_GRID_TO_RESOLUTION(filename, gridname, resolution)
IDL> PRINT, resolution
        4400
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToResolution_tst_2500.jl")
jMtkFileGridToResolution_tst_2500

julia> resolution = jMtkFileGridToResolution_tst_2500();

julia> @test resolution == 4400
Test Passed
```
"""
function jMtkFileGridToResolution_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "4.4_KM_PRODUCTS"
    resolution = jMtkFileGridToResolution(filename, gridname)
    return resolution
end
