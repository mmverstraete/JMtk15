"""
    path_cnt, path_list = jMtkRegionToPathList(region)

# Purpose:
Return a list of paths intersecting a given region.

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

julia> center_lat = 40.0
40.0

julia> center_lon = -120.0
-120.0

julia> lat_extent = 0.1
0.1

julia> lon_extent = 0.1
0.1

julia> extent_units = "degrees"
"degrees"

julia> region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(40.0, -120.0)), MTKt_Extent(5556.641805555556, 5556.641805555556))

julia> path_cnt, path_list = jMtkRegionToPathList(region);

julia> path_cnt
5

julia> path_list
5-element Vector{Int32}:
 41
 42
 43
 44
 45
```
"""
function jMtkRegionToPathList(region)
    path_cnt = Ref{Cint}(0)
    path_list = Ref{Ptr{Cint}}()
    status = ccall((:MtkRegionToPathList, mtklib),
        Cint,
        (MTKt_Region, Ref{Cint}, Ref{Ptr{Cint}}),
        region, path_cnt, path_list)
    if status != 0
        error("MTK error $status: ", jMtkErrorMessage(status))
    end
    julia_path_list = [unsafe_load(path_list[], i) for i in 1:path_cnt[]]
    Libc.free(path_list[])
    return path_cnt[], julia_path_list
end
