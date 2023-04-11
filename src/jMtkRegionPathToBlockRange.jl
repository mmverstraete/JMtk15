"""
    start_block, end_block = jMtkRegionPathToBlockRange(region, path)

# Purpose:
Return a starting and ending block for a given path and region.

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

julia> path = 37
37

julia> center_lat = 66.0
66.0

julia> center_lon = -89.0
-89.0

julia> lat_extent = 10.0
10.0

julia> lon_extent = 10.0
10.0

julia> extent_units = "degrees"
"degrees"

julia> region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(555664.1805555556, 555664.1805555556))

julia> start_block, end_block = jMtkRegionPathToBlockRange(region, path);

julia> start_block
32

julia> end_block
40
```
"""
function jMtkRegionPathToBlockRange(region, path)
    start_block = Ref{Cint}(0)
    end_block = Ref{Cint}(0)
    status = ccall((:MtkRegionPathToBlockRange, mtklib),
        Cint,
        (MTKt_Region, Cint, Ref{Cint}, Ref{Cint}),
        region, path, start_block, end_block)
    if status != 0
        error("jMtkRegionPathToBlockRange status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return start_block[], end_block[]
end
