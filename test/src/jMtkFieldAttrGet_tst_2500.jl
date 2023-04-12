"""
    attrval = jMtkFieldAttrGet_tst_2500()

# Purpose:
Generate the output of `jMtkFieldAttrGet` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-07).

# Verification:
```idl
IDL> filename = root + "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
IDL> fieldname = "Normalized_Difference_Vegetation_Index"
IDL> attrname = "_FillValue"
IDL> status = MTK_FIELDATTR_GET(filename, fieldname, attrname, attrval)
IDL> PRINT, attrval
   0.00793651
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFieldAttrGet_tst_2500.jl")
jMtkFieldAttrGet_tst_2500

julia> attrval = jMtkFieldAttrGet_tst_2500();

julia> @test attrval == 0.007936508f0
Test Passed
```
"""
function jMtkFieldAttrGet_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    fieldname = "Normalized_Difference_Vegetation_Index"
    attrname = "scale_factor"
    attrval = jMtkFieldAttrGet(filename, fieldname, attrname)
    return attrval
end
