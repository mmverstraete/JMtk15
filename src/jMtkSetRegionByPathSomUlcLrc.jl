"""
    region = jMtkSetRegionByPathSomUlcLrc(path, ulc_som_x, ulc_som_y, lrc_som_x, lrc_som_y)

# Purpose:
Set a region by path and upper left and lower right SOM X/Y.

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

julia> path = 27
27

julia> ulc_som_x = 15600000.0
1.56e7

julia> ulc_som_y = -300.0
-300.0

julia> lrc_som_x = 16800000.0
1.68e7

julia> lrc_som_y = 2000.0
2000.0

julia> region = jMtkSetRegionByPathSomUlcLrc(path, ulc_som_x, ulc_som_y, lrc_som_x, lrc_som_y)
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(35.38461751504492, -102.05138161671469)), MTKt_Extent(600137.5, 1287.5))

julia> region.geo
MTKt_GeoCenter(MTKt_GeoCoord(35.38461751504492, -102.05138161671469))

julia> region.geo.ctr
MTKt_GeoCoord(35.38461751504492, -102.05138161671469)

julia> region.geo.ctr.lat
35.38461751504492

julia> region.geo.ctr.lon
-102.05138161671469

julia> region.hextent
MTKt_Extent(600137.5, 1287.5)

julia> region.hextent.xlat
600137.5

julia> region.hextent.ylon
1287.5
```
"""
function jMtkSetRegionByPathSomUlcLrc(path, ulc_som_x, ulc_som_y, lrc_som_x, lrc_som_y)
    region = Ref{MTKt_Region}()
    status = ccall((:MtkSetRegionByPathSomUlcLrc, mtklib),
        Cint,
        (Cint, Cdouble, Cdouble, Cdouble, Cdouble, Ref{MTKt_Region}),
        path, ulc_som_x, ulc_som_y, lrc_som_x, lrc_som_y, region)
    if status != 0
        error("jMtkSetRegionByPathSomUlcLrc status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return region[]
end
