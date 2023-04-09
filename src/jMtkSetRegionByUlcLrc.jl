"""
    region = jMtkSetRegionByUlcLrc(ul_lat, ul_lon, lr_lat, lr_lon)

# Purpose:
Create a region structure that defines an approximate region of interest given
   upper left corner and lower right corner latitude/longitude coordinates. This
   structure is used as input to other MTK routines, Mtk_ReadData in particular. 

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Example:
```julia
julia> using JMtk15

julia> ul_lat = 67.0
67.0

julia> ul_lon = -90.0
-90.0

julia> lr_lat = 65.0
65.0

julia> lr_lon = -88.0
-88.0

julia> region = jMtkSetRegionByUlcLrc(ul_lat, ul_lon, lr_lat, lr_lon);

julia> region
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(111319.54315, 111319.54315))

julia> region.geo
MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0))

julia> region.geo.ctr
MTKt_GeoCoord(66.0, -89.0)

julia> region.geo.ctr.lat
66.0

julia> region.geo.ctr.lon
-89.0

julia> region.hextent
MTKt_Extent(111319.54315, 111319.54315)

julia> region.hextent.xlat
111319.54315

julia> region.hextent.ylon
111319.54315
```
"""
function jMtkSetRegionByUlcLrc(ul_lat, ul_lon, lr_lat, lr_lon)
    region = Ref{MTKt_Region}()
    status = ccall((:MtkSetRegionByUlcLrc, mtklib),
        Cint,
        (Cdouble, Cdouble, Cdouble, Cdouble, Ref{MTKt_Region}),
        ul_lat, ul_lon, lr_lat, lr_lon, region)
    if status != 0
        error("jMtkSetRegionByUlcLrc status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return region[]
end
