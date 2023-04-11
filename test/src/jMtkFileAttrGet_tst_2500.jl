"""
    attrval = jMtkFileAttrGet_tst_2500()

# Purpose:
Generate the output of `jMtkFileAttrGet` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-04).

# Verification:
```idl
IDL> filename = root + "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
IDL> attrname = "Equator_crossing_longitude"
IDL> status = MTK_FILEATTR_GET(filename, attrname, attrval)
IDL> PRINT, attrval
       37.451919
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrGet_tst_2500.jl")
jMtkFileAttrGet_tst_2500

julia> attrval = jMtkFileAttrGet_tst_2500();

julia> @test attrval == 37.4519193181101
Test Passed
```
"""
function jMtkFileAttrGet_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    attrname = "Equator_crossing_longitude"
    attrval = jMtkFileAttrGet(filename, attrname)
    return attrval
end
