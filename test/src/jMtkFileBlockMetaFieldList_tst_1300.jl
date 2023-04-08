"""
    nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_1300()

# Purpose:
Generate the output of `jMtkFileBlockMetaFieldList` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf'
IDL> blockmeta = 'PerBlockMetadataCommon'
IDL> status = MTK_FILE_BLOCK_META_FIELD_LIST(filename, blockmeta, nfields, fieldlist)
IDL> PRINT, nfields
           7
IDL> PRINT, fieldlist
Block_number Ocean_flag Block_coor_ulc_som_meter.x Block_coor_ulc_som_meter.y Block_coor_lrc_som_meter.x Block_coor_lrc_som_meter.y Data_flag
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_1300.jl")
jMtkFileBlockMetaFieldList_tst_1300

julia> nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_1300();

julia> @test nfields == 7
Test Passed

julia> @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]
Test Passed
```
"""
function jMtkFileBlockMetaFieldList_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    blockmeta = "PerBlockMetadataCommon"
    nfields, fieldlist = jMtkFileBlockMetaFieldList(filename, blockmeta);
    return nfields, fieldlist
end
