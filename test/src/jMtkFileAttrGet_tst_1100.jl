"""
    attrval = jMtkFileAttrGet_tst_1100()

# Purpose:
Generate the output of `jMtkFileAttrGet` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + "MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf"
IDL> attrname = "DID_version_id"
IDL> status = MTK_FILEATTR_GET(filename, attrname, attrval)
IDL> PRINT, attrval
           4
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrGet_tst_1100.jl")
jMtkFileAttrGet_tst_1100

julia> attrval = jMtkFileAttrGet_tst_1100();

julia> @test attrval == 4
Test Passed
```
"""
function jMtkFileAttrGet_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf"
    attrname = "DID_version_id"
    attrval = jMtkFileAttrGet(filename, attrname)
    return attrval
end
