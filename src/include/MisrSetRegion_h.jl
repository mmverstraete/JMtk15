"""
    include(JMtk15_src * "include/MisrSetRegion_h.jl")

Partial translation of the symbols defined in the C file "MisrSetRegion.h" of Mtk.

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

julia> include(JMtk15_src * "include/MisrSetRegion_h.jl")
```
"""
# Geographic Center:
struct MTKt_GeoCenter
    ctr::MTKt_GeoCoord
end
export MTKt_GeoCenter

const MTKT_GEOCENTER_INIT = MTKt_GeoCenter(MTKT_GEOCOORD_INIT)

# Geographic extent:
struct MTKt_Extent
    xlat::Cdouble
    ylon::Cdouble
end
export MTKt_Extent

const MTKT_EXTENT_INIT = MTKt_Extent(0.0, 0.0)

# Region of interest:
struct MTKt_Region
    geo::MTKt_GeoCenter
    hextent::MTKt_Extent
end
export MTKt_Region

const MTKT_REGION_INIT = MTKt_Region(MTKT_GEOCENTER_INIT, MTKT_EXTENT_INIT)
