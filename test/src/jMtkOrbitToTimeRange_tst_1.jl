"""
    start_time, end_time = jMtkOrbitToTimeRange_tst_1()

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
IDL> orbit = 32467
IDL> status = MTK_ORBIT_TO_TIMERANGE(orbit, start_time, end_time)
IDL> PRINT, start_time, '   ', end_time
2006-01-24T19:56:53Z   2006-01-24T21:35:46Z
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkOrbitToTimeRange_tst_1.jl")
jMtkOrbitToTimeRange_tst_1

julia> start_time, end_time = jMtkOrbitToTimeRange_tst_1();

julia> @test (start_time, end_time) == ("2006-01-24T19:56:53Z", "2006-01-24T21:35:46Z")
Test Passed
```
"""
function jMtkOrbitToTimeRange_tst_1()
    orbit = 32467
    start_time, end_time = jMtkOrbitToTimeRange(orbit)
    return start_time, end_time
end
