"""
    datatype = jMtkFileGridFieldToDataType_tst_2500()

# Purpose:
Generate the output of `jMtkFileGridFieldToDataType` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> fieldname = 'Fractional_Absorbed_Photosynthetically_Active_Radiation_Best_Estimate'
IDL> status = MTK_FILE_GRID_FIELD_TO_DATATYPE(filename, gridname, fieldname, idltype)
IDL> PRINT, idltype
           4
```
where `idltype = 4` means the field is of type `FLOAT`, a 32-bit, single-precision, floating-point number.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_2500.jl")
jMtkFileGridFieldToDataType_tst_2500

julia> datatype = jMtkFileGridFieldToDataType_tst_2500();

julia> @test datatype == Float32
Test Passed
```
"""
function jMtkFileGridFieldToDataType_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "1.1_KM_PRODUCTS"
    fieldname = "Fractional_Absorbed_Photosynthetically_Active_Radiation_Best_Estimate"
    datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)
    return datatype
end
