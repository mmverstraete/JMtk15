"""
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_0100()

# Purpose:
Generate the output of `jMtkFileGridFieldToDimList` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> gridname = 'Standard'
IDL> fieldname = 'GeoLatitude'
IDL> status = MTK_FILE_GRID_FIELD_TO_DIMLIST(filename, gridname, fieldname, ndims, dimnames, dimsizes)
IDL> PRINT, ndims
           0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_0100.jl")
jMtkFileGridFieldToDimList_tst_0100

julia> ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_0100();

julia> @test ndims == 0
Test Passed

julia> @test dimnames == String[]
Test Passed

julia> @test dimsizes == Int32[]
Test Passed
```
"""
function jMtkFileGridFieldToDimList_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    gridname = "Standard"
    fieldname = "GeoLatitude"
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList(filename, gridname, fieldname);
    return ndims, dimnames, dimsizes
end
