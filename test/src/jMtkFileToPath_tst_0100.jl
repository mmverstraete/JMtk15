"""
    path = jMtkFileToPath_tst_0100()

# Purpose:
Generate the output of `jMtkFileToPath` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> status = MTK_FILE_TO_PATH(filename, path)
IDL> PRINT, path
         168
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToPath_tst_0100.jl")
jMtkFileToPath_tst_0100

julia> path = jMtkFileToPath_tst_0100();

julia> @test path == 168
Test Passed
```
"""
function jMtkFileToPath_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    return jMtkFileToPath(filename)
end
