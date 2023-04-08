"""
    filename = jMtkMakeFilename_tst_1300()

# Purpose:
Generate the output of `jMtkMakeFilename` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> product = 'GRP_TERRAIN_GM'
IDL> camera = 'CA'
IDL> path = 168
IDL> orbit = 68050
IDL> version = 'F03_0024'
IDL> status = MTK_MAKE_FILENAME(directory, product, camera, path, orbit, version, filename)
IDL> PRINT, filename
../Mtk_testdata/in/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkMakeFilename_tst_1300.jl")
jMtkMakeFilename_tst_1300

julia> filename = jMtkMakeFilename_tst_1300();

julia> @test filename == "../Mtk_testdata/in/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf"
Test Passed
```
"""
function jMtkMakeFilename_tst_1300()
    directory = "../Mtk_testdata/in/"
    product = "GRP_TERRAIN_GM"
    camera = "CA"
    path = 168
    orbit = 68050
    version = "F03_0024"
    filename = jMtkMakeFilename(directory, product, camera, path, orbit, version)
    return filename
end
