"""
    attrcnt, attrlist = jMtkFileAttrList_tst_1000()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          30
IDL> PRINT, attrlist[0:3]
HDFEOSVersion StructMetadata.0 coremetadata Path_number
IDL> PRINT, attrlist[17:20]
SOM_parameters.som_orbit.i SOM_parameters.som_orbit.P2P1 SOM_parameters.som_orbit.lambda0 Origin_block.ulc.x
IDL> PRINT, attrlist[26:29]
Cam_mode Num_local_modes Local_mode_site_name Orbit_QA
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_1000.jl")
jMtkFileAttrList_tst_1000

julia> attrcnt, attrlist = jMtkFileAttrList_tst_1000();

julia> @test attrcnt == 30
Test Passed

julia> @test attrlist[1:4] == ["HDFEOSVersion", "StructMetadata.0", "coremetadata", "Path_number"]
Test Passed

julia> @test attrlist[18:21] == ["SOM_parameters.som_orbit.i", "SOM_parameters.som_orbit.P2P1", "SOM_parameters.som_orbit.lambda0", "Origin_block.ulc.x"]
Test Passed

julia> @test attrlist[27:30] == ["Cam_mode", "Num_local_modes", "Local_mode_site_name", "Orbit_QA"]
Test Passed
```
"""
function jMtkFileAttrList_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
