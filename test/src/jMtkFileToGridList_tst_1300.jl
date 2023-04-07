"""
    ngrids, gridlist = jMtkFileToGridList_tst_1300()

# Purpose:
Generate the output of `jMtkFileToGridList` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf'
IDL> status = MTK_FILE_TO_GRIDLIST(filename, ngrids, grid_list)
IDL> PRINT, ngrids
           6
IDL> PRINT, grid_list
BlueBand GreenBand RedBand NIRBand BRF Conversion Factors GeometricParameters
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToGridList_tst_1300.jl")
jMtkFileToGridList_tst_1300

julia> ngrids, gridlist = jMtkFileToGridList_tst_1300();

julia> @test ngrids == 6
Test Passed

julia> @test gridlist == ["BlueBand", "GreenBand", "RedBand", "NIRBand", "BRF Conversion Factors", "GeometricParameters"]
Test Passed
```
"""
function jMtkFileToGridList_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    ngrids, gridlist = jMtkFileToGridList(filename);
    return ngrids, gridlist
end
