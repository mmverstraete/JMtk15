"""
    attrcnt, attrlist = jMtkFileAttrList_tst_110()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 110: For a MISR `AGP` file.

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
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          28
IDL> PRINT, attrlist[0:3]
StructMetadata.0 Translation.number_id Translation.land_water_id Translation.dark_water_mask
IDL> PRINT, attrlist[15:18]
SOM_parameters.som_orbit.gama SOM_parameters.som_orbit.nrev SOM_parameters.som_orbit.ro SOM_parameters.som_orbit.i
IDL> PRINT, attrlist[24:27]
Origin_block.lrc.y Start_block End block coremetadata
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_110.jl")
jMtkFileAttrList_tst_110

julia> attrcnt, attrlist = jMtkFileAttrList_tst_110();

julia> @test attrcnt == 28
Test Passed

julia> @test attrlist[1:4] == ["StructMetadata.0", "Translation.number_id", "Translation.land_water_id", "Translation.dark_water_mask"]
Test Passed

julia> @test attrlist[16:19] == ["SOM_parameters.som_orbit.gama", "SOM_parameters.som_orbit.nrev", "SOM_parameters.som_orbit.ro", "SOM_parameters.som_orbit.i"]
Test Passed

julia> @test attrlist[25:28] == ["Origin_block.lrc.y", "Start_block", "End block", "coremetadata"]
Test Passed
```
"""
function jMtkFileAttrList_tst_110()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
