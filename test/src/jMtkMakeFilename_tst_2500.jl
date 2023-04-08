"""
    filename = jMtkMakeFilename_tst_2500()

# Purpose:
Generate the output of `jMtkMakeFilename` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# WARNING: This function generates the correct filename but not the correct file extension
for NetCDF files.

# Verification:
```idl
IDL> directory = '../Mtk_testdata/in/'
IDL> product = 'AS_LAND'
IDL> camera = ''
IDL> path = 168
IDL> orbit = 68050
IDL> version = 'F08_0023'
IDL> status = MTK_MAKE_FILENAME(directory, product, camera, path, orbit, version, filename)
IDL> PRINT, filename
../Mtk_testdata/in/MISR_AM1_AS_LAND_P168_O068050_F08_0023.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkMakeFilename_tst_2500.jl")
jMtkMakeFilename_tst_2500

julia> filename = jMtkMakeFilename_tst_2500();

julia> @test filename == "../Mtk_testdata/in/MISR_AM1_AS_LAND_P168_O068050_F08_0023.hdf"
Test Passed
```
"""
function jMtkMakeFilename_tst_2500()
    directory = "../Mtk_testdata/in/"
    product = "AS_LAND"
    camera = ""
    path = 168
    orbit = 68050
    version = "F08_0023"
    filename = jMtkMakeFilename(directory, product, camera, path, orbit, version)
    return filename
end
