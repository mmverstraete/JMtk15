"""
    ftype = jMtkFileType_tst_2500()

# Purpose:
Generate the output of `jMtkFileType` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> status = MTK_FILE_TYPE(filename, ftype)
IDL> PRINT, ftype
AS_LAND
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileType_tst_2500.jl")
jMtkFileType_tst_2500

julia> filetype = jMtkFileType_tst_2500();

julia> @test filetype == "AS_LAND"
Test Passed
```
"""
function jMtkFileType_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    filetype = jMtkFileType(filename)
    return filetype
end
