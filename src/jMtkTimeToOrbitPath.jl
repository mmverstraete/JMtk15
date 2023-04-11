"""
    orbit, path = jMtkTimeToOrbitPath(datetime)

# Purpose:
Return an orbit and corresponding path given a time.

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

julia> datetime = "2005-02-02T02:00:00Z"
"2005-02-02T02:00:00Z"

julia> orbit, path = jMtkTimeToOrbitPath(datetime)
(27271, 104)
```
"""
function jMtkTimeToOrbitPath(datetime)
    orbit = Ref{Cint}(0)
    path = Ref{Cint}(0)
    status = ccall((:MtkTimeToOrbitPath, mtklib),
        Cint,
        (Cstring, Ref{Cint}, Ref{Cint}),
        datetime, orbit, path)
    if status != 0
        error("jMtkTimeToOrbitPath status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return orbit[], path[]
end
