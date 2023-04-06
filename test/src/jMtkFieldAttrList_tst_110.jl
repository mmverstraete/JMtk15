"""
    nattrs, attrlist = jMtkFieldAttrList_tst_110()

# Purpose:
Generate the output of `jMtkFieldAttrList` for testing purposes. Test 110: For a MISR `AGP` file.

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
IDL> fieldname = 'AveSceneElev'
IDL> status = MTK_FIELDATTR_LIST(filename, fieldname, attrcnt, attrlist)
IDL> status
           0
IDL> attrcnt
           0
IDL> attrlist
% Attempt to call undefined procedure: 'ATTRLIST'.
% Execution halted at: MAIN
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFieldAttrList_tst_110.jl")
jMtkFieldAttrList_tst_110

julia> nattrs, attrlist = jMtkFieldAttrList_tst_110();

julia> @test nattrs == 0
Test Passed

julia> @test attrlist == String[]
Test Passed
```
"""
function jMtkFieldAttrList_tst_110()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    fieldname = "AveSceneElev"
    nattrs, attrlist = jMtkFieldAttrList(filename, fieldname);
    return nattrs, attrlist
end
