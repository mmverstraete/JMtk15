"""
    attrval = jMtkFileAttrGet(filename, attrname)

# Purpose:
Return the value of an attribute for a specified file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-01-21).

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"

julia> attrname = "Path_number"
"Path_number"

julia> attrval = jMtkFileAttrGet(filename, attrname)
168
```
"""
function jMtkFileAttrGet(filename::AbstractString, attrname::AbstractString)
    attrbuf = Ref{MTKt_DataBuffer}(MTKT_DATABUFFER_INIT)
    status = ccall((:MtkFileAttrGet, mtklib),
        Cint,
        (Cstring, Cstring, Ptr{MTKt_DataBuffer}),
        filename, attrname, attrbuf)
    if status != 0
        error("jMtkFileAttrGet status = ", status,
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
        error("jMtkFileAttrGet: Type not supported in translation.")
    end

    subptr_c = attrbuf[].dataptr
    GC.@preserve subptr_c begin
        subptr_j = Base.unsafe_convert(Ptr{typeof(ct)}, subptr_c)
        subarr = Base.unsafe_wrap(Array, subptr_j, (attrbuf[].nline, attrbuf[].nsample))
        attrval = subarr[1, 1]
    end
    status = @ccall mtklib.MtkDataBufferFree(
        attrbuf[]::Ref{MTKt_DataBuffer})::Cint
    if status != 0
        error("jMtkFileAttrGet: MtkDataBufferFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return attrval
end
