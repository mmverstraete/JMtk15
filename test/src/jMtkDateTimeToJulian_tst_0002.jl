"""
    juldate = jMtkDateTimeToJulian_tst_0002()

# Purpose:
Generate the output of `jMtkDateTimeToJulian` for testing purposes. Test 0002: `datetime` without final `Z`.

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
IDL> status = MTK_DATETIME_TO_JULIAN('2002-05-02T02:00:00', juliandate)
IDL> PRINT, juliandate, FORMAT = '(D13.5)'
2452396.58333
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_0002.jl")
jMtkDateTimeToJulian_tst_0002

julia> juldate = jMtkDateTimeToJulian_tst_0002();

julia> @test (juldate - 2452396.58333) < 0.0001
Test Passed
```
"""
function jMtkDateTimeToJulian_tst_0002()
    datetime = "2002-05-02T02:00:00"
    juldate = jMtkDateTimeToJulian(datetime)
    return juldate
end
