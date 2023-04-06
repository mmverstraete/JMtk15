"""
    datetime = jMtkJulianToDateTime_tst_0002()

# Purpose:
Generate the output of `jMtkJulianToDateTime` for testing purposes. Test 0002: Additional case.

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
IDL> status = MTK_JULIAN_TO_DATETIME(2459744.0106250001d, datetime)
IDL> datetime
2022-06-13T12:15:18Z
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkJulianToDateTime_tst_0002.jl")
jMtkJulianToDateTime_tst_0002

julia> datetime = jMtkJulianToDateTime_tst_0002();

julia> @test datetime == "2022-06-13T12:15:18Z"
Test Passed
```
"""
function jMtkJulianToDateTime_tst_0002()
    juldate = 2459744.0106250001
    datetime = jMtkJulianToDateTime(juldate)
    return datetime
end
