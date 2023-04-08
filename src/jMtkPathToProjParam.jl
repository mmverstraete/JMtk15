"""
    proj_params = jMtkPathToProjParam(path, resolution)

# Purpose:
Return the projection parameters for the given path and resolution.

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

julia> path = 160
160

julia> resolution = 275
275

julia> proj_params = jMtkPathToProjParam(path, resolution)
JMtk15.MTKt_MisrProjParam(160, 22, -1, 12, [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.1705401692154506e8, 0.0, 0.0, 0.0, 98.88, 0.0, 0.0, 180.0, 0.0, 0.0, 0.0], [7.46075e6, 1.09065e6], [7.60155e6, 527450.0], 180, 512, 2048, Float32[0.0, 64.0, 0.0, 64.0, 0.0, 0.0, 0.0, 64.0, 0.0, 0.0  …  0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0], 275)

julia> proj_params.path
160

julia> proj_params.projcode
22

julia> proj_params.zonecode
-1

julia> proj_params.spherecode
12

julia> proj_params.projparam
15-element SVector{15, Float64} with indices SOneTo(15):
   6.378137e6
  -0.006694348
   0.0
   9.8018013752e7
  -1.1705401692154506e8
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

julia> proj_params.ulc
2-element SVector{2, Float64} with indices SOneTo(2):
 7.46075e6
 1.09065e6

julia> proj_params.lrc
2-element SVector{2, Float64} with indices SOneTo(2):
 7.60155e6
 527450.0

julia> proj_params.nblock
180

julia> proj_params.nline
512

julia> proj_params.nsample
2048

julia> proj_params.reloffset
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

julia> proj_params.resolution
275
```
"""
function jMtkPathToProjParam(path, resolution)
    proj_params = Ref{MTKt_MisrProjParam}(MTKT_MISRPROJPARAM_INIT)
    status = ccall((:MtkPathToProjParam, mtklib),
        Cint,
        (Cint, Cint, Ref{MTKt_MisrProjParam}),
        path, resolution, proj_params)
    if status != 0
        error("jMtkPathToProjParam status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return proj_params[]
end
