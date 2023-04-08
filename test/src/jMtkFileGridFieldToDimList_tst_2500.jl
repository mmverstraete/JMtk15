"""
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_2500()

# Purpose:
Generate the output of `jMtkFileGridFieldToDimList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> gridname = '1.1_KM_PRODUCTS'
IDL> fieldname = 'Bidirectional_Reflectance_Factor'
IDL> status = MTK_FILE_GRID_FIELD_TO_DIMLIST(filename, gridname, fieldname, ndims, dimnames, dimsizes)
IDL> PRINT, ndims
           2
IDL> PRINT, dimnames
Band_Dim Camera_Dim
IDL> PRINT, dimsizes
           4           9
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_2500.jl")
jMtkFileGridFieldToDimList_tst_2500

julia> ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_2500();

julia> @test ndims == 2
Test Passed

julia> @test dimnames == ["Band_Dim", "Camera_Dim"]
Test Passed

julia> @test dimsizes == [4, 9]
Test Passed
```
"""
function jMtkFileGridFieldToDimList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "1.1_KM_PRODUCTS"
    fieldname = "Bidirectional_Reflectance_Factor"
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList(filename, gridname, fieldname);
    return ndims, dimnames, dimsizes
end
