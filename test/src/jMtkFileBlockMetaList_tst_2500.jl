"""
    nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_2500()

# Purpose:
Generate the output of `jMtkFileBlockMetaList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
WARNING: This function does not work with NetCDF files.
```idl
IDL> filename = root + 'MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc'
IDL> status = MTK_FILE_BLOCK_META_LIST(filename, nblockmeta, blockmetalist)
% MTK_FILE_BLOCK_META_LIST: HDF HDFOPEN FAILED
```

# Example:
WARNING: This function does not work with NetCDF files.
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_2500.jl")
jMtkFileBlockMetaList_tst_2500

julia> nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_2500()
ERROR: jMtkFileBlockMetaList status = 29, error message = HDF HDFOPEN FAILED
Stacktrace:
 [1] error(::String, ::Int32, ::String, ::String)
   @ Base ./error.jl:44
 [2] jMtkFileBlockMetaList(filename::String)
   @ JMtk15 ~/Codes/Julia/JMtk15/src/jMtkFileBlockMetaList.jl:44
 [3] jMtkFileBlockMetaList_tst_2500()
   @ Main ~/Codes/Julia/JMtk15/test/src/jMtkFileBlockMetaList_tst_2500.jl:46
 [4] top-level scope
   @ REPL[35]:1
```
"""
function jMtkFileBlockMetaList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    nblockmeta, blockmetalist = jMtkFileBlockMetaList(filename)
    return nblockmeta, blockmetalist
end
