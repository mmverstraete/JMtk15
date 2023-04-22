"""
    include(JMtk15_src * "include/MisrFileQuery_h.jl")

Partial translation of the symbols defined in the C file "MisrFileQuery.h" of Mtk.

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

julia> include(JMtk15_src * "include/MisrFileQuery_h.jl")
```
"""
@cenum MTKt_FileType::UInt32 begin
    MTK_AGP = 0
    MTK_GP_GMP = 1
    MTK_GRP_RCCM = 2
    MTK_GRP_ELLIPSOID_GM = 3
    MTK_GRP_TERRAIN_GM = 4
    MTK_GRP_ELLIPSOID_LM = 5
    MTK_GRP_TERRAIN_LM = 6
    MTK_AS_AEROSOL = 7
    MTK_AS_LAND = 8
    MTK_TC_ALBEDO = 9
    MTK_TC_CLASSIFIERS = 10
    MTK_TC_STEREO = 11
    MTK_PP = 12
    MTK_CONVENTIONAL = 13
    MTK_UNKNOWN = 14
    MTK_TC_CLOUD = 15
    MTK_HR_BRF = 16
    MTK_HR_RPV = 17
    MTK_HR_TIP = 18
end
export MTKt_FileType

const MTKt_FileType_Desc = (
    "AGP",
    "GP_GMP",
    "GRP_RCCM",
    "GRP_ELLIPSOID_GM",
    "GRP_TERRAIN_GM",
    "GRP_ELLIPSOID_LM",
    "GRP_TERRAIN_LM",
    "AS_AEROSOL",
    "AS_LAND",
    "TC_ALBEDO",
    "TC_CLASSIFIERS",
    "TC_STEREO",
    "PP",
    "CONVENTIONAL",
    "UNKNOWN",
    "TC_CLOUD",
    "HR_BRF",
    "HR_RPV",
    "HR_TIP")
export MTKt_FileType_Desc

# Core Metadata:
struct var"##Ctag#357"
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{var"##Ctag#357"}, f::Symbol)
    f === :s && return Ptr{Ptr{Ptr{Cchar}}}(x + 0)
    f === :i && return Ptr{Ptr{Cint}}(x + 0)
    f === :d && return Ptr{Ptr{Cdouble}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::var"##Ctag#357", f::Symbol)
    r = Ref{var"##Ctag#357"}(x)
    ptr = Base.unsafe_convert(Ptr{var"##Ctag#357"}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{var"##Ctag#357"}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

mutable struct MtkCoreMetaData
    data::NTuple{24, UInt8}
#     data::Vector{UInt8, 24}
#     data::StaticVector{24, UInt8}
end

function Base.getproperty(x::Ptr{MtkCoreMetaData}, f::Symbol)
    f === :data && return Ptr{var"##Ctag#357"}(x + 0)
    f === :num_values && return Ptr{Cint}(x + 8)
    f === :datatype && return Ptr{Cvoid}(x + 12)
    f === :dataptr && return Ptr{Ptr{Cvoid}}(x + 16)
    return getfield(x, f)
end

function Base.getproperty(x::MtkCoreMetaData, f::Symbol)
    r = Ref{MtkCoreMetaData}(x)
    ptr = Base.unsafe_convert(Ptr{MtkCoreMetaData}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{MtkCoreMetaData}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

# Code suggested by Clang:
# const MTK_CORE_METADATA_INIT = {{NULL}, 0, MTKMETA_CHAR, NULL}
# but the syntax {} is not acceptable, and the identifier MTKMETA_CHAR is not explicitly defined; in fact the C statement `enum {MTKMETA_CHAR, MTKMETA_INT, MTKMETA_DOUBLE} datatype` sets MTKMETA_CHAR to 0, MTKMETA_INT to 1 and MTKMETA_DOUBLE to 2.
# const MTK_CORE_METADATA_INIT = ((C_NULL), 0x0, 0x0, C_NULL)
# Code attempt, based on similarities with earlier experiences (it compiles but is not working at run time):
#const MTK_CORE_METADATA_INIT = ([C_NULL], 0, (Cchar('\0')), C_NULL)
#const MTK_CORE_METADATA_INIT = ([""], [Int32(0)], 0.0, Int32(0), "", C_NULL)
#const MTK_CORE_METADATA_INIT = ([C_NULL], 0, UInt8('\0'), C_NULL)
#MTK_CORE_METADATA_INIT = Array{UInt8}(0, 24)
# MTK_CORE_METADATA_INIT = NTuple{24, UInt8}, 0
# MTK_CORE_METADATA_INIT =
#     (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
# MTK_CORE_METADATA_INIT = StaticVector{24, UInt8}(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
#     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
# MTK_CORE_METADATA_INIT =
#     (0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0)
# export MTK_CORE_METADATA_INIT

const NGRIDCELL = 2
export NGRIDCELL

# Time Metadata:
# The following structure and associated initial value are suggested by CLang:
# struct MTKt_TimeMetaData
#     path::MTKt_int32
#     start_block::MTKt_int32
#     end_block::MTKt_int32
#     camera::NTuple{3, MTKt_char8}
#     number_transform::NTuple{181, MTKt_int32}
#     ref_time::NTuple{181, NTuple{2, NTuple{28, MTKt_char8}}}
#     start_line::NTuple{181, NTuple{2, MTKt_int32}}
#     number_line::NTuple{181, NTuple{2, MTKt_int32}}
#     coeff_line::NTuple{181, NTuple{6, NTuple{2, MTKt_double}}}
#     som_ctr_x::NTuple{181, NTuple{2, MTKt_double}}
#     som_ctr_y::NTuple{181, NTuple{2, MTKt_double}}
# end

# const MTKT_TIME_METADATA_INIT = {0, 0, 0, {Cchar('\0')}, {0}, {{{Cchar('\0')}}},
#     {{0}}, {{0}}, {{{0.0}}}, {{0.0}}, {{0.0}}}

# The following structure works but appears to significantly slow down compilation
# (when `using JMtk15` as well as execution (when calling the function `jMtkTimeMetaRead.jl`):
struct MTKt_TimeMetaData
    path::Int32
    start_block::Int32
    end_block::Int32
    camera::SVector{3, UInt8}
    number_transform::SVector{181, Int32}
    ref_time::SVector{181, SVector{2, SVector{28, UInt8}}}
    start_line::SVector{181, SVector{2, Int32}}
    number_line::SVector{181, SVector{2, Int32}}
    coeff_line::SVector{181, SVector{6, SVector{2, Float64}}}
    som_ctr_x::SVector{181, SVector{2, Float64}}
    som_ctr_y::SVector{181, SVector{2, Float64}}
end

# The following structure implements the same approach as above, but uses regular Vector
# rather than SVector syntax, as using the latter is not recommended for arrays of more
# than 100 elements, but it generates `ERROR: LoadError: too many parameters for type`!
# struct MTKt_TimeMetaData
#     path::Int32
#     start_block::Int32
#     end_block::Int32
#     camera::Vector{3, UInt8}
#     number_transform::Vector{181, Int32}
#     ref_time::Vector{181, Vector{2, Vector{28, UInt8}}}
#     start_line::Vector{181, Vector{2, Int32}}
#     number_line::Vector{181, Vector{2, Int32}}
#     coeff_line::Vector{181, Vector{6, Vector{2, Float64}}}
#     som_ctr_x::Vector{181, Vector{2, Float64}}
#     som_ctr_y::Vector{181, Vector{2, Float64}}
# end

const sv28c = zeros(UInt8, 28)
const sv228c = [sv28c, sv28c]
const sv2i = zeros(Int32, 2)
const sv2d = zeros(Float64, 2)
const sv62d = [sv2d for i = 1:6]

const MTKT_TIME_METADATA_INIT = MTKt_TimeMetaData(
    convert(Int32, 0),                 # path
    convert(Int32, 0),                 # start_block
    convert(Int32, 0),                 # end_block
    ['\0', '\0', '\0'],                # camera
    zeros(Int32, 181),                 # number_transform
    [sv228c for i = 1:181],            # ref_time
    [sv2i for i = 1:181],              # start_line
    [sv2i for i = 1:181],              # number_line
    [sv62d for i = 1:181],             # coeff_line
    [sv2d for i = 1:181],              # som_ctr_x
    [sv2d for i = 1:181])              # som_ctr_y


# Automatic translation version replacing MTKt_int32 by Int32, MTKt_char8 by UInt8, MTKt_double by Float64,
# and replacing NTuple by Vector and Array (SVector and SArray are not advisable whne 100 or more elements):
# struct MTKt_TimeMetaData
#     path::Int32
#     start_block::Int32
#     end_block::Int32
#     camera::SVector{3, Cchar}
#     number_transform::Vector{Int32}   # (undef, 181)   # SVector{181, Int32}
#     ref_time::Array{UInt8}   # (undef, 181, 2, 28)   # SVector{181, SVector{2, SVector{28, Cchar}}}
#     start_line::Array{Int32}   # (undef, 181, 2)   # SVector{181, SVector{2, Int32}}
#     number_line::Array{Int32}   # (undef, 181, 2)   # SVector{181, SVector{2, Int32}}
#     coeff_line::Array{Float64}   # (undef, 181, 6, 2)   # SVector{181, SVector{6, SVector{2, Float64}}}
#     som_ctr_x::Array{Float64}   # (undef, 181, 2)   # SVector{181, SVector{2, Float64}}
#     som_ctr_y::Array{Float64}   # (undef, 181, 2)   # SVector{181, SVector{2, Float64}}
# end
# CA0 = ['\0', '\0', '\0']
# NT0 = zeros(Int32, 181)
# RT0 = zeros(UInt8, 181, 2, 28)   # Array{Cchar, 3}(undef, 181, 2, 28)
# SL0 = zeros(Int32, 181, 2)
# NL0 = zeros(Int32, 181, 2)
# CL0 = zeros(Float64, 181, 6, 2)
# SX0 = zeros(Float64, 181, 2)
# SY0 = zeros(Float64, 181, 2)
# const MTKT_TIME_METADATA_INIT = MTKt_TimeMetaData(0, 0, 0, CA0, NT0, RT0, SL0, NL0, CL0, SX0, SY0)
#
# revised version:
# struct MTKt_TimeMetaData
#     path::Cint
#     start_block::Cint
#     end_block::Cint
#     camera::Vector{UInt8}(undef, 3)
#     number_transform::Vector{Cint}(undef, NBLOCK + 1)
#     ref_time::Array{Cchar, 3}   # NBLOCK + 1, NGRIDCELL, MTKd_DATETIME_LEN}
#     start_line::Array{Cint, 2}   # NBLOCK + 1, NGRIDCELL}
#     number_line::Array{Cint, 2}   # NBLOCK + 1, NGRIDCELL}
#     coeff_line::Array{Cdouble, 3}   # NBLOCK + 1, 6, NGRIDCELL}
#     som_ctr_x::Array{Cdouble, 2}   # NBLOCK + 1, NGRIDCELL}
#     som_ctr_y::Array{Cdouble, 2}   # NBLOCK + 1, NGRIDCELL}
# end
# const MTKT_TIME_METADATA_INIT = MTKt_TimeMetaData(0, 0, 0, ('\0'), (0), ((('\0'))), ((0)), ((0)), (((0.0))), ((0)), ((0)))  # NT0, RT0, SL0, NL0, CL0, SX0, SY0))
