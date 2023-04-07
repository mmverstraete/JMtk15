"""
    nattrs, attrlist = jMtkGridAttrList_tst_1000()

# Purpose:
Generate the output of `jMtkGridAttrList` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
```idl
IDL> filename = root + 'MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf'
IDL> gridname = 'GeometricParameters'
IDL> status = MTK_GRIDATTR_LIST(filename, gridname, attrcnt, attrlist)
IDL> PRINT, attrcnt
           5
IDL> PRINT, attrlist
Block_size.resolution_x Block_size.resolution_y Block_size.size_x Block_size.size_y SunDistanceAU
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrList_tst_1000.jl")
jMtkGridAttrList_tst_1000

julia> nattrs, attrlist = jMtkGridAttrList_tst_1000();

julia> @test nattrs == 5
Test Passed

julia> @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y", "SunDistanceAU"]
Test Passed
```
"""
function jMtkGridAttrList_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    gridname = "GeometricParameters"
    nattrs, attrlist = jMtkGridAttrList(filename, gridname)
    return nattrs, attrlist
end
