"""
    attrval = jMtkGridAttrGet_tst_1300()

# Purpose:
Generate the output of `jMtkGridAttrGet` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
IDL> gridname = "NIRBand"
IDL> attrname = "Block_size.size_x"
IDL> status = MTK_GRIDATTR_GET(filename, gridname, attrname, attrval)
IDL> PRINT, attrval
         128
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrGet_tst_1300.jl")
jMtkGridAttrGet_tst_1300

julia> attrval = jMtkGridAttrGet_tst_1300();

julia> @test attrval == 128
Test Passed
```
"""
function jMtkGridAttrGet_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
    gridname = "NIRBand"
    attrname = "Block_size.size_x"
    attrval = jMtkGridAttrGet(filename, gridname, attrname)
    return attrval
end
