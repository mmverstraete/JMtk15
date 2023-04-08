"""
    block, line, sample = jMtkSomXYToBls(path, resolution, somx, somy)

# Purpose:
Convert from Space Oblique Mercator (SOM) X and Y coordinates to block, line, and
   sample for a given MISR path and resolution.

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

julia> path = 230
230

julia> resolution = 1100
1100

julia> somx = 17145920.0
1.714592e7

julia> somy = 222090.0
222090.0

julia> block, line, sample = jMtkSomXYToBls(path, resolution, somx, somy)
(69, 100.200195f0, 89.899994f0)
```
"""
function jMtkSomXYToBls(path, resolution, somx, somy)
    block = Ref{Int32}(0)
    line = Ref{Float32}(0.0)
    sample = Ref{Float32}(0.0)
    status = ccall((:MtkSomXYToBls, mtklib),
        Cint,
        (Cint, Cint, Cdouble, Cdouble, Ref{Cint}, Ref{Cfloat}, Ref{Cfloat}),
        path, resolution, somx, somy, block, line, sample)
    if status != 0
        error("jMtkSomXYToBls status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return block[], line[], sample[]
end
