"""
    metafield = jMtkFileBlockMetaFieldRead_tst_1300()

# Purpose:
Generate the output of `jMtkFileBlockMetaFieldRead` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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

julia> include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1300.jl")
jMtkFileBlockMetaFieldRead_tst_1300

julia> metafield = jMtkFileBlockMetaFieldRead_tst_1300();

julia> @test typeof(metafield) == Vector{Float64}
Test Passed

julia> @test length(metafield) == 162
Test Passed

julia> @test metafield[51:60] == [967450.0; 949850.0; 932250.0; 914650.0;
           914650.0; 897050.0; 879450.0; 861850.0; 844250.0; 844250.0]
Test Passed
```
"""
function jMtkFileBlockMetaFieldRead_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.hdf"
    blockmeta = "PerBlockMetadataCommon"
    fieldname = "Block_coor_lrc_som_meter.y"
    metafield = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
    return metafield
end
