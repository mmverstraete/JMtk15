"""
    block, line, sample = jMtkLatLonToBls(path, resolution, latitude, longitude)

# Purpose:
Convert from decimal latitude and longitude to block, line, and sample for a given
    MISR path and resolution.

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

julia> resolution = 1100
1100

julia> latitude = 57.1
57.1

julia> longitude = 65.7
65.7

julia> block, line, sample = jMtkLatLonToBls(path, resolution, latitude, longitude)
(45, 19.521484f0, 207.88611f0)
``` 
"""
function jMtkLatLonToBls(path, resolution, latitude, longitude)
    block = Ref{Int32}(0)
    line = Ref{Float32}(0.0)
    sample = Ref{Float32}(0.0)
    status = ccall((:MtkLatLonToBls, mtklib),
        Cint,
        (Cint, Cint, Cdouble, Cdouble, Ref{Cint}, Ref{Cfloat}, Ref{Cfloat}),
        path, resolution, latitude, longitude, block, line, sample)
    if status != 0
        error("jMtkLatLonToBls status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return block[], line[], sample[]
end
