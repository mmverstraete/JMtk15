"""
    nfields, fieldlist = jMtkFileGridToFieldList_tst_1100()

# Purpose:
Generate the output of `jMtkFileGridToFieldList` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf'
IDL> gridname = 'BRF Conversion Factors'
IDL> status = MTK_FILE_GRID_TO_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
           4
IDL> PRINT, fieldlist
BlueConversionFactor GreenConversionFactor RedConversionFactor NIRConversionFactor
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1100.jl")
jMtkFileGridToFieldList_tst_1100

julia> nfields, fieldlist = jMtkFileGridToFieldList_tst_1100();

julia> @test nfields == 4
Test Passed

julia> @test fieldlist == ["BlueConversionFactor", "GreenConversionFactor", "RedConversionFactor", "NIRConversionFactor"]
Test Passed
```
"""
function jMtkFileGridToFieldList_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf"
    gridname = "BRF Conversion Factors"
    nfields, fieldlist = jMtkFileGridToFieldList(filename, gridname);
    return nfields, fieldlist
end
