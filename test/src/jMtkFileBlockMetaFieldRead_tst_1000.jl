"""
    metafield = jMtkFileBlockMetaFieldRead_tst_1000()

# Purpose:
Generate the output of `jMtkFileBlockMetaFieldRead` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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

julia> include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1000.jl")
jMtkFileBlockMetaFieldRead_tst_1000

julia> metafield = jMtkFileBlockMetaFieldRead_tst_1000();

julia> @test typeof(metafield) == Vector{Float64}
Test Passed

julia> @test length(metafield) == 164
Test Passed

julia> @test metafield[51:60] == [1.450075e7; 1.464155e7; 1.478235e7; 1.492315e7;
           1.506395e7; 1.520475e7; 1.534555e7; 1.548635e7; 1.562715e7; 1.576795e7]
Test Passed
```
"""
function jMtkFileBlockMetaFieldRead_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    blockmeta = "PerBlockMetadataCommon"
    fieldname = "Block_coor_ulc_som_meter.x"
    metafield = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
    return metafield
end
