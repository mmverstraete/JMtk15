"""
    fillval = jMtkFillValueGet_tst_1300()

# Purpose:
Generate the output of `jMtkFillValueGet` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
IDL> gridname = "BRF Conversion Factors"
IDL> fieldname = "RedConversionFactor"
IDL> status = MTK_FILLVALUE_GET(filename, gridname, fieldname, fill_value)
IDL> PRINT, fill_value
     -555.000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFillValueGet_tst_1300.jl")
jMtkFillValueGet_tst_1300

julia> fillval = jMtkFillValueGet_tst_1300();

julia> @test fillval == -555.0
Test Passed
```
"""
function jMtkFillValueGet_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    gridname = "BRF Conversion Factors"
    fieldname = "RedConversionFactor"
    fillval = jMtkFillValueGet(filename, gridname, fieldname)
    return fillval
end
