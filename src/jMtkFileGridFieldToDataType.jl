"""
    datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)

# Purpose:
Return the data type code of the given file/grid/field combination.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Note:
In line with the IDL version of this function, `jMtkFileGridFieldToDataType` returns the Julia data type of the field, rather than the C data type: for instance, `Int32` rather than `int`, or `Float64` rather than `double`.

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf"

julia> gridname = "GreenBand"
"GreenBand"

julia> fieldname = "Green Radiance/RDQI"
"Green Radiance/RDQI"

julia> datatype = jMtkFileGridFieldToDataType(filename, gridname, fieldname)
"uint16"
```
"""
function jMtkFileGridFieldToDataType(filename::AbstractString, gridname::AbstractString, fieldname::AbstractString)
    datatype = Ref{Cuint}(0)
    status = ccall((:MtkFileGridFieldToDataType, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Ref{Cuint}),
        filename, gridname, fieldname, datatype)
    if status != 0
        error("jMtkFileGridFieldToDataType status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    if datatype[] == 0
        return C_NULL
    elseif datatype[] == 1
        return Cchar
    elseif datatype[] == 2
        return UInt8
    elseif datatype[] == 3
        return Cchar
    elseif datatype[] == 4
        return UInt8
    elseif datatype[] == 5
        return Int16
    elseif datatype[] == 6
        return UInt16
    elseif datatype[] == 7
        return Int32
    elseif datatype[] == 8
        return UInt32
    elseif datatype[] == 9
        return Int64
    elseif datatype[] == 10
        return UInt64
    elseif datatype[] == 11
        return Float32
    elseif datatype[] == 12
        return Float64
    end
end
