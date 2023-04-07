"""
    status = jMtkFileGridFieldCheck_tst_2300()

# Purpose:
Generate the output of `jMtkFileGridFieldCheck` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> status = MTK_FILE_GRID_FIELD_CHECK( filename, gridname, fieldname)
IDL> PRINT, MTK_ERROR_MESSAGE(status)
SUCCESS
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_2300.jl")
jMtkFileGridFieldCheck_tst_2300

julia> status = jMtkFileGridFieldCheck_tst_2300();

julia> @test status == "SUCCESS"
Test Passed
```
"""
function jMtkFileGridFieldCheck_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    gridname = "Stereo_1.1_km"
    fieldname = "CloudTopHeight"
    status = jMtkFileGridFieldCheck(filename, gridname, fieldname)
    return status
end
