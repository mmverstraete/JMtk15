"""
    somx, somy = jMtkLSToSomXY(mapinfo, line, sample)

# Purpose:
Return the Space Oblique Mercator (SOM) X and Y given a line and sample.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
"/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"

julia> path = jMtkFileToPath(filename)
168

julia> start_block = 110
110

julia> end_block = 110
110

julia> region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(-24.479478582488763, 32.028724322255464)), MTKt_Extent(70262.5, 281462.5))

julia> gridname = "GreenBand"
"GreenBand"

julia> fieldname = "Green Radiance/RDQI"
"Green Radiance/RDQI"

julia> databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
(UInt16[0xe000 0xe000 … 0xe000 0xe000; 0xffff 0xffff … 0xffff 0xffff; … ; 0x7fee 0x7fee … 0x7fee 0x7fee; 0x0000 0x0000 … 0x0000 0x0000], MTKt_MapInfo(168, 110, 110, 1100, 4, 128, 512, JMtk15.MTK_TRUE, MTKt_SomRegion(168, MTKt_SomCoord(2.28085e7, -633600.0), MTKt_SomCoord(2.287835e7, -352550.0), MTKt_SomCoord(2.29482e7, -71500.0)), MTKt_GeoRegion(MTKt_GeoCoord(-23.58709279748763, 29.353665543180618), MTKt_GeoCoord(-24.0676258508188, 34.84437551586123), MTKt_GeoCoord(-24.479478582488763, 32.028724322255464), MTKt_GeoCoord(-25.323930208545036, 34.740509109113106), MTKt_GeoCoord(-24.838877358123973, 29.195643744542547)), MTKt_MisrProjParam(168, 22, -1, 12, [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8, 0.0, 0.0, 0.0, 98.88, 0.0, 0.0, 180.0, 0.0, 0.0, 0.0], [7.46075e6, 1.09065e6], [7.60155e6, 527450.0], 180, 128, 512, Float32[0.0, 16.0, 0.0, 16.0, 0.0, 0.0, 0.0, 16.0, 0.0, 0.0  …  0.0, 0.0, 16.0, 0.0, 0.0, 16.0, 0.0, 0.0, 16.0, 0.0], 1100)))

julia> line = 50.0
50.0

julia> sample = 125.0
125.0

julia> somx, somy = jMtkLSToSomXY(mapinfo, line, sample)
(2.28635e7, -496100.0)
```
"""
function jMtkLSToSomXY(mapinfo, line, sample)
    somx = Ref{Float64}(0.0)
    somy = Ref{Float64}(0.0)
    status = ccall((:MtkLSToSomXY, mtklib),
        Cint,
        (MTKt_MapInfo, Cfloat, Cfloat, Ptr{Cdouble}, Ptr{Cdouble}),
        mapinfo, line, sample, somx, somy)
    if status != 0
        error("jMtkLSToSomXY status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return somx[], somy[]
end
