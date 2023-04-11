"""
    path_cnt, path_list = jMtkLatLonToPathList(latitude, longitude)

# Purpose:
Return all paths intersecting a given latitude/longitude pair.

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

julia> latitude = 66.121646
66.121646

julia> longitude = 89.263022
89.263022

julia> path_cnt, path_list = jMtkLatLonToPathList(latitude, longitude);

julia> path_cnt
17

julia> path_list
17-element Vector{Int32}:
   7
   8
   9
  10
  11
  12
  13
  14
 146
 147
 148
 149
 150
 151
 152
 153
 154
```
"""
function jMtkLatLonToPathList(latitude, longitude)
    path_cnt = Ref{Cint}(0)
    path_list = Ref{Ptr{Cint}}()
    status = ccall((:MtkLatLonToPathList, mtklib),
        Cint,
        (Cdouble, Cdouble, Ref{Cint}, Ref{Ptr{Cint}}),
        latitude, longitude, path_cnt, path_list)
    if status != 0
        error("MTK error $status: ", jMtkErrorMessage(status))
    end
    julia_path_list = [unsafe_load(path_list[], i) for i in 1:path_cnt[]]
    Libc.free(path_list[])
    return path_cnt[], julia_path_list
end
