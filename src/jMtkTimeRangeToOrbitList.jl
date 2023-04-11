"""
    orbit_cnt, orbit_list = jMtkTimeRangeToOrbitList(start_time, end_time)

# Purpose:
Return a list of orbits given a period of time.

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

julia> start_time = "2005-02-02T02:00:00Z"
"2005-02-02T02:00:00Z"

julia> end_time = "2005-02-02T03:00:00Z"
"2005-02-02T03:00:00Z"

julia> orbit_cnt, orbit_list = jMtkTimeRangeToOrbitList(start_time, end_time);

julia> orbit_cnt
2

julia> orbit_list
2-element Vector{Int32}:
 27271
 27272
```
"""
function jMtkTimeRangeToOrbitList(start_time, end_time)
    orbit_cnt = Ref{Cint}(0)
    orbit_list = Ref{Ptr{Cint}}()
    status = ccall((:MtkTimeRangeToOrbitList, mtklib),
        Cint,
        (Cstring, Cstring, Ref{Cint}, Ref{Ptr{Cint}}),
        start_time, end_time, orbit_cnt, orbit_list)
    if status != 0
        error("jMtkTimeRangeToOrbitList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_orbit_list = [unsafe_load(orbit_list[], i) for i in 1:orbit_cnt[]]
    Libc.free(orbit_list[])
    return orbit_cnt[], julia_orbit_list
end
