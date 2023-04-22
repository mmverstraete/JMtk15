"""
    metafield = jMtkFileBlockMetaFieldRead_tst_0100()

# Purpose:
Generate the output of `jMtkFileBlockMetaFieldRead` for testing purposes. Test 0100: For a MISR `AGP` file.

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

julia> include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_0100.jl")
jMtkFileBlockMetaFieldRead_tst_0100

julia> metafield = jMtkFileBlockMetaFieldRead_tst_0100();

julia> @test typeof(metafield) == Vector{Int8}
Test Passed

julia> @test length(metafield) == 180
Test Passed

julia> @test metafield[1:10] == [0; 0; 0; 0; 0; 1; 1; 1; 1; 1]
Test Passed
```
"""
function jMtkFileBlockMetaFieldRead_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    blockmeta = "PerBlockMetadataCommon"
    fieldname = "Ocean_flag"
    metafield = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
    return metafield
end
