"""
    nattrs, attrlist = jMtkFieldAttrList_tst_170()

# Purpose:
Generate the output of `jMtkFieldAttrList` for testing purposes. Test 170: For a MISR `AS_LAND` file.

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
IDL> filename = root + 'MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc'
IDL> fieldname = 'Leaf_Area_Index_Best_Estimate'
IDL> status = MTK_FIELDATTR_LIST(filename, fieldname, attrcnt, attrlist)
IDL> attrcnt
           5
IDL> attrlist
_FillValue
coordinates
units
standard_name
long_name
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFieldAttrList_tst_170.jl")
jMtkFieldAttrList_tst_170

julia> nattrs, attrlist = jMtkFieldAttrList_tst_170();

julia> @test nattrs == 5
Test Passed

julia> @test attrlist == ["_FillValue", "coordinates", "units", "standard_name", "long_name"]
Test Passed
```
"""
function jMtkFieldAttrList_tst_170()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    fieldname = "Leaf_Area_Index_Best_Estimate"
    nattrs, attrlist = jMtkFieldAttrList(filename, fieldname);
    return nattrs, attrlist
end
