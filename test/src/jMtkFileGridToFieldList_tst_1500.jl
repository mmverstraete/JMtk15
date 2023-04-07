"""
    nfields, fieldlist = jMtkFileGridToFieldList_tst_1500()

# Purpose:
Generate the output of `jMtkFileGridToFieldList` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf'
IDL> gridname = 'RCCM'
IDL> status = MTK_FILE_GRID_TO_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
           7
IDL> PRINT, fieldlist
Cloud Glitter Quality Dust_test First Observable Second Observable Dust Observable
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1500.jl")
jMtkFileGridToFieldList_tst_1500

julia> nfields, fieldlist = jMtkFileGridToFieldList_tst_1500();

julia> @test nfields == 7
Test Passed

julia> @test fieldlist == ["Cloud", "Glitter", "Quality", "Dust_test", "First Observable", "Second Observable", "Dust Observable"]
Test Passed
```
"""
function jMtkFileGridToFieldList_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf"
    gridname = "RCCM"
    nfields, fieldlist = jMtkFileGridToFieldList(filename, gridname);
    return nfields, fieldlist
end
