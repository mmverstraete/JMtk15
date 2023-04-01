"""
    attrcnt, attrlist = jMtkFileAttrList_tst_140()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 140: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DA_F03_0024.hdf'
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          31
IDL> PRINT, attrlist[3:6]
AGP_version_id DID_version_id Number_blocks Ocean_blocks_size
IDL> PRINT, attrlist[18:21]
SOM_parameters.som_orbit.lambda0 Origin_block.ulc.x Origin_block.ulc.y Origin_block.lrc.x
IDL> PRINT, attrlist[27:30]
Local_mode_site_name Orbit_QA Camera coremetadata
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_140.jl")
jMtkFileAttrList_tst_140

julia> attrcnt, attrlist = jMtkFileAttrList_tst_140();

julia> @test attrcnt == 31
Test Passed

julia> @test attrlist[4:7] == ["AGP_version_id", "DID_version_id", "Number_blocks", "Ocean_blocks_size"]
Test Passed

julia> @test attrlist[19:22] == ["SOM_parameters.som_orbit.lambda0", "Origin_block.ulc.x", "Origin_block.ulc.y", "Origin_block.lrc.x"]
Test Passed

julia> @test attrlist[28:31] == ["Local_mode_site_name", "Orbit_QA", "Camera", "coremetadata"]
Test Passed
```
"""
function jMtkFileAttrList_tst_140()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DA_F03_0024.hdf"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
