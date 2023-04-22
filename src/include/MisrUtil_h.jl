"""
    include(JMtk15_src * "include/MisrUtil_h.jl")

Partial translation of the symbols defined in the C file "MisrUtil.h" of Mtk.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15)

# Note:
* See the original file for additional details and in-line comments.

# Example:
```julia
julia> using JMtk15

julia> include(JMtk15_src * "include/MisrUtil_h.jl")
```
"""
const MAXDIMS = 10
export MAXDIMS

const MAXSTR = 80
export MAXSTR

const MTKd_NDATATYPE = 13
export MTKd_NDATATYPE

const MTKd_DataType = (
    "void", "char8", "uchar8", "int8", "uint8",
    "int16", "uint16", "int32", "uint32",
    "int64", "uint64", "float", "double")
export MTKd_DataType

const MTKd_DataSize = (
    0, 1, 1, 1, 1, 2, 2, 4, 4, 8, 8, 4, 8)
export MTKd_DataSize

@enum MTKt_DataType::UInt32 begin
    MTKe_void = 0
    MTKe_char8 = 1
    MTKe_uchar8 = 2
    MTKe_int8 = 3
    MTKe_uint8 = 4
    MTKe_int16 = 5
    MTKe_uint16 = 6
    MTKe_int32 = 7
    MTKe_uint32 = 8
    MTKe_int64 = 9
    MTKe_uint64 = 10
    MTKe_float = 11
    MTKe_double = 12
end
export MTKt_DataType


const u_int8_t = Cuchar
export u_int8_t

const u_int16_t = Cushort
export u_int16_t

const u_int32_t = Cuint
export u_int32_t

const u_int64_t = Culonglong
export u_int64_t

const int32 = Cint
export int32


const MTKt_char8 = Cchar
export MTKt_char8

const MTKt_uchar8 = Cuchar
export MTKt_uchar8

const MTKt_int8 = Int8
export MTKt_int8

const MTKt_uint8 = u_int8_t
export MTKt_uint8

const MTKt_int16 = Int16
export MTKt_int16

const MTKt_uint16 = u_int16_t
export MTKt_uint16

const MTKt_int32 = Int32
export MTKt_int32

const MTKt_uint32 = u_int32_t
export MTKt_uint32

const MTKt_int64 = Int64
export MTKt_int64

const MTKt_uint64 = u_int64_t
export MTKt_uint64

const MTKt_float = Cfloat
export MTKt_float

const MTKt_double = Cdouble
export MTKt_double

# 2-dimensional Data Buffer Type Union:
struct MTKt_DataBufferType
    data::NTuple{8, UInt8}
end
export MTKt_DataBufferType

function Base.getproperty(x::Ptr{MTKt_DataBufferType}, f::Symbol)
    f === :v && return Ptr{Ptr{Ptr{Cvoid}}}(x + 0)
    f === :c8 && return Ptr{Ptr{Ptr{MTKt_char8}}}(x + 0)
    f === :uc8 && return Ptr{Ptr{Ptr{MTKt_uchar8}}}(x + 0)
    f === :i8 && return Ptr{Ptr{Ptr{MTKt_int8}}}(x + 0)
    f === :u8 && return Ptr{Ptr{Ptr{MTKt_uint8}}}(x + 0)
    f === :i16 && return Ptr{Ptr{Ptr{MTKt_int16}}}(x + 0)
    f === :u16 && return Ptr{Ptr{Ptr{MTKt_uint16}}}(x + 0)
    f === :i32 && return Ptr{Ptr{Ptr{MTKt_int32}}}(x + 0)
    f === :u32 && return Ptr{Ptr{Ptr{MTKt_uint32}}}(x + 0)
    f === :i64 && return Ptr{Ptr{Ptr{MTKt_int64}}}(x + 0)
    f === :u64 && return Ptr{Ptr{Ptr{MTKt_uint64}}}(x + 0)
    f === :f && return Ptr{Ptr{Ptr{MTKt_float}}}(x + 0)
    f === :d && return Ptr{Ptr{Ptr{MTKt_double}}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MTKt_DataBufferType, f::Symbol)
    r = Ref{MTKt_DataBufferType}(x)
    ptr = Base.unsafe_convert(Ptr{MTKt_DataBufferType}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MTKt_DataBufferType}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# 2-dimensional Data Buffer:
mutable struct MTKt_DataBuffer
    nline::Cint
    nsample::Cint
    datasize::Cint
    datatype::MTKt_DataType
    imported::MTKt_boolean
    data::MTKt_DataBufferType
    vdata::Ptr{Ptr{Cvoid}}
    dataptr::Ptr{Cvoid}
end
export MTKt_DataBuffer

DBT2d0 = MTKt_DataBufferType((0, 0, 0, 0, 0, 0, 0, 0))
export DBT2d0

MTKT_DATABUFFER_INIT = MTKt_DataBuffer(0, 0, 0, MTKe_void, MTK_FALSE,
    DBT2d0, C_NULL, C_NULL)
export MTKT_DATABUFFER_INIT

# 3-dimensional Data Buffer Type Union:
struct MTKt_DataBufferType3D
    data::NTuple{8, UInt8}
end
export MTKt_DataBufferType3D

function Base.getproperty(x::Ptr{MTKt_DataBufferType3D}, f::Symbol)
    f === :v && return Ptr{Ptr{Ptr{Ptr{Cvoid}}}}(x + 0)
    f === :c8 && return Ptr{Ptr{Ptr{Ptr{MTKt_char8}}}}(x + 0)
    f === :uc8 && return Ptr{Ptr{Ptr{Ptr{MTKt_uchar8}}}}(x + 0)
    f === :i8 && return Ptr{Ptr{Ptr{Ptr{MTKt_int8}}}}(x + 0)
    f === :u8 && return Ptr{Ptr{Ptr{Ptr{MTKt_uint8}}}}(x + 0)
    f === :i16 && return Ptr{Ptr{Ptr{Ptr{MTKt_int16}}}}(x + 0)
    f === :u16 && return Ptr{Ptr{Ptr{Ptr{MTKt_uint16}}}}(x + 0)
    f === :i32 && return Ptr{Ptr{Ptr{Ptr{MTKt_int32}}}}(x + 0)
    f === :u32 && return Ptr{Ptr{Ptr{Ptr{MTKt_uint32}}}}(x + 0)
    f === :i64 && return Ptr{Ptr{Ptr{Ptr{MTKt_int64}}}}(x + 0)
    f === :u64 && return Ptr{Ptr{Ptr{Ptr{MTKt_uint64}}}}(x + 0)
    f === :f && return Ptr{Ptr{Ptr{Ptr{MTKt_float}}}}(x + 0)
    f === :d && return Ptr{Ptr{Ptr{Ptr{MTKt_double}}}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::MTKt_DataBufferType3D, f::Symbol)
    r = Ref{MTKt_DataBufferType3D}(x)
    ptr = Base.unsafe_convert(Ptr{MTKt_DataBufferType3D}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MTKt_DataBufferType3D}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# 3-dimensional Data Buffer:
mutable struct MTKt_DataBuffer3D
    nblock::Cint
    nline::Cint
    nsample::Cint
    datasize::Cint
    datatype::MTKt_DataType
    data::MTKt_DataBufferType3D
    vdata::Ptr{Ptr{Ptr{Cvoid}}}
    dataptr::Ptr{Cvoid}
end
export MTKt_DataBuffer3D

DBT3d0 = MTKt_DataBufferType3D((0, 0, 0, 0, 0, 0, 0, 0))
export MTKt_DataBufferType3D

MTKT_DATABUFFER3D_INIT = MTKt_DataBuffer3D(0, 0, 0, 0, MTKe_void, DBT3d0, C_NULL, C_NULL)
export MTKT_DATABUFFER3D_INIT

# Time conversion constants:
const EPOCH_DAY = 2448988.5
export EPOCH_DAY

const EPOCH_DAY_FRACTION = 0.0003125
export EPOCH_DAY_FRACTION

const SECONDSperDAY = 86400.0
export SECONDSperDAY

const SECONDSperHOUR = 3600.0
export SECONDSperHOUR

const SECONDSperMINUTE = 60.0
export SECONDSperMINUTE

const MTKd_DATETIME_LEN = 28
export MTKd_DATETIME_LEN

# /* JD      TAI - UTC */
LEAP_SECONDS = (
    (2441317.5, 10.0), # /* 1972 JAN  1 =JD 2441317.5  TAI-UTC=  10.0000000 S */
    (2441499.5, 11.0), # /* 1972 JUL  1 =JD 2441499.5  TAI-UTC=  11.0000000 S */
    (2441683.5, 12.0), # /* 1973 JAN  1 =JD 2441683.5  TAI-UTC=  12.0000000 S */
    (2442048.5, 13.0), # /* 1974 JAN  1 =JD 2442048.5  TAI-UTC=  13.0000000 S */
    (2442413.5, 14.0), # /* 1975 JAN  1 =JD 2442413.5  TAI-UTC=  14.0000000 S */
    (2442778.5, 15.0), # /* 1976 JAN  1 =JD 2442778.5  TAI-UTC=  15.0000000 S */
    (2443144.5, 16.0), # /* 1977 JAN  1 =JD 2443144.5  TAI-UTC=  16.0000000 S */
    (2443509.5, 17.0), # /* 1978 JAN  1 =JD 2443509.5  TAI-UTC=  17.0000000 S */
    (2443874.5, 18.0), # /* 1979 JAN  1 =JD 2443874.5  TAI-UTC=  18.0000000 S */
    (2444239.5, 19.0), # /* 1980 JAN  1 =JD 2444239.5  TAI-UTC=  19.0000000 S */
    (2444786.5, 20.0), # /* 1981 JUL  1 =JD 2444786.5  TAI-UTC=  20.0000000 S */
    (2445151.5, 21.0), # /* 1982 JUL  1 =JD 2445151.5  TAI-UTC=  21.0000000 S */
    (2445516.5, 22.0), # /* 1983 JUL  1 =JD 2445516.5  TAI-UTC=  22.0000000 S */
    (2446247.5, 23.0), # /* 1985 JUL  1 =JD 2446247.5  TAI-UTC=  23.0000000 S */
    (2447161.5, 24.0), # /* 1988 JAN  1 =JD 2447161.5  TAI-UTC=  24.0000000 S */
    (2447892.5, 25.0), # /* 1990 JAN  1 =JD 2447892.5  TAI-UTC=  25.0000000 S */
    (2448257.5, 26.0), # /* 1991 JAN  1 =JD 2448257.5  TAI-UTC=  26.0000000 S */
    (2448804.5, 27.0), # /* 1992 JUL  1 =JD 2448804.5  TAI-UTC=  27.0000000 S */
    (2449169.5, 28.0), # /* 1993 JUL  1 =JD 2449169.5  TAI-UTC=  28.0000000 S */
    (2449534.5, 29.0), # /* 1994 JUL  1 =JD 2449534.5  TAI-UTC=  29.0000000 S */
    (2450083.5, 30.0), # /* 1996 JAN  1 =JD 2450083.5  TAI-UTC=  30.0000000 S */
    (2450630.5, 31.0), # /* 1997 JUL  1 =JD 2450630.5  TAI-UTC=  31.0000000 S */
    (2451179.5, 32.0), # /* 1999 JAN  1 =JD 2451179.5  TAI-UTC=  32.0000000 S */
    (2453736.5, 33.0), # /* 2006 JAN  1 =JD 2453736.5  TAI-UTC=  33.0000000 S */
    (2454832.5, 34.0), # /* 2009 JAN  1 =JD 2454832.5  TAI-UTC=  34.0000000 S */
    (2456109.5, 35.0), # /* 2012 JUL  1 =JD 2456109.5  TAI-UTC=  35.0000000 S */
    (2457204.5, 36.0), # /* 2015 JUL  1 =JD 2457204.5  TAI-UTC=  36.0000000 S */
    (2457754.5, 37.0) # /* 2017 JAN  1 =JD 2457754.5  TAI-UTC=  37.0000000 S */
    )
export LEAP_SECONDS

struct MTKt_ncvarid
    gid::Cint
    varid::Cint
end
export MTKt_ncvarid
