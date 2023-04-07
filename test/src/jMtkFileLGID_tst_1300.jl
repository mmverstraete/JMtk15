"""
    lgid = jMtkFileLGID_tst_1300()

# Purpose:
Generate the output of `jMtkFileLGID` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf'
IDL> status = MTK_FILE_LGID(filename, lgid)
IDL> PRINT, lgid
MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileLGID_tst_1300.jl")
jMtkFileLGID_tst_1300

julia> lgid = jMtkFileLGID_tst_1300();

julia> @test lgid == "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
Test Passed
```
"""
function jMtkFileLGID_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
    lgid = jMtkFileLGID(filename)
    return lgid
end
