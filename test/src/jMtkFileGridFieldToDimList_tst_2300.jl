"""
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_test_2300()

# Purpose:
Generate the output of `jMtkFileGridFieldToDimList` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> gridname = 'Stereo_1.1_km'
IDL> fieldname = 'CloudTopHeight'
IDL> status = MTK_FILE_GRID_FIELD_TO_DIMLIST(filename, gridname, fieldname, ndims, dimnames, dimsizes)
IDL> PRINT, ndims
           0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDimList_test_2300.jl")
jMtkFileGridFieldToDimList_test_2300

julia> ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_test_2300();

julia> @test ndims == 0
Test Passed

julia> @test dimnames == String[]
Test Passed

julia> @test dimsizes == Int32[]
Test Passed
```
"""
function jMtkFileGridFieldToDimList_test_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    gridname = "Stereo_1.1_km"
    fieldname = "CloudTopHeight"
    ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList(filename, gridname, fieldname);
    return ndims, dimnames, dimsizes
end
