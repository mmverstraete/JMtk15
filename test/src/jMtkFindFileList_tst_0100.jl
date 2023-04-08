"""
    filecnt, filenames = jMtkFindFileList_tst_0100()

# Purpose:
Generate the output of `jMtkFindFileList` for testing purposes. Test 0100: For a MISR `AGP` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
WARNING: This function does not currently work to locate `AGP` files because the C code always expects an orbit number, which is absent from the filename of AGP files.
```idl
IDL> search_dir = '/Users/michel/Codes/Julia/JMtk15/data/MISR/'
IDL> product = 'AGP'
IDL> camera = ''
IDL> path = '168'
IDL> orbit = ''
IDL> version = 'F01_24'
IDL> status = MTK_FIND_FILELIST(search_dir, product, camera, path, orbit, version, cnt, files)
IDL> PRINT, cnt
           0
IDL> PRINT, files
% PRINT: Variable is undefined: FILES.
% Execution halted at: MAIN          
```

# Example:
WARNING: This function does not currently work to locate `AGP` files because the C code always expects an orbit number, which is absent from the filename of AGP files.
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFindFileList_tst_0100.jl")
jMtkFindFileList_tst_0100

julia> filecnt, filenames = jMtkFindFileList_tst_0100();

julia> @test filecnt == 1
Test Passed
```
"""
function jMtkFindFileList_tst_0100()
    search_dir = JMtk15_data * "MISR/"
    product = "AGP"
    camera = ""
    path = 168
    orbit = 0
    version = "F01_24"
    filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version);
    return filecnt, filenames
end
