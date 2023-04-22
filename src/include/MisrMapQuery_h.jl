"""
    include(JMtk15_src * "include/MisrMapQuery_h.jl")

Partial translation of the symbols defined in the C file "MisrMapQuery.h" of Mtk.

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

julia> include(JMtk15_src * "include/MisrMapQuery_h.jl")
```
"""
# Geographic coordinates:
struct MTKt_GeoCoord
    lat::Cdouble
    lon::Cdouble
end
export MTKt_GeoCoord

const MTKT_GEOCOORD_INIT = MTKt_GeoCoord(0.0, 0.0)
export MTKT_GEOCOORD_INIT

# Space Oblique Mercator (SOM) coordinates:
struct MTKt_SomCoord
    x::Cdouble
    y::Cdouble
end
export MTKt_SomCoord

const MTKT_SOMCOORD_INIT = MTKt_SomCoord(0.0, 0.0)
export MTKT_SOMCOORD_INIT

# Geographic region:
struct MTKt_GeoRegion
    ulc::MTKt_GeoCoord
    urc::MTKt_GeoCoord
    ctr::MTKt_GeoCoord
    lrc::MTKt_GeoCoord
    llc::MTKt_GeoCoord
end
export MTKt_GeoRegion

const MTKT_GEOREGION_INIT = MTKt_GeoRegion(MTKT_GEOCOORD_INIT, MTKT_GEOCOORD_INIT,
    MTKT_GEOCOORD_INIT, MTKT_GEOCOORD_INIT, MTKT_GEOCOORD_INIT)

# Space Oblique Mercator (SOM) region:
struct MTKt_SomRegion
    path::Cint
    ulc::MTKt_SomCoord
    ctr::MTKt_SomCoord
    lrc::MTKt_SomCoord
end
export MTKt_SomRegion

const MTKT_SOMREGION_INIT = MTKt_SomRegion(0, MTKT_SOMCOORD_INIT,
    MTKT_SOMCOORD_INIT, MTKT_SOMCOORD_INIT)
export MTKT_SOMREGION_INIT

# Map information:
struct MTKt_MapInfo
    path::Cint
    start_block::Cint
    end_block::Cint
    resolution::Cint
    resfactor::Cint
    nline::Cint
    nsample::Cint
    pixelcenter::MTKt_boolean
    som::MTKt_SomRegion
    geo::MTKt_GeoRegion
    pp::MTKt_MisrProjParam
end
export MTKt_MapInfo

const MTKT_MAPINFO_INIT = MTKt_MapInfo(0, 0, 0, 0, 0, 0, 0, MTK_TRUE,
    MTKT_SOMREGION_INIT, MTKT_GEOREGION_INIT, MTKT_MISRPROJPARAM_INIT)
export MTKT_MAPINFO_INIT

# Origin code:
@enum MTKt_OriginCode::UInt32 begin
    MTKe_ORIGIN_UL = 0
    MTKe_ORIGIN_UR = 1
    MTKe_ORIGIN_LL = 2
    MTKe_ORIGIN_LR = 3
end
export MTKt_OriginCode

# Pixel registration code:
@enum MTKt_PixRegCode::UInt32 begin
    MTKe_PIX_REG_CENTER = 0
    MTKe_PIX_REG_CORNER = 1
end
export MTKt_PixRegCode

# Generic map information
struct MTKt_GenericMapInfo
    min_x::Cdouble
    min_y::Cdouble
    max_x::Cdouble
    max_y::Cdouble
    size_line::Cint
    size_sample::Cint
    resolution_x::Cdouble
    resolution_y::Cdouble
    tline::SVector{4, Cdouble}
    tsample::SVector{4, Cdouble}
    origin_code::MTKt_OriginCode
    pix_reg_code::MTKt_PixRegCode
end
export MTKt_GenericMapInfo

const MTKT_GENERICMAPINFO_INIT = MTKt_GenericMapInfo(0.0, 0.0, 0.0, 0.0,
    0, 0, 0.0, 0.0,
    [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 0.0],
    MTKe_ORIGIN_UL, MTKe_PIX_REG_CENTER)
export MTKT_GENERICMAPINFO_INIT

# GCTP projection information:
struct MTKt_GCTPProjInfo
    proj_code::Cint
    sphere_code::Cint
    zone_code::Cint
    proj_param::SVector{15, Cdouble}
end
export MTKt_GCTPProjInfo

const MTKT_GCTPPROJINFO_INIT = MTKt_GCTPProjInfo(0, 0, 0,
    [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0])
export MTKT_GCTPPROJINFO_INIT
