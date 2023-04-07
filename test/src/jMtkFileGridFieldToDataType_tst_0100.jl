"""
    datatype = jMtkFileGridFieldToDataType_tst_0100()

# Purpose:
Generate the output of `jMtkFileGridFieldToDataType` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> fieldname = 'AveSceneElev'
IDL> status = MTK_FILE_GRID_FIELD_TO_DATATYPE(filename, gridname, fieldname, idltype)
IDL> PRINT, idltype
           2
```
where `idltype = 2` means the field is of type `INT`, a 16-bit integer number.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_0100.jl")
jMtkFileGridFieldToDataType_tst_0100

julia> datatype = jMtkFileGridFieldToDataType_tst_0100();

julia> @test datatype == Int16
Test Passed
```
"""
function jMtkFileGridFieldToDataType_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    gridname = "Standard"
    fieldname = "AveSceneElev"
    datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)
    return datatype
end
