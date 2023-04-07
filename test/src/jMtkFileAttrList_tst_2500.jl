"""
    attrcnt, attrlist = jMtkFileAttrList_tst_2500()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> filename = root + 'MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc'
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
          88
IDL> PRINT, attrlist[0:4]
Path_number AGP_version_id DID_version_id Number_blocks Ocean_blocks_size
IDL> PRINT, attrlist[40:44]
title institution source history references
IDL> PRINT, attrlist[84:87]
config.sim.enable config.sim.surface_type config.SurfaceRetrieval.use_smoothed_aod config.underlight_albedo
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_2500.jl")
jMtkFileAttrList_tst_2500

julia> attrcnt, attrlist = jMtkFileAttrList_tst_2500();

julia> @test attrcnt == 88
Test Passed

julia> @test attrlist[1:5] == ["Path_number", "AGP_version_id", "DID_version_id", "Number_blocks", "Ocean_blocks_size"]
Test Passed

julia> @test attrlist[41:45] == ["title", "institution", "source", "history", "references"]
Test Passed

julia> @test attrlist[85:88] == ["config.sim.enable", "config.sim.surface_type", "config.SurfaceRetrieval.use_smoothed_aod", "config.underlight_albedo"]
Test Passed
```
"""
function jMtkFileAttrList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
