"""
    datetime = jMtkJulianToDateTime(juldate)

# Purpose:
Convert a Julian date into date and time (in ISO 8601 format).

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

julia> juldate = 2.4523965833333335e6
2.4523965833333335e6

julia> datetime = jMtkJulianToDateTime(juldate)
"2002-05-02T02:00:00Z"
```
"""
function jMtkJulianToDateTime(juldate)
    dt_chars = [convert(Cuchar, 0) for i = 1:MTKd_DATETIME_LEN]
    status = ccall((:MtkJulianToDateTime, mtklib),
	    Cint,
	    (Cdouble, Ptr{Cuchar}),
	    juldate, dt_chars)
    if status != 0
        error("jMtkJulianToDateTime status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    datetime = String(dt_chars)
    datetime = rstrip(datetime, '\0')
        
    return datetime
end
