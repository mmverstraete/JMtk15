"""
    attrval = jMtkFileAttrGet_tst_2300()

# Purpose:
Generate the output of `jMtkFileAttrGet` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> attrname = "SOM_parameters.som_orbit.i"
IDL> status = MTK_FILEATTR_GET(filename, attrname, attrval)
IDL> PRINT, attrval
       1.7157253
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrGet_tst_2300.jl")
jMtkFileAttrGet_tst_2300

julia> attrval = jMtkFileAttrGet_tst_2300();

julia> @test attrval == 1.7157253262878522
Test Passed
```
"""
function jMtkFileAttrGet_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    attrname = "SOM_parameters.som_orbit.i"
    attrval = jMtkFileAttrGet(filename, attrname)
    return attrval
end
