"""
    orbit_cnt, orbit_list = jMtkPathTimeRangeToOrbitList(path, start_time, end_time)

# Purpose:
Return the list of all orbits corresponding to a given path and period of time.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-02).

# Example:
```julia
julia> using JMtk15

julia> path = 37
37

julia> start_time = "2002-02-02T02:00:00Z"
"2002-02-02T02:00:00Z"

julia> end_time = "2002-05-02T02:00:00Z"
"2002-05-02T02:00:00Z"

julia> orbit_cnt, orbit_list = jMtkPathTimeRangeToOrbitList(path, start_time, end_time)
(6, Int32[11350, 11583, 11816, 12049, 12282, 12515])
```
"""
function jMtkPathTimeRangeToOrbitList(path, start_time, end_time)
    orbit_cnt = Ref{Cint}(0)
    orbit_list = Ref{Ptr{Cint}}(0)
    status = ccall((:MtkPathTimeRangeToOrbitList, mtklib),
        Cint,
        (Cint, Cstring, Cstring, Ptr{Cint}, Ptr{Ptr{Cint}}),
        path, start_time, end_time, orbit_cnt, orbit_list)
    if status != 0
        error("jMtkPathTimeRangeToOrbitList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_orblist = [unsafe_load(orbit_list[], i) for i in 1:orbit_cnt[]]
    return orbit_cnt[], julia_orblist
end
