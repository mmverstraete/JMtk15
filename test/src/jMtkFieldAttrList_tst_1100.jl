"""
    nattrs, attrlist = jMtkFieldAttrList_tst_1100()

# Purpose:
Generate the output of `jMtkFieldAttrList` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DA_F03_0024.hdf'
IDL> fieldname = 'Green Radiance/RDQI'
IDL> status = MTK_FIELDATTR_LIST(filename, fieldname, attrcnt, attrlist)
IDL> attrcnt
           1
IDL> attrlist
_FillValue
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFieldAttrList_tst_1100.jl")
jMtkFieldAttrList_tst_1100

julia> nattrs, attrlist = jMtkFieldAttrList_tst_1100();

julia> @test nattrs == 1
Test Passed

julia> @test attrlist == ["_FillValue"]
Test Passed
```
"""
function jMtkFieldAttrList_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DA_F03_0024.hdf"
    fieldname = "Green Radiance/RDQI"
    nattrs, attrlist = jMtkFieldAttrList(filename, fieldname);
    return nattrs, attrlist
end
