"""
    nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_2300()

# Purpose:
Generate the output of `jMtkFileBlockMetaList` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf'
IDL> status = MTK_FILE_BLOCK_META_LIST(filename, nblockmeta, blockmetalist)
IDL> PRINT, nblockmeta
           3
IDL> PRINT, blockmetalist
PerBlockMetadataCommon Common Per Block Metadata PerBlockMetadataTime
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_2300.jl")
jMtkFileBlockMetaList_tst_2300

julia> nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_2300();

julia> @test nblockmeta == 3
Test Passed

julia> @test blockmetalist == ["PerBlockMetadataCommon", "Common Per Block Metadata", "PerBlockMetadataTime"]
Test Passed
```
"""
function jMtkFileBlockMetaList_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    nblockmeta, blockmetalist = jMtkFileBlockMetaList(filename)
    return nblockmeta, blockmetalist
end
