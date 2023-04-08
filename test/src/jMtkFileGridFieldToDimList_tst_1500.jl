"""
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_1500()

# Purpose:
Generate the output of `jMtkFileGridFieldToDimList` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf'
IDL> gridname = 'RCCM'
IDL> fieldname = 'Dust_test'
IDL> status = MTK_FILE_GRID_FIELD_TO_DIMLIST(filename, gridname, fieldname, ndims, dimnames, dimsizes)
IDL> PRINT, ndims
           0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_1500.jl")
jMtkFileGridFieldToDimList_tst_1500

julia> ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_1500();

julia> @test ndims == 0
Test Passed

julia> @test dimnames == String[]
Test Passed

julia> @test dimsizes == Int32[]
Test Passed
```
"""
function jMtkFileGridFieldToDimList_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf"
    gridname = "RCCM"
    fieldname = "Dust_test"
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList(filename, gridname, fieldname);
    return ndims, dimnames, dimsizes
end
