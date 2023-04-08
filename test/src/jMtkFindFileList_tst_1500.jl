"""
    filecnt, filenames = jMtkFindFileList_tst_1500()

# Purpose:
Generate the output of `jMtkFindFileList` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> product = 'GRP_RCCM_GM'
IDL> camera = '.*'
IDL> path = '168'
IDL> orbit = '068050'
IDL> version = 'F04_0025'
IDL> status = MTK_FIND_FILELIST(search_dir, product, camera, path, orbit, version, cnt, files)
IDL> PRINT, cnt
           9
IDL> PRINT, files
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DF_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFindFileList_tst_1500.jl")
jMtkFindFileList_tst_1500

julia> filecnt, filenames = jMtkFindFileList_tst_1500();

julia> @test filecnt == 9
Test Passed

julia> @test filenames == [
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DF_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf",
    "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf"]
Test Passed
```
"""
function jMtkFindFileList_tst_1500()
    search_dir = JMtk15_data * "MISR/"
    product = "GRP_RCCM_GM"
    camera = ".*"
    path = 168
    orbit = 68050
    version = "F04_0025"
    filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version);
    return filecnt, filenames
end
