"""
    databuf = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)

# Purpose:
Retrieve the block metadata fields of a file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# WARNING:
If present, the `@ccall mtklib.MtkStringListFree` at the end of this function causes a segmentation fault...

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf"

julia> blockmeta = "PerBlockMetadataCommon"
"PerBlockMetadataCommon"

julia> fieldname = "Block_number"
"Block_number"

julia> databuf = jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
162-element Vector{Int32}:
   0
   0
   0
   0
   0
   0
   0
   0
   0
   0
   ⋮
 154
 155
 156
 157
 158
 159
 160
 161
 162
```
"""
function jMtkFileBlockMetaFieldRead(filename, blockmeta, fieldname)
    databuf = Ref{MTKt_DataBuffer}(MTKT_DATABUFFER_INIT)
    status = ccall((:MtkFileBlockMetaFieldRead, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Ptr{MTKt_DataBuffer}),
        filename, blockmeta, fieldname, databuf)
    if status != 0
        error("jMtkFileBlockMetaFieldRead status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    nl = databuf[].nline
    ns = databuf[].nsample
    dt = databuf[].datatype
    r = databuf[].dataptr
 
    if dt == MTKe_char8
        ct = convert(Cchar, '1')
    elseif dt == MTKe_uchar8
        ct = convert(Cuchar, '1')
    elseif dt == MTKe_int8
        ct = convert(Int8, 1)
    elseif dt == MTKe_uint8
        ct = convert(Cuchar, 1)
    elseif dt == MTKe_int16
        ct = convert(Int16, 1)
    elseif dt == MTKe_uint16
        ct = convert(Cushort, 1)
    elseif dt == MTKe_int32
        ct = convert(Cint, 1)
    elseif dt == MTKe_uint32
        ct = convert(Cuint, 1)
    elseif dt == MTKe_int64
        ct = convert(Int64, 1)
    elseif dt == MTKe_uint64
        ct = convert(Culonglong, 1)
    elseif dt == MTKe_float
        ct = convert(Cfloat, 1)
    elseif dt == MTKe_double
        ct = convert(Cdouble, 1)
    else
        error("jMtkFileBlockMetaFieldRead: Type not supported in translation.")
    end

    GC.@preserve databuf begin
        arr = Base.unsafe_convert(Ptr{typeof(ct)}, r)
        metafield = Base.unsafe_wrap(Array, arr, (nl, ns); own = true)
        if nl == 1 || ns == 1
            metafield = vec(metafield)
        end
    end
    return metafield
end
