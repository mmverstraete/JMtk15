"""
    metafield = jMtkFileBlockMetaFieldRead_tst_1500()

# Purpose:
Generate the output of `jMtkFileBlockMetaFieldRead` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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

julia> include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1500.jl")
jMtkFileBlockMetaFieldRead_tst_1500

julia> metafield = jMtkFileBlockMetaFieldRead_tst_1500();

julia> @test typeof(metafield) == Vector{Float64}
Test Passed

julia> @test length(metafield) == 162
Test Passed

julia> @test metafield[51:60] == [404250.0; 386650.0; 369050.0; 351450.0;
           351450.0; 333850.0; 316250.0; 298650.0; 281050.0; 281050.0]
Test Passed
```
"""
function jMtkFileBlockMetaFieldRead_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf"
    blockmeta = "PerBlockMetadataCommon"
    fieldname = "Block_coor_ulc_som_meter.y"
    metafield = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
    return metafield
end
