"""
    start_block, end_block = jMtkFileToBlockRange_tst_1100()

# Purpose:
Generate the output of `jMtkFileToBlockRange` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CA_F03_0024.hdf'
IDL> status = MTK_FILE_TO_BLOCKRANGE(filename, start_block, end_block)
IDL> PRINT, start_block
          19
IDL> PRINT, end_block
         162
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToBlockRange_tst_1100.jl")
jMtkFileToBlockRange_tst_1100

julia> start_block, end_block = jMtkFileToBlockRange_tst_1100();

julia> @test (start_block, end_block) == (19, 162)
Test Passed
```
"""
function jMtkFileToBlockRange_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CA_F03_0024.hdf"
    start_block, end_block = jMtkFileToBlockRange(filename)
    return start_block[], end_block[]
end
