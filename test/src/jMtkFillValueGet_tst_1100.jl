"""
    fillval = jMtkFillValueGet_tst_1100()

# Purpose:
Generate the output of `jMtkFillValueGet` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + "MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CA_F03_0024.hdf"
IDL> gridname = "BlueBand"
IDL> fieldname = "Blue Radiance/RDQI"
IDL> status = MTK_FILLVALUE_GET(filename, gridname, fieldname, fill_value)
IDL> PRINT, fill_value
   65515
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFillValueGet_tst_1100.jl")
jMtkFillValueGet_tst_1100

julia> fillval = jMtkFillValueGet_tst_1100();

julia> @test fillval == 65515
Test Passed
```
"""
function jMtkFillValueGet_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CA_F03_0024.hdf"
    gridname = "BlueBand"
    fieldname = "Blue Radiance/RDQI"
    fillval = jMtkFillValueGet(filename, gridname, fieldname)
    return fillval
end
