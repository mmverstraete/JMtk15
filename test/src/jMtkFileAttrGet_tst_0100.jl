"""
    attrval = jMtkFileAttrGet_tst_0100()

# Purpose:
Generate the output of `jMtkFileAttrGet` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> filename = root + "MISR_AM1_AGP_P168_F01_24.hdf"
IDL> attrname = "AGP_version_id"
IDL> status = MTK_FILEATTR_GET(filename, attrname, attrval)
IDL> PRINT, attrval
           2
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrGet_tst_0100.jl")
jMtkFileAttrGet_tst_0100

julia> attrval = jMtkFileAttrGet_tst_0100();

julia> @test attrval == 2
Test Passed
```
"""
function jMtkFileAttrGet_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    attrname = "AGP_version_id"
    attrval = jMtkFileAttrGet(filename, attrname)
    return attrval
end
