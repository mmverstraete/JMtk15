"""
    region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)

# Purpose:
Create a region structure that defines an approximate region of interest
    given a center latitude/longitude coordinate and a latitudinal/longitudinal
    full extent in specified units of degrees, meters, kilometers, or pixels.
    This structure is used as input to other MTK routines, Mtk_ReadData in particular.

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

julia> center_lat = 66.0
66.0

julia> center_lon = -89.0
-89.0

julia> lat_extent = 111000.0
111000.0

julia> lon_extent = 111000.0
111000.0

julia> extent_units = "meters"
"meters"

julia> region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units);

julia> region
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(55500.0, 55500.0))

julia> region.geo
MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0))

julia> region.geo.ctr
MTKt_GeoCoord(66.0, -89.0)

julia> region.geo.ctr.lat
66.0

julia> region.geo.ctr.lon
-89.0

julia> region.hextent
MTKt_Extent(55500.0, 55500.0)

julia> region.hextent.xlat
55500.0

julia> region.hextent.ylon
55500.0
```
"""
function jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)
    region = Ref{MTKt_Region}()
    status = ccall((:MtkSetRegionByLatLonExtent, mtklib),
        Cint,
        (Cdouble, Cdouble, Cdouble, Cdouble, Cstring, Ref{MTKt_Region}),
        center_lat, center_lon, lat_extent, lon_extent, extent_units, region)
    if status != 0
        error("jMtkSetRegionByLatLonExtent status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return region[]
end
