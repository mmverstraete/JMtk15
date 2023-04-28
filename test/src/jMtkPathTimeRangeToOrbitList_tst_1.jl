"""
    orbit_cnt, orbit_list = jMtkPathTimeRangeToOrbitList_tst_1()

# Purpose:
Generate the output of `jMtkPathTimeRangeToOrbitList` for testing purposes.

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
IDL> path = 37
IDL> start_time = '2002-02-02T02:00:00Z'
IDL> end_time = '2002-05-02T02:00:00Z'
IDL> status = MTK_PATH_TIMERANGE_TO_ORBITLIST(path, start_time, end_time, orbit_cnt, orbit_list)
IDL> PRINT, orbit_cnt
           6
IDL> PRINT, orbit_list
       11350       11583       11816       12049       12282       12515
```

# Example:
```julia
julia> using JMtk15

julia> include(JMtk15_test * "src/jMtkPathTimeRangeToOrbitList_tst_1.jl")
jMtkPathTimeRangeToOrbitList_tst_1

julia> orbit_cnt, orbit_list = jMtkPathTimeRangeToOrbitList_tst_1();

julia> @test orbit_cnt == 6
Test Passed

julia> @test orbit_list == [11350, 11583, 11816, 12049, 12282, 12515]
Test Passed
```
"""
function jMtkPathTimeRangeToOrbitList_tst_1()
    path = 37
    start_time = "2002-02-02T02:00:00Z"
    end_time = "2002-05-02T02:00:00Z"
    orbit_cnt, orbit_list = jMtkPathTimeRangeToOrbitList(path, start_time, end_time)
    return orbit_cnt, orbit_list
end
