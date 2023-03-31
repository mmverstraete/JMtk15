"""
    version = jMtkVersion()

# Purpose:
Report the version identifier of the MISR Toolkit (Mtk) library currently in use.

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

julia> version = jMtkVersion()
"1.5.0"
```
"""
function jMtkVersion()
    version = ccall((:MtkVersion, mtklib),
        Cstring,
        ()
        )
    return unsafe_string(version)
end
