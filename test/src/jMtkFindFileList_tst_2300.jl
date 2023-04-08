"""
    filecnt, filenames = jMtkFindFileList_tst_2300()

# Purpose:
Generate the output of `jMtkFindFileList` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> product = 'TC_CLOUD'
IDL> camera = ''
IDL> path = '168'
IDL> orbit = '068050'
IDL> version = 'F01_0001'
IDL> status = MTK_FIND_FILELIST(search_dir, product, camera, path, orbit, version, cnt, files)
IDL> PRINT, cnt
           1
IDL> PRINT, files
/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFindFileList_tst_2300.jl")
jMtkFindFileList_tst_2300

julia> filecnt, filenames = jMtkFindFileList_tst_2300();

julia> @test filecnt == 1
Test Passed

julia> @test filenames == ["/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"]
Test Passed
```
"""
function jMtkFindFileList_tst_2300()
    search_dir = JMtk15_data * "MISR/"
    product = "TC_CLOUD"
    camera = ""
    path = 168
    orbit = 68050
    version = "F01_0001"
    filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version);
    return filecnt, filenames
end
