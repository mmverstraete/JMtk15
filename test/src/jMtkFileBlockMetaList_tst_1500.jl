"""
    nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_1500()

# Purpose:
Generate the output of `jMtkFileBlockMetaList` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf'
IDL> status = MTK_FILE_BLOCK_META_LIST(filename, nblockmeta, blockmetalist)
IDL> PRINT, nblockmeta
           1
IDL> PRINT, blockmetalist
PerBlockMetadataCommon
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_1500.jl")
jMtkFileBlockMetaList_tst_1500

julia> nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_1500();

julia> @test nblockmeta == 1
Test Passed

julia> @test blockmetalist == ["PerBlockMetadataCommon"]
Test Passed
```
"""
function jMtkFileBlockMetaList_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf"
    nblockmeta, blockmetalist = jMtkFileBlockMetaList(filename)
    return nblockmeta, blockmetalist
end
