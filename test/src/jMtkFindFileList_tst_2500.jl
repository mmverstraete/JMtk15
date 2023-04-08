"""
    filecnt, filenames = jMtkFindFileList_tst_2500()

# Purpose:
Generate the output of `jMtkFindFileList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
WARNING: This function does not find NetCDF files like the MISR AS_LAND products because it always assumes that file extensions are '.hdf' (instead of '.nc').
```idl
IDL> search_dir = '/Users/michel/Codes/Julia/JMtk15/data/MISR/'
IDL> product = 'AS_LAND'
IDL> camera = ''
IDL> path = 168
IDL> orbit = 68050
IDL> path = '168'
IDL> orbit = '068050'
IDL> version = 'F08_0023'
IDL> status = MTK_FIND_FILELIST(search_dir, product, camera, path, orbit, version, cnt, files)
IDL> PRINT, cnt
           0
```

# Example:
WARNING: This function does not find NetCDF files like the MISR AS_LAND products because it always assumes that file extensions are '.hdf' (instead of '.nc').
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFindFileList_tst_2500.jl")
jMtkFindFileList_tst_2500

julia> filecnt, filenames = jMtkFindFileList_tst_2500();

julia> @test filecnt == 0
Test Passed
```
"""
function jMtkFindFileList_tst_2500()
    search_dir = JMtk15_data * "MISR/"
    product = "AS_LAND"
    camera = ""
    path = 168
    orbit = 68050
    version = "F08_0023"
    filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version);
    return filecnt, filenames
end
