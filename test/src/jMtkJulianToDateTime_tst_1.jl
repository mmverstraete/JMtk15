"""
    datetime = jMtkJulianToDateTime_tst_1()

# Purpose:
Generate the output of `jMtkJulianToDateTime` for testing purposes. Test 1: Inverse of Test 1 of `jMtkDateTimeToJulian_tst_1`.

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
IDL> status = MTK_JULIAN_TO_DATETIME(2453728.27313d, datetime)
IDL> PRINT, datetime
2005-12-23T18:33:18Z
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkJulianToDateTime_tst_1.jl")
jMtkJulianToDateTime_tst_1

julia> datetime = jMtkJulianToDateTime_tst_1();

julia> @test datetime == "2002-05-02T02:00:00Z"
Test Passed
```
"""
function jMtkJulianToDateTime_tst_1()
    juldate = 2452396.58333
    datetime = jMtkJulianToDateTime(juldate)
    return datetime
end
