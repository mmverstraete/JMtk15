"""
    region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)

# Purpose:
Create a region structure that defines an approximate region of interest
   given a MISR path and block range. This structure is used as input to
   other MTK routines, Mtk_ReadData in particular.

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

julia> start_block = 32
32

julia> end_block = 40
40

julia> region = jMtkSetRegionByPathBlockRange(path, start_block, end_block);

julia> region
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(67.28628518822661, -95.22204196033839)), MTKt_Extent(633462.5, 307862.5))

julia> region.geo
MTKt_GeoCenter(MTKt_GeoCoord(67.28628518822661, -95.22204196033839))

julia> region.geo.ctr
MTKt_GeoCoord(67.28628518822661, -95.22204196033839)

julia> region.geo.ctr.lat
67.28628518822661

julia> region.geo.ctr.lon
-95.22204196033839

julia> region.hextent
MTKt_Extent(633462.5, 307862.5)

julia> region.hextent.xlat
633462.5

julia> region.hextent.ylon
307862.5
```
"""
function jMtkSetRegionByPathBlockRange(path, start_block, end_block)
    region = Ref{MTKt_Region}()
    status = ccall((:MtkSetRegionByPathBlockRange, mtklib),
        Cint,
        (Cint, Cint, Cint, Ref{MTKt_Region}),
        path, start_block, end_block, region)
    if status != 0
        error("jMtkSetRegionByPathBlockRange status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return region[]
end
