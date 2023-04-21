"""
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)

# Purpose:
Return a single block of MISR data given file, grid, field, and block number.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Note:
* Respect the order of the variables `databuf.nsample` and `databuf.nline` when
retrieving the data buffer values from the double pointer returned by the `ccall`.

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"

julia> gridname = "RedBand"
"RedBand"

julia> fieldname = "Red Radiance/RDQI"
"Red Radiance/RDQI"

julia> blocknum = 110
110

julia> databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum);

julia> typeof(databuf)
Matrix{UInt16} (alias for Array{UInt16, 2})

julia> size(databuf)
(2048, 512)

julia> Int.(transpose(databuf[1001:1005, 251:260]))
10×5 Matrix{Int64}:
 6192  6168  6088  6068  5932
 6192  6160  6032  6068  5924
 6176  6100  6024  6096  6068
 6188  6116  6084  6156  6204
 6296  6252  6240  6212  6228
 6364  6332  6300  6188  6192
 6428  6212  6132  6116  6096
 6412  6132  6044  6076  6056
 6324  6132  6112  6084  6096
 6320  6124  6124  6092  6120
```
"""
function jMtkReadBlock(filename, gridname, fieldname, blocknum)
    databuf = Ref{MTKt_DataBuffer}(MTKT_DATABUFFER_INIT)
    status = ccall((:MtkReadBlock, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Cint, Ptr{MTKt_DataBuffer}),
        filename, gridname, fieldname, blocknum, databuf)
    if status != 0
        error("jMtkReadBlock status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    nl = databuf[].nline
    ns = databuf[].nsample
    dt = databuf[].datatype
    r = databuf[].dataptr

    # Note: `dt = databuf[].datatype` is set to one of the `MTKe_xxx` labels defined in "MisrUtil_h.jl" by the C function, not one of the types recognizable by Julia, such as UInt8 or UInt16. The following if statement defines a variable `ct` of the appropriate type `dt`, and this value is used in the `unsafe_wrap` statement to keep the data in the designated type.

    if dt == MTKe_char8
        ct = Cchar
    elseif dt == MTKe_uchar8
        ct = Cuchar
    elseif dt == MTKe_int8
        ct = Int8
    elseif dt == MTKe_uint8
        ct = UInt8
    elseif dt == MTKe_int16
        ct = Int16
    elseif dt == MTKe_uint16
        ct = UInt16
    elseif dt == MTKe_int32
        ct = Int32
    elseif dt == MTKe_uint32
        ct = UInt32
    elseif dt == MTKe_int64
        ct = Int64
    elseif dt == MTKe_uint64
        ct = UInt64
    elseif dt == MTKe_float
        ct = Float32
    elseif dt == MTKe_double
        ct = Float64
    else
        error("jMtkReadData: Type not supported in translation.")
    end

    GC.@preserve databuf begin
        julia_databuf = unsafe_wrap(Array, Ptr{ct}(r), (ns, nl); own = false)
    end
    return julia_databuf
end
