"""
    ngrids, gridlist = jMtkFileToGridList_tst_0100()

# Purpose:
Generate the output of `jMtkFileToGridList` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> filename = root + 'MISR_AM1_AGP_P168_F01_24.hdf'
IDL> status = MTK_FILE_TO_GRIDLIST(filename, ngrids, grid_list)
IDL> PRINT, ngrids
           2
IDL> PRINT, grid_list
Standard Regional
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToGridList_tst_0100.jl")
jMtkFileToGridList_tst_0100

julia> ngrids, gridlist = jMtkFileToGridList_tst_0100();

julia> @test ngrids == 2
Test Passed

julia> @test gridlist == ["Standard", "Regional"]
Test Passed
```
"""
function jMtkFileToGridList_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    ngrids, gridlist = jMtkFileToGridList(filename);
    return ngrids, gridlist
end
