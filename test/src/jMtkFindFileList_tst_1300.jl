"""
    filecnt, filenames = jMtkFindFileList_tst_1300()

# Purpose:
Generate the output of `jMtkFindFileList` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> search_dir = '/Users/michel/Codes/Julia/JMtk15/data/MISR/'
IDL> product = 'GRP_TERRAIN_GM'
IDL> camera = '.*'
IDL> path = '168'
IDL> orbit = '068050'
IDL> version = 'F03_0024'
IDL> status = MTK_FIND_FILELIST(search_dir, product, camera, path, orbit, version, cnt, files)
IDL> PRINT, cnt
           9
IDL> PRINT, files
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFindFileList_tst_1300.jl")
jMtkFindFileList_tst_1300

julia> filecnt, filenames = jMtkFindFileList_tst_1300();

julia> @test filecnt == 9
Test Passed

julia> @test filenames == [
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.hdf"]
Test Passed
```
"""
function jMtkFindFileList_tst_1300()
    search_dir = JMtk15_data * "MISR/"
    product = "GRP_TERRAIN_GM"
    camera = ".*"
    path = 168
    orbit = 68050
    version = "F03_0024"
    filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version);
    return filecnt, filenames
end
