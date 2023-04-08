"""
    radians = jMtkDdToRad(decdeg)

# Purpose:
Convert decimal degrees to radians.

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

julia> decdeg = 65.55
65.55

julia> radians = jMtkDdToRad(decdeg)
1.144063324682283
````
"""
function jMtkDdToRad(decdeg)
    radians = Ref{Float64}(0.0)
    status = ccall((:MtkDdToRad, mtklib),
        Cint,
        (Cdouble, Ref{Cdouble}),
        decdeg, radians)
    if status != 0
        error("jMtkDdToRad status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return radians[]
end
