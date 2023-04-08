"""
    decdeg = jMtkDegMinSecToDd_tst_1()

# Purpose:
Generate the output of `jMtkDegMinSecToDd` for testing purposes.

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
IDL> degrees = 65
IDL> minutes = 33
IDL> seconds = 0.001
IDL> status = MTK_DEG_MIN_SEC_TO_DD(degrees, minutes, seconds, decdeg)
IDL> PRINT, decdeg
       65.550000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDegMinSecToDd_tst_1.jl")
jMtkDegMinSecToDd_tst_1

julia> decdeg = jMtkDegMinSecToDd_tst_1();

julia> @test decdeg == 65.55000027777777
Test Passed
```
"""
function jMtkDegMinSecToDd_tst_1()
    degrees = 65
    minutes = 33
    seconds = 0.001
    decdeg = jMtkDegMinSecToDd(degrees, minutes, seconds)
    return decdeg[]
end
