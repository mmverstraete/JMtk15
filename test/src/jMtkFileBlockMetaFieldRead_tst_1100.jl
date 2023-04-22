"""
    metafield = jMtkFileBlockMetaFieldRead_tst_1100()

# Purpose:
Generate the output of `jMtkFileBlockMetaFieldRead` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1100.jl")
jMtkFileBlockMetaFieldRead_tst_1100

julia> metafield = jMtkFileBlockMetaFieldRead_tst_1100();

julia> @test typeof(metafield) == Vector{Float64}
Test Passed

julia> @test length(metafield) == 162
Test Passed

julia> @test metafield[51:60] == [1.464155e7; 1.478235e7; 1.492315e7; 1.506395e7;
           1.520475e7; 1.534555e7; 1.548635e7; 1.562715e7; 1.576795e7; 1.590875e7]
Test Passed
```
"""
function jMtkFileBlockMetaFieldRead_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BF_F03_0024.hdf"
    blockmeta = "PerBlockMetadataCommon"
    fieldname = "Block_coor_lrc_som_meter.x"
    metafield = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
    return metafield
end
