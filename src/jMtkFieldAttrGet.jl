"""
    attrval = jMtkFieldAttrGet(filename, fieldname, attrname)

# Purpose:
Return the value of an attribute for a specified file and field.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-01-21).

# Examples:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf"
"/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf"

julia> fieldname = "Cloud"
"Cloud"

julia> attrname = "_FillValue"
"_FillValue"

julia> attrval = jMtkFieldAttrGet(filename, fieldname, attrname)
255
```
"""
function jMtkFieldAttrGet(filename, fieldname, attrname)
    attrbuf = Ref{MTKt_DataBuffer}(MTKT_DATABUFFER_INIT)
    status = ccall((:MtkFieldAttrGet, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Ptr{MTKt_DataBuffer}),
        filename, fieldname, attrname, attrbuf)
    if status != 0
        error("jMtkFieldAttrGet status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end

    jt = attrbuf[].datatype
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
        error("jMtkFieldAttrGet: Type not supported in translation.")
    end

    subptr_c = attrbuf[].dataptr
    GC.@preserve subptr_c begin
        subptr_j = Base.unsafe_convert(Ptr{typeof(ct)}, subptr_c)
        subarr = unsafe_wrap(Array, subptr_j, (attrbuf[].nline, attrbuf[].nsample))
    end

    if jt == MTKe_uint8 || jt == MTKe_uint16 || jt == MTKe_uint32 || jt == MTKe_uint64
        return Int(subarr[attrbuf[].nline, attrbuf[].nsample])
    else
        return subarr[attrbuf[].nline, attrbuf[].nsample]
    end
    status = @ccall mtklib.MtkDataBufferFree(
        attrbuf[]::Ref{MTKt_DataBuffer})::Cint
    if status != 0
        error("jMtkFieldAttrGet: MtkDataBufferFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end

end
