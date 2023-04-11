"""
    attrval = jMtkGridAttrGet_tst_2300()

# Purpose:
Generate the output of `jMtkGridAttrGet` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + "MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
IDL> gridname = "Stereo_1.1_km"
IDL> attrname = "Block_size.resolution_y"
IDL> status = MTK_GRIDATTR_GET(filename, gridname, attrname, attrval)
IDL> PRINT, attrval
         1100
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrGet_tst_2300.jl")
jMtkGridAttrGet_tst_2300

julia> attrval = jMtkGridAttrGet_tst_2300();

julia> @test attrval == 1100
Test Passed
```
"""
function jMtkGridAttrGet_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    gridname = "Stereo_1.1_km"
    attrname = "Block_size.resolution_y"
    attrval = jMtkGridAttrGet(filename, gridname, attrname)
    return attrval
end
