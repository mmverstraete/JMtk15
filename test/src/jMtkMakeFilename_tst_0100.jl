"""
    filename = jMtkMakeFilename_tst_0100()

# Purpose:
Generate the output of `jMtkMakeFilename` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> product = 'AGP'
IDL> camera = ''
IDL> path = 168
IDL> orbit = 0
IDL> version = 'F01_24'
IDL> status = MTK_MAKE_FILENAME(directory, product, camera, path, orbit, version, filename)
IDL> PRINT, filename
../Mtk_testdata/in/MISR_AM1_AGP_P168_F01_24.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkMakeFilename_tst_0100.jl")
jMtkMakeFilename_tst_0100

julia> filename = jMtkMakeFilename_tst_0100();

julia> @test filename == "../Mtk_testdata/in/MISR_AM1_AGP_P168_F01_24.hdf"
Test Passed
```
"""
function jMtkMakeFilename_tst_0100()
    directory = "../Mtk_testdata/in/"
    product = "AGP"
    camera = ""
    path = 168
    orbit = 0
    version = "F01_24"
    filename = jMtkMakeFilename(directory, product, camera, path, orbit, version)
    return filename
end
