"""
    nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_0100()

# Purpose:
Generate the output of `jMtkFileGridToNativeFieldList` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> gridname = 'Regional'
IDL> status = MTK_FILE_GRID_TO_NATIVE_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
           2
IDL> PRINT, fieldlist
RegAveSceneElev StdDevRegSceneElev
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_0100.jl")
jMtkFileGridToNativeFieldList_tst_0100

julia> nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_0100();

julia> @test nfields == 2
Test Passed

julia> @test fieldlist == ["RegAveSceneElev", "StdDevRegSceneElev"]
Test Passed
```
"""
function jMtkFileGridToNativeFieldList_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    gridname = "Regional"
    nfields, fieldlist = jMtkFileGridToNativeFieldList(filename, gridname);
    return nfields, fieldlist
end
