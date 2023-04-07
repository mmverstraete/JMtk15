"""
    nfields, fieldlist = jMtkFileGridToFieldList_tst_1000()

# Purpose:
Generate the output of `jMtkFileGridToFieldList` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> status = MTK_FILE_GRID_TO_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
          38
IDL> PRINT, fieldlist
SolarAzimuth SolarZenith DfAzimuth DfZenith DfScatter DfGlitter CfAzimuth CfZenith CfScatter CfGlitter BfAzimuth BfZenith BfScatter BfGlitter AfAzimuth AfZenith AfScatter AfGlitter AnAzimuth AnZenith AnScatter AnGlitter AaAzimuth AaZenith AaScatter AaGlitter BaAzimuth BaZenith BaScatter BaGlitter CaAzimuth CaZenith CaScatter CaGlitter DaAzimuth DaZenith DaScatter DaGlitter
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1000.jl")
jMtkFileGridToFieldList_tst_1000

julia> nfields, fieldlist = jMtkFileGridToFieldList_tst_1000();

julia> @test nfields == 38
Test Passed

julia> @test fieldlist[1:5] == ["SolarAzimuth", "SolarZenith", "DfAzimuth", "DfZenith", "DfScatter"]
Test Passed

julia> @test fieldlist[11:15] == ["BfAzimuth", "BfZenith", "BfScatter", "BfGlitter", "AfAzimuth"]
Test Passed

julia> @test fieldlist[34:38] == ["CaGlitter", "DaAzimuth", "DaZenith", "DaScatter", "DaGlitter"]
Test Passed
```
"""
function jMtkFileGridToFieldList_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    gridname = "GeometricParameters"
    nfields, fieldlist = jMtkFileGridToFieldList(filename, gridname);
    return nfields, fieldlist
end
