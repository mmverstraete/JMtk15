"""
    path = jMtkOrbitToPath(orbit)

# Purpose:
Return the path corresponding to the given orbit.

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

julia> orbit = 29058
29058

julia> path = jMtkOrbitToPath(orbit)
37
```
"""
function jMtkOrbitToPath(orbit)
    path = Ref{Cint}(0)
    status = ccall((:MtkOrbitToPath, mtklib),
        Cint,
        (Cint, Ref{Cint}),
        orbit, path)
    if status != 0
        error("jMtkOrbitToPath status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return path[]
end
