"""
    attrcnt, attrlist = jMtkFileAttrList_tst_150()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 150: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf'
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          31
IDL> PRINT, attrlist[5:8]
Number_blocks Ocean_blocks_size Ocean_blocks.count Ocean_blocks.numbers
IDL> PRINT, attrlist[15:18]
SOM_parameters.som_orbit.ro SOM_parameters.som_orbit.i SOM_parameters.som_orbit.P2P1 SOM_parameters.som_orbit.lambda0
IDL> PRINT, attrlist[26:29]
Num_local_modes Local_mode_site_name Orbit_QA Camera
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_150.jl")
jMtkFileAttrList_tst_150

julia> attrcnt, attrlist = jMtkFileAttrList_tst_150();

julia> @test attrcnt == 31
Test Passed

julia> @test attrlist[6:9] == ["Number_blocks", "Ocean_blocks_size", "Ocean_blocks.count", "Ocean_blocks.numbers"]
Test Passed

julia> @test attrlist[16:19] == ["SOM_parameters.som_orbit.ro", "SOM_parameters.som_orbit.i", "SOM_parameters.som_orbit.P2P1", "SOM_parameters.som_orbit.lambda0"]
Test Passed

julia> @test attrlist[27:30] == ["Num_local_modes", "Local_mode_site_name", "Orbit_QA", "Camera"]
Test Passed
```
"""
function jMtkFileAttrList_tst_150()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
