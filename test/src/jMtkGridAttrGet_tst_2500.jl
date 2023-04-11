"""
    attrval = jMtkGridAttrGet_tst_2500()

# Purpose:
Generate the output of `jMtkGridAttrGet` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-05).

# Verification:
```idl
IDL> filename = root + "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
IDL> gridname = "1.1_KM_PRODUCTS"
IDL> attrname = "resolution_in_meters"
IDL> status = MTK_GRIDATTR_GET(filename, gridname, attrname, attrval)
IDL> PRINT, attrval
        1100
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrGet_tst_2500.jl")
jMtkGridAttrGet_tst_2500

julia> attrval = jMtkGridAttrGet_tst_2500();

julia> @test attrval == 1100
Test Passed
```
"""
function jMtkGridAttrGet_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "1.1_KM_PRODUCTS"
    attrname = "resolution_in_meters"
    attrval = jMtkGridAttrGet(filename, gridname, attrname)
    return attrval
end
