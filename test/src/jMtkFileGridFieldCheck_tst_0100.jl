"""
    status = jMtkFileGridFieldCheck_tst_0100()

# Purpose:
Generate the output of `jMtkFileGridFieldCheck` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> fieldname = 'AveSurfNormAzAng'
IDL> status = MTK_FILE_GRID_FIELD_CHECK( filename, gridname, fieldname)
IDL> PRINT, MTK_ERROR_MESSAGE(status)
SUCCESS
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_0100.jl")
jMtkFileGridFieldCheck_tst_0100

julia> status = jMtkFileGridFieldCheck_tst_0100();

julia> @test status == "SUCCESS"
Test Passed
```
"""
function jMtkFileGridFieldCheck_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    gridname = "Standard"
    fieldname = "AveSurfNormAzAng"
    status = jMtkFileGridFieldCheck(filename, gridname, fieldname)
    return status
end
