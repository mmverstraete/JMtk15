"""
    juldate = jMtkDateTimeToJulian(datetime)

# Purpose:
Convert a date and time (in ISO 8601 format) into a Julian date.

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

julia> datetime = "2002-05-02T02:00:00Z"
"2002-05-02T02:00:00Z"

julia> juldate = jMtkDateTimeToJulian(datetime)
2.4523965833333335e6
```
"""
function jMtkDateTimeToJulian(datetime)
    juldate = Ref{Float64}(0.0)
    status = ccall((:MtkDateTimeToJulian, mtklib),
        Cint,
        (Cstring, Ptr{Cdouble}),
        datetime, juldate)
    if status != 0
        error("jMtkDateTimeToJulian status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return juldate[]
end
