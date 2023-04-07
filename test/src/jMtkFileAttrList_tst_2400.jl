"""
    attrcnt, attrlist = jMtkFileAttrList_tst_2400()

# Purpose:
Generate the output of `jMtkFileAttrList` for testing purposes. Test 2400: For a MISR `AS_AEROSOL` file.

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
IDL> filename = root + 'MISR_AM1_AS_AEROSOL_P168_O068050_F13_0023.nc'
IDL> status = MTK_FILEATTR_LIST(filename, attrcnt, attrlist)
IDL> PRINT, attrcnt
         144
IDL> PRINT, attrlist[24]
SOM_map_maximum_corner.y
IDL> PRINT, attrlist[129]
config.het_bias_pixel_mode
IDL> PRINT, attrlist[143]
config.GeographicExclusions.latitude.0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrList_tst_2400.jl")
jMtkFileAttrList_tst_2400

julia> attrcnt, attrlist = jMtkFileAttrList_tst_2400();

julia> @test attrcnt == 144
Test Passed

julia> @test attrlist[25] == "SOM_map_maximum_corner.y"
Test Passed

julia> @test attrlist[130] == "config.het_bias_pixel_mode"
Test Passed

julia> @test attrlist[144] == "config.GeographicExclusions.latitude.0"
Test Passed
```
"""
function jMtkFileAttrList_tst_2400()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_AEROSOL_P168_O068050_F13_0023.nc"
    attrcnt, attrlist = jMtkFileAttrList(filename);
    return attrcnt, attrlist
end
