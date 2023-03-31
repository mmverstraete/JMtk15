"""
    juldate = jMtkDateTimeToJulian_tst_3()

# Purpose:
Generate the output of `jMtkDateTimeToJulian` for testing purposes. Test 3: Additional case.

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
IDL> datetime = '2005-12-23T18:33:18Z'
IDL> status = MTK_DATETIME_TO_JULIAN(datetime, juliandate)
IDL> PRINT, juliandate, FORMAT = '(D13.5)'
2453728.27312
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_3.jl")
jMtkDateTimeToJulian_tst_1

julia> juldate = jMtkDateTimeToJulian_tst_3();

julia> @test (juldate - 2453728.27312) < 0.0001
Test Passed
```
"""
function jMtkDateTimeToJulian_tst_3()
    datetime = "2005-12-23T18:33:18Z"
    juldate = jMtkDateTimeToJulian(datetime)
    return juldate
end
