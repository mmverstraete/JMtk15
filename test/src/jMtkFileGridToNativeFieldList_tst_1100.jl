"""
    nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_1100()

# Purpose:
Generate the output of `jMtkFileGridToNativeFieldList` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf'
IDL> gridname = 'RedBand'
IDL> status = MTK_FILE_GRID_TO_NATIVE_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
           1
IDL> PRINT, fieldlist
Red Radiance/RDQI
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_1100.jl")
jMtkFileGridToNativeFieldList_tst_1100

julia> nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_1100();

julia> @test nfields == 1
Test Passed

julia> @test fieldlist == ["Red Radiance/RDQI"]
Test Passed
```
"""
function jMtkFileGridToNativeFieldList_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf"
    gridname = "RedBand"
    nfields, fieldlist = jMtkFileGridToNativeFieldList(filename, gridname);
    return nfields, fieldlist
end
