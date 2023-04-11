"""
    fillval = jMtkFillValueGet(filename, gridname, fieldname)

# Purose:
Return the fill value for a given MISR product filename, gridname, and fieldname.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Notes:
* MISR AGP files provide valid data everywhere, and thus do not feature fill data.
* For all other MISR data files, the value of the first sample in the first
    line is deemed to be a fill value.

# Examples:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"
"/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"

julia> gridname = "RedBand"
"RedBand"

julia> fieldname = "Red Radiance/RDQI"
"Red Radiance/RDQI"

julia> fillval = jMtkFillValueGet(filename, gridname, fieldname)
65515

julia> 

julia> gridname = "BRF Conversion Factors"
"BRF Conversion Factors"

julia> fieldname = "BlueConversionFactor"
"BlueConversionFactor"

julia> fillval = jMtkFillValueGet(filename, gridname, fieldname)
-555
```
"""
function jMtkFillValueGet(filename, gridname, fieldname)
    fillbuf = Ref{MTKt_DataBuffer}(MTKT_DATABUFFER_INIT)
    status = ccall((:MtkFillValueGet, mtklib),
        Cint,
        (Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}, Ptr{MTKt_DataBuffer}),
        filename, gridname, fieldname, fillbuf)
    if status != 0
        error("jMtkFillValueGet status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end

    jt = fillbuf[].datatype
    if jt == MTKe_char8
        ct = convert(Cchar, '1')
    elseif jt == MTKe_uchar8
        ct = convert(Cuchar, '1')
    elseif jt == MTKe_int8
        ct = convert(Int8, 1)
    elseif jt == MTKe_uint8
        ct = convert(Cuchar, 1)
    elseif jt == MTKe_int16
        ct = convert(Int16, 1)
    elseif jt == MTKe_uint16
        ct = convert(Cushort, 1)
    elseif jt == MTKe_int32
        ct = convert(Cint, 1)
    elseif jt == MTKe_uint32
        ct = convert(Cuint, 1)
    elseif jt == MTKe_int64
        ct = convert(Int64, 1)
    elseif jt == MTKe_uint64
        ct = convert(Culonglong, 1)
    elseif jt == MTKe_float
        ct = convert(Cfloat, 1)
    elseif jt == MTKe_double
        ct = convert(Cdouble, 1)
    else
        error("jMtkFillValueGet: Type not supported in translation.")
    end

    subptr_c = fillbuf[].dataptr
    GC.@preserve subptr_c begin
        subptr_j = Base.unsafe_convert(Ptr{typeof(ct)}, subptr_c)
        subarr = Base.unsafe_wrap(Array, subptr_j, (fillbuf[].nline, fillbuf[].nsample))
        fillval = Int(subarr[1, 1])
    end
    status = @ccall mtklib.MtkDataBufferFree(
        fillbuf[]::Ref{MTKt_DataBuffer})::Cint
    if status != 0
        error("jMtkFillValueGet: MtkDataBufferFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return fillval
end
