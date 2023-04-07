"""
    nattrs, attrlist = jMtkFieldAttrList_tst_2300()

# Purpose:
Generate the output of `jMtkFieldAttrList` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf'
IDL> fieldname = 'CombinedFractionCloudHC'
IDL> status = MTK_FIELDATTR_LIST(filename, fieldname, attrcnt, attrlist)
IDL> PRINT, attrcnt
           1
IDL> PRINT, attrlist
_FillValue
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFieldAttrList_tst_2300.jl")
jMtkFieldAttrList_tst_2300

julia> nattrs, attrlist = jMtkFieldAttrList_tst_2300();

julia> nattrs
1

julia> attrlist
1-element Vector{String}:
 "_FillValue"
```
"""
function jMtkFieldAttrList_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"
    fieldname = "CombinedFractionCloudHC"
    nattrs, attrlist = jMtkFieldAttrList(filename, fieldname);
    return nattrs, attrlist
end
