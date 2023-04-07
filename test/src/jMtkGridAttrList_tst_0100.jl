"""
    nattrs, attrlist = jMtkGridAttrList_tst_0100()

# Purpose:
Generate the output of `jMtkGridAttrList` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> filename = root + 'MISR_AM1_AGP_P168_F01_24.hdf'
IDL> gridname = 'Standard'
IDL> status = MTK_GRIDATTR_LIST(filename, gridname, attrcnt, attrlist)
IDL> PRINT, attrcnt
           4
IDL> PRINT, attrlist
Block_size.resolution_x Block_size.resolution_y Block_size.size_x Block_size.size_y
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrList_tst_0100.jl")
jMtkGridAttrList_tst_0100

julia> nattrs, attrlist = jMtkGridAttrList_tst_0100();

julia> @test nattrs == 4
Test Passed

julia> @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]
Test Passed
```
"""
function jMtkGridAttrList_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    gridname = "Standard"
    nattrs, attrlist = jMtkGridAttrList(filename, gridname)
    return nattrs, attrlist
end
