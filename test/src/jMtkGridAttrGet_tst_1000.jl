"""
    attrval = jMtkGridAttrGet_tst_1000()

# Purpose:
Generate the output of `jMtkGridAttrGet` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> filename = root + "MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
IDL> gridname = "GeometricParameters"
IDL> attrname = "SunDistanceAU"
IDL> status = MTK_GRIDATTR_GET(filename, gridname, attrname, attrval)
IDL> PRINT, attrval
        1.0004615
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrGet_tst_1000.jl")
jMtkGridAttrGet_tst_1000

julia> attrval = jMtkGridAttrGet_tst_1000();

julia> @test attrval == 1.0004615223771693
Test Passed
```
"""
function jMtkGridAttrGet_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    gridname = "GeometricParameters"
    attrname = "SunDistanceAU"
    attrval = jMtkGridAttrGet(filename, gridname, attrname)
    return attrval
end
