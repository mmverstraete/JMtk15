"""
    mapinfo = jMtkSnapToGrid(path, resolution, region)

# Purpose:
Snap a region of interest to a MISR grid given a path, resolution and a region
   structure. It is not typically called directly, instead it is used by
   Mtk_ReadData and Mtk_ReadRaw to adjust the region defined by the SetRegion
   routines to the grid of the MISR product file to read.
   The Mtk_ReadData and Mtk_ReadRaw routines always return data on a MISR grid
   approximated by the region, no spatial interpolation is performed (only block
   assembly). This routines does the snap from region to grid. It may be useful
   to perform region to map to coordinate computations without actually reading data.

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

julia> resolution = 275
275

julia> center_lat = 66.0
66.0

julia> center_lon = -89.0
-89.0

julia> lat_extent = 1.5
1.5

julia> lon_extent = 1.0
1.0

julia> extent_units = "degrees"
"degrees"

julia> region = jMtkSetRegionByLatLonExtent(center_lat, center_lon, lat_extent, lon_extent, extent_units)
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(83349.62708333334, 55566.41805555556))

julia> mapinfo = jMtkSnapToGrid(path, resolution, region)
MTKt_MapInfo(37, 36, 37, 275, 1, 704, 512, JMtk15.MTK_TRUE, MTKt_SomRegion(37, MTKt_SomCoord(1.23888875e7, 1.0555875e6), MTKt_SomCoord(1.248555e7, 1.12585e6), MTKt_SomCoord(1.25822125e7, 1.1961125e6)), MTKt_GeoRegion(MTKt_GeoCoord(67.03179518448705, -89.53826724255391), MTKt_GeoCoord(66.46099499099165, -86.6996155055143), MTKt_GeoCoord(65.97799363748135, -89.06552066214442), MTKt_GeoCoord(64.92346880942577, -88.62870412735786), MTKt_GeoCoord(65.45901952920984, -91.34071802836039)), MTKt_MisrProjParam(37, 22, -1, 12, [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, 7.20080175848927e7, 0.0, 0.0, 0.0, 98.88, 0.0, 0.0, 180.0, 0.0, 0.0, 0.0], [7.46075e6, 1.09065e6], [7.60155e6, 527450.0], 180, 512, 2048, Float32[0.0, 64.0, 0.0, 64.0, 0.0, 0.0, 0.0, 64.0, 0.0, 0.0  …  0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0], 275))

julia> mapinfo.path
37

julia> mapinfo.start_block
36

julia> mapinfo.end_block
37

julia> mapinfo.resolution
275

julia> mapinfo.resfactor
1

julia> mapinfo.nline
704

julia> mapinfo.nsample
512

julia> mapinfo.pixelcenter
MTK_TRUE::MTKt_boolean = 0x00000001

julia> mapinfo.som
MTKt_SomRegion(37, MTKt_SomCoord(1.23888875e7, 1.0555875e6), MTKt_SomCoord(1.248555e7, 1.12585e6), MTKt_SomCoord(1.25822125e7, 1.1961125e6))

julia> mapinfo.som.path
37

julia> mapinfo.som.ulc
MTKt_SomCoord(1.23888875e7, 1.0555875e6)

julia> mapinfo.som.ulc.x
1.23888875e7

julia> mapinfo.som.ulc.y
1.0555875e6

julia> mapinfo.som.ctr
MTKt_SomCoord(1.248555e7, 1.12585e6)

julia> mapinfo.som.ctr.x
1.248555e7

julia> mapinfo.som.ctr.y
1.12585e6

julia> mapinfo.som.lrc
MTKt_SomCoord(1.25822125e7, 1.1961125e6)

julia> mapinfo.som.lrc.x
1.25822125e7

julia> mapinfo.som.lrc.y
1.1961125e6

julia> mapinfo.geo
MTKt_GeoRegion(MTKt_GeoCoord(67.03179518448705, -89.53826724255391), MTKt_GeoCoord(66.46099499099165, -86.6996155055143), MTKt_GeoCoord(65.97799363748135, -89.06552066214442), MTKt_GeoCoord(64.92346880942577, -88.62870412735786), MTKt_GeoCoord(65.45901952920984, -91.34071802836039))

julia> mapinfo.geo.ulc
MTKt_GeoCoord(67.03179518448705, -89.53826724255391)

julia> mapinfo.geo.ulc.lat
67.03179518448705

julia> mapinfo.geo.ulc.lon
-89.53826724255391

julia> mapinfo.geo.urc
MTKt_GeoCoord(66.46099499099165, -86.6996155055143)

julia> mapinfo.geo.urc.lat
66.46099499099165

julia> mapinfo.geo.urc.lon
-86.6996155055143

julia> mapinfo.geo.ctr
MTKt_GeoCoord(65.97799363748135, -89.06552066214442)

julia> mapinfo.geo.ctr.lat
65.97799363748135

julia> mapinfo.geo.ctr.lon
-89.06552066214442

julia> mapinfo.geo.lrc
MTKt_GeoCoord(64.92346880942577, -88.62870412735786)

julia> mapinfo.geo.lrc.lat
64.92346880942577

julia> mapinfo.geo.lrc.lon
-88.62870412735786

julia> mapinfo.geo.llc
MTKt_GeoCoord(65.45901952920984, -91.34071802836039)

julia> mapinfo.geo.llc.lat
65.45901952920984

julia> mapinfo.geo.llc.lon
-91.34071802836039

julia> mapinfo.pp
MTKt_MisrProjParam(37, 22, -1, 12, [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, 7.20080175848927e7, 0.0, 0.0, 0.0, 98.88, 0.0, 0.0, 180.0, 0.0, 0.0, 0.0], [7.46075e6, 1.09065e6], [7.60155e6, 527450.0], 180, 512, 2048, Float32[0.0, 64.0, 0.0, 64.0, 0.0, 0.0, 0.0, 64.0, 0.0, 0.0  …  0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0], 275)

julia> mapinfo.pp.path
37

julia> mapinfo.pp.projcode
22

julia> mapinfo.pp.zonecode
-1

julia> mapinfo.pp.spherecode
12

julia> mapinfo.pp.projparam
15-element SVector{15, Float64} with indices SOneTo(15):
   6.378137e6
  -0.006694348
   0.0
   9.8018013752e7
   7.20080175848927e7
   0.0
   0.0
   0.0
  98.88
   0.0
   0.0
 180.0
   0.0
   0.0
   0.0

julia> mapinfo.pp.ulc
2-element SVector{2, Float64} with indices SOneTo(2):
 7.46075e6
 1.09065e6

julia> mapinfo.pp.lrc
2-element SVector{2, Float64} with indices SOneTo(2):
 7.60155e6
 527450.0

julia> mapinfo.pp.nblock
180

julia> mapinfo.pp.nline
512

julia> mapinfo.pp.nsample
2048

julia> mapinfo.pp.nsample
2048

julia> 

julia> mapinfo.pp.reloffset
179-element SVector{179, Float32} with indices SOneTo(179):
  0.0
 64.0
  0.0
 64.0
  0.0
  0.0
  0.0
 64.0
  0.0
  0.0
  ⋮
  0.0
 64.0
  0.0
  0.0
 64.0
  0.0
  0.0
 64.0
  0.0

julia> mapinfo.pp.resolution
275
```
"""
function jMtkSnapToGrid(path, resolution, region)
    mapinfo = Ref{MTKt_MapInfo}()
    status = ccall((:MtkSnapToGrid, mtklib),
        Cint,
        (Cint, Cint, MTKt_Region, Ref{MTKt_MapInfo}),
        path, resolution, region, mapinfo)
    if status != 0
        error("jMtkSnapToGrid status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return mapinfo[]
end
