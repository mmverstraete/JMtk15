"""
    attrcnt, attrlist = jMtkFileAttrList_tst_160()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 160: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf'
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          31
IDL> PRINT, attrlist[7:10]
Ocean_blocks.count Ocean_blocks.numbers SOM_parameters.som_ellipsoid.a SOM_parameters.som_ellipsoid.e2
IDL> PRINT, attrlist[20:23]
Origin_block.ulc.y Origin_block.lrc.x Origin_block.lrc.y Start_block
IDL> PRINT, attrlist[26:29]
Num_local_modes Local_mode_site_name Orbit_QA Orbit_qa_winds
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_160.jl")
jMtkFileAttrList_tst_160

julia> attrcnt, attrlist = jMtkFileAttrList_tst_160();

julia> @test attrcnt == 31
Test Passed

julia> @test attrlist[8:11] == ["Ocean_blocks.count", "Ocean_blocks.numbers", "SOM_parameters.som_ellipsoid.a", "SOM_parameters.som_ellipsoid.e2"]
Test Passed

julia> @test attrlist[21:24] == ["Origin_block.ulc.y", "Origin_block.lrc.x", "Origin_block.lrc.y", "Start_block"]
Test Passed

julia> @test attrlist[27:30] == ["Num_local_modes", "Local_mode_site_name", "Orbit_QA", "Orbit_qa_winds"]
Test Passed
```
"""
function jMtkFileAttrList_tst_160()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
