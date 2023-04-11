"""
    fillval = jMtkFillValueGet_tst_2300()

# Purpose:
Generate the output of `jMtkFillValueGet` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + "MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
IDL> gridname = "Motion_17.6_km"
IDL> fieldname = "CloudMotionEastward"
IDL> status = MTK_FILLVALUE_GET(filename, gridname, fieldname, fill_value)
IDL> PRINT, fill_value
     -9999.00
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFillValueGet_tst_2300.jl")
jMtkFillValueGet_tst_2300

julia> fillval = jMtkFillValueGet_tst_2300();

julia> @test fillval == -9999.0
Test Passed
```
"""
function jMtkFillValueGet_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    gridname = "Motion_17.6_km"
    fieldname = "CloudMotionEastward"
    fillval = jMtkFillValueGet(filename, gridname, fieldname)
    return fillval
end
