"""
    decdeg = jMtkDmsToDd(packed_dms)

# Purpose:
Convert packed degrees/minutes/seconds to decimal degrees.

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

julia> packed_dms = 65033000.010
6.503300001e7

julia> decdeg = jMtkDmsToDd(packed_dms)
65.5500027777772
```
"""
function jMtkDmsToDd(packed_dms)
    decdeg = Ref{Float64}(0.0)
    status = ccall((:MtkDmsToDd, mtklib),
        Cint,
        (Cdouble, Ptr{Cdouble}),
        packed_dms, decdeg)
    if status != 0
        error("jMtkDmsToDd status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return decdeg[]
end
