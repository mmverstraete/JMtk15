"""
    attrcnt, attrlist = jMtkFileAttrList_tst_130()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 130: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf'
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          31
IDL> PRINT, attrlist[2:5]
Path_number AGP_version_id DID_version_id Number_blocks
IDL> PRINT, attrlist[19:22]
Origin_block.ulc.x Origin_block.ulc.y Origin_block.lrc.x Origin_block.lrc.y
IDL> PRINT, attrlist[27:30]
Local_mode_site_name Orbit_QA Camera coremetadata
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_130.jl")
jMtkFileAttrList_tst_130

julia> attrcnt, attrlist = jMtkFileAttrList_tst_130();

julia> @test attrcnt == 31
Test Passed

julia> @test attrlist[3:6] == ["Path_number", "AGP_version_id", "DID_version_id", "Number_blocks"]
Test Passed

julia> @test attrlist[20:23] == ["Origin_block.ulc.x", "Origin_block.ulc.y", "Origin_block.lrc.x", "Origin_block.lrc.y"]
Test Passed

julia> @test attrlist[28:31] == ["Local_mode_site_name", "Orbit_QA", "Camera", "coremetadata"]
Test Passed
```
"""
function jMtkFileAttrList_tst_130()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
