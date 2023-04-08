"""
    filename = jMtkMakeFilename_tst_1000()

# Purpose:
Generate the output of `jMtkMakeFilename` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> directory = '../Mtk_testdata/in/'
IDL> product = 'GP_GMP'
IDL> camera = ''
IDL> path = 168
IDL> orbit = 68050
IDL> version = 'F03_0013'
IDL> status = MTK_MAKE_FILENAME(directory, product, camera, path, orbit, version, filename)
IDL> PRINT, filename
../Mtk_testdata/in/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkMakeFilename_tst_1000.jl")
jMtkMakeFilename_tst_1000

julia> filename = jMtkMakeFilename_tst_1000();

julia> @test filename == "../Mtk_testdata/in/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
Test Passed
```
"""
function jMtkMakeFilename_tst_1000()
    directory = "../Mtk_testdata/in/"
    product = "GP_GMP"
    camera = ""
    path = 168
    orbit = 68050
    version = "F03_0013"
    filename = jMtkMakeFilename(directory, product, camera, path, orbit, version)
    return filename
end
