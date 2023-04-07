"""
    ngrids, gridlist = jMtkFileToGridList_tst_1500()

# Purpose:
Generate the output of `jMtkFileToGridList` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf'
IDL> status = MTK_FILE_TO_GRIDLIST(filename, ngrids, grid_list)
IDL> PRINT, ngrids
           1
IDL> PRINT, grid_list
RCCM
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToGridList_tst_1500.jl")
jMtkFileToGridList_tst_1500

julia> ngrids, gridlist = jMtkFileToGridList_tst_1500();

julia> @test ngrids == 1
Test Passed

julia> @test gridlist == ["RCCM"]
Test Passed
```
"""
function jMtkFileToGridList_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf"
    ngrids, gridlist = jMtkFileToGridList(filename);
    return ngrids, gridlist
end
