"""
    fillval = jMtkFillValueGet_tst_2500()

# Purpose:
Generate the output of `jMtkFillValueGet` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-04).

# Verification:
```idl
IDL> filename = root + "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
IDL> gridname = "1.1_KM_PRODUCTS"
IDL> fieldname = "Hemispherical_Directional_Reflectance_Factor"
IDL> status = MTK_FILLVALUE_GET(filename, gridname, fieldname, fill_value)
IDL> PRINT, fill_value
   65533
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFillValueGet_tst_2500.jl")
jMtkFillValueGet_tst_2500

julia> fillval = jMtkFillValueGet_tst_2500();

julia> @test fillval == 65533
Test Passed
```
"""
function jMtkFillValueGet_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "1.1_KM_PRODUCTS"
    fieldname = "Hemispherical_Directional_Reflectance_Factor"
    fillval = jMtkFillValueGet(filename, gridname, fieldname)
    return fillval
end
