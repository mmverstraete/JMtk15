"""
    datatype = jMtkFileGridFieldToDataType_tst_1000()

# Purpose:
Generate the output of `jMtkFileGridFieldToDataType` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> filename = root + 'MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf'
IDL> gridname = 'GeometricParameters'
IDL> fieldname = 'CaZenith'
IDL> status = MTK_FILE_GRID_FIELD_TO_DATATYPE(filename, gridname, fieldname, idltype)
IDL> PRINT, idltype
           5
```
where `idltype = 5` means the field is of type `DOUBLE`, a 64-bit floating point number.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1000.jl")
jMtkFileGridFieldToDataType_tst_1000

julia> datatype = jMtkFileGridFieldToDataType_tst_1000();

julia> @test datatype == Float64
Test Passed
```
"""
function jMtkFileGridFieldToDataType_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    gridname = "GeometricParameters"
    fieldname = "CaZenith"
    datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)
    return datatype
end
