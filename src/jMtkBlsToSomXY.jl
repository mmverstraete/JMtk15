"""
    somx, somy = jMtkBlsToSomXY(path, resolution, block, line, sample)

# Purpose:
Convert from block, line, and sample to Space Oblique Mercator (SOM) X and Y 
   coordinates for a given MISR path and resolution.

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

julia> block = 69
69

julia> line = 100.2
100.2

julia> sample = 89.9
89.9

julia> somx, somy = jMtkBlsToSomXY(path, resolution, block, line, sample)
(1.7145919996643066e7, 222089.9932861328)
```
"""
function jMtkBlsToSomXY(path, resolution, block, line, sample)
    somx = Ref{Float64}(0.0)
    somy = Ref{Float64}(0.0)
    status = ccall((:MtkBlsToSomXY, mtklib),
        Cint,
        (Cint, Cint, Cint, Cfloat, Cfloat, Ref{Cdouble}, Ref{Cdouble}),
        path, resolution, block, line, sample, somx, somy)
    if status != 0
        error("jMtkBlsToSomXY status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return somx[], somy[]
end
