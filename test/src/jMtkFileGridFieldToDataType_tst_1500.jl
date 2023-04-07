"""
    datatype = jMtkFileGridFieldToDataType_tst_1500()

# Purpose:
Generate the output of `jMtkFileGridFieldToDataType` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf'
IDL> gridname = 'RCCM'
IDL> fieldname = 'Cloud'
IDL> status = MTK_FILE_GRID_FIELD_TO_DATATYPE(filename, gridname, fieldname, idltype)
IDL> PRINT, idltype
           1
```
where `idltype = 1` means the field is of type `BYTE`, an 8-bit unsigned integer number.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1500.jl")
jMtkFileGridFieldToDataType_tst_1500

julia> datatype = jMtkFileGridFieldToDataType_tst_1500();

julia> @test datatype == UInt8
Test Passed
```
"""
function jMtkFileGridFieldToDataType_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf"
    gridname = "RCCM"
    fieldname = "Cloud"
    datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)
    return datatype
end
