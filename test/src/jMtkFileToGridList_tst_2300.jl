"""
    ngrids, gridlist = jMtkFileToGridList_tst_2300()

# Purpose:
Generate the output of `jMtkFileToGridList` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf'
IDL> status = MTK_FILE_TO_GRIDLIST(filename, ngrids, grid_list)
IDL> PRINT, ngrids
           3
IDL> PRINT, grid_list
Motion_17.6_km Stereo_WithoutWindCorrection_1.1_km Stereo_1.1_km
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToGridList_tst_2300.jl")
jMtkFileToGridList_tst_2300

julia> ngrids, gridlist = jMtkFileToGridList_tst_2300();

julia> @test ngrids == 3
Test Passed

julia> @test gridlist == ["Motion_17.6_km", "Stereo_WithoutWindCorrection_1.1_km", "Stereo_1.1_km"]
Test Passed
```
"""
function jMtkFileToGridList_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    ngrids, gridlist = jMtkFileToGridList(filename);
    return ngrids, gridlist
end
