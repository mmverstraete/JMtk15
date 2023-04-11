"""
    start_time, end_time = jMtkOrbitToTimeRange(orbit)

# Purpose:
Return the start time and end time for a given orbit, expressed in the form yyyy-mm-ddThh:mm:ssZ.

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

julia> orbit = 32467
32467

julia> start_time, end_time = jMtkOrbitToTimeRange(orbit)
("2006-01-24T19:56:53Z", "2006-01-24T21:35:46Z")
```
"""
function jMtkOrbitToTimeRange(orbit)
    ui8z = convert(Cuchar, 0)
    st_chars = Vector{Cuchar}(undef, MTKd_DATETIME_LEN)
    st_chars = [ui8z for i = 1:MTKd_DATETIME_LEN]
    en_chars = Vector{Cuchar}(undef, MTKd_DATETIME_LEN)
    en_chars = [ui8z for i = 1:MTKd_DATETIME_LEN]
    status = ccall((:MtkOrbitToTimeRange, mtklib),
        Cint,
        (Cint, Ptr{Cuchar}, Ptr{Cuchar}),
        orbit, st_chars, en_chars)
    if status != 0
        error("jMtkOrbitToTimeRange status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    start_time = String(st_chars)
    start_time = rstrip(start_time, '\0')
    end_time = String(en_chars)
    end_time = rstrip(end_time, '\0')
    return start_time, end_time
end
