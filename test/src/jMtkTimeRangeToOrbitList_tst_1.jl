"""
    orbit_cnt, orbit_list = jMtkTimeRangeToOrbitList_tst_1()

# Purpose:
Generate the output of `jMtkTimeRangeToOrbitList` for testing purposes.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
```idl
IDL> start_time = '2005-02-02T02:00:00Z'
IDL> end_time = '2005-02-02T03:00:00Z'
IDL> status = MTK_TIMERANGE_TO_ORBITLIST(start_time, end_time, orbit_cnt, orbit_list)
IDL> PRINT, orbit_cnt
           2
IDL> PRINT, orbit_list
       27271       27272
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkTimeRangeToOrbitList_tst_1.jl")
jMtkTimeRangeToOrbitList_tst_1

julia> orbit_cnt, orbit_list = jMtkTimeRangeToOrbitList_tst_1();

julia> @test orbit_cnt == 2
Test Passed

julia> @test orbit_list == [27271, 27272]
Test Passed
```
"""
function jMtkTimeRangeToOrbitList_tst_1()
    start_time = "2005-02-02T02:00:00Z"
    end_time = "2005-02-02T03:00:00Z"
    orbit_cnt, orbit_list = jMtkTimeRangeToOrbitList(start_time, end_time)
    return orbit_cnt, orbit_list
end
