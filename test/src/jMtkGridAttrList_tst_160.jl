"""
    nattrs, attrlist = jMtkGridAttrList_tst_160()

# Purpose:
Generate the output of `jMtkGridAttrList` for testing purposes. Test 160: For a MISR `TC_CLASSIFIERS` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf'
IDL> gridname = 'ASCMParams_1.1_km'
IDL> status = MTK_GRIDATTR_LIST(filename, gridname, attrcnt, attrlist)
IDL> PRINT, attrcnt
           4
IDL> PRINT, attrlist
Block_size.resolution_x Block_size.resolution_y Block_size.size_x Block_size.size_y MISRReferenceCamera MISRCameras
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrList_tst_160.jl")
jMtkGridAttrList_tst_160

julia> nattrs, attrlist = jMtkGridAttrList_tst_160();

julia> @test nattrs == 4
Test Passed

julia> @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]
Test Passed
```
"""
function jMtkGridAttrList_tst_160()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"
    gridname = "ASCMParams_1.1_km"
    nattrs, attrlist = jMtkGridAttrList(filename, gridname)
    return nattrs, attrlist
end
