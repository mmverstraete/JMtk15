"""
    datatype = jMtkFileGridFieldToDataType_tst_1300()

# Purpose:
Generate the output of `jMtkFileGridFieldToDataType` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf'
IDL> gridname = 'BRF Conversion Factors'
IDL> fieldname = 'NIRConversionFactor'
IDL> status = MTK_FILE_GRID_FIELD_TO_DATATYPE(filename, gridname, fieldname, idltype)
IDL> PRINT, idltype
           4
```
where `idltype = 4` means the field is of type `FLOAT`, a 32-bit, single-precision, floating-point number.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1300.jl")
jMtkFileGridFieldToDataType_tst_1300

julia> datatype = jMtkFileGridFieldToDataType_tst_1300();

julia> @test datatype == Float32
Test Passed
```
"""
function jMtkFileGridFieldToDataType_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    gridname = "BRF Conversion Factors"
    fieldname = "NIRConversionFactor"
    datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)
    return datatype
end
