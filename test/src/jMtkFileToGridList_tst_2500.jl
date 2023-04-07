"""
    ngrids, gridlist = jMtkFileToGridList_tst_2500()

# Purpose:
Generate the output of `jMtkFileToGridList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> filename = root + 'MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc'
IDL> status = MTK_FILE_TO_GRIDLIST(filename, ngrids, grid_list)
IDL> PRINT, ngrids
           2
IDL> PRINT, grid_list
4.4_KM_PRODUCTS 1.1_KM_PRODUCTS
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToGridList_tst_2500.jl")
jMtkFileToGridList_tst_2500

julia> ngrids, gridlist = jMtkFileToGridList_tst_2500();

julia> @test ngrids == 2
Test Passed

julia> @test gridlist == ["4.4_KM_PRODUCTS", "1.1_KM_PRODUCTS"]
Test Passed
```
"""
function jMtkFileToGridList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    ngrids, gridlist = jMtkFileToGridList(filename);
    return ngrids, gridlist
end
