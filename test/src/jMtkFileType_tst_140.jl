"""
    ftype = jMtkFileType_tst_140()

# Purpose:
Generate the output of `jMtkFileType` for testing purposes. Test 140: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf'
IDL> status = MTK_FILE_TYPE(filename, ftype)
IDL> PRINT, ftype
GRP_ELLIPSOID_GM
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileType_tst_140.jl")
jMtkFileType_tst_140

julia> filetype = jMtkFileType_tst_140();

julia> @test filetype == "GRP_ELLIPSOID_GM"
Test Passed
```
"""
function jMtkFileType_tst_140()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf"
    filetype = jMtkFileType(filename)
    return filetype
end
