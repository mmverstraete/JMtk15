"""
    decdeg = jMtkRadToDd(radians)

# Purpose:
Convert radians to decimal degrees.

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

julia> radians = 1.1440634
1.1440634

julia> decdeg = jMtkRadToDd(radians)
65.55000431538731
"""
function jMtkRadToDd(radians)
    decdeg = Ref{Float64}(0.0)
    status = ccall((:MtkRadToDd, mtklib),
        Cint,
        (Cdouble, Ptr{Cdouble}),
        radians, decdeg)
    if status != 0
        error("jMtkRadToDd status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return decdeg[]
end
