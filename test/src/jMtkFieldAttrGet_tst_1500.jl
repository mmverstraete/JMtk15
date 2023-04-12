"""
    attrval = jMtkFieldAttrGet_tst_1500()

# Purpose:
Generate the output of `jMtkFieldAttrGet` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + "MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf"
IDL> fieldname = "Cloud"
IDL> attrname = "_FillValue"
IDL> status = MTK_FIELDATTR_GET(filename, fieldname, attrname, attrval)
IDL> PRINT, attrval
 255
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFieldAttrGet_tst_1500.jl")
jMtkFieldAttrGet_tst_1500

julia> attrval = jMtkFieldAttrGet_tst_1500();

julia> @test attrval == 255
Test Passed
```
"""
function jMtkFieldAttrGet_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf"
    fieldname = "Cloud"
    attrname = "_FillValue"
    attrval = jMtkFieldAttrGet(filename, fieldname, attrname)
    return attrval
end
