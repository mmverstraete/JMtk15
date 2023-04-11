"""
    orbit, path = jMtkTimeToOrbitPath_tst_1()

# Purpose:
Generate the output of `jMtkTimeToOrbitPath` for testing purposes.

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
IDL> datetime = '2005-02-02T02:00:00Z'
IDL> status = MTK_TIME_TO_ORBIT_PATH(datetime, orbit, path)
IDL> PRINT, orbit, path
       27271         104
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkTimeToOrbitPath_tst_1.jl")
jMtkTimeToOrbitPath_tst_1

julia> orbit, path = jMtkTimeToOrbitPath_tst_1();

julia> @test orbit == 27271
Test Passed

julia> @test path == 104
Test Passed
```
"""
function jMtkTimeToOrbitPath_tst_1()
    datetime = "2005-02-02T02:00:00Z"
    orbit, path = jMtkTimeToOrbitPath(datetime)
    return orbit, path
end
