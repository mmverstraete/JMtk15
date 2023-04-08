"""
    packed_dms = jMtkDegMinSecToDms_tst_1()

# Purpose:
Generate the output of `jMtkDegMinSecToDms` for testing purposes.

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
IDL> status = MTK_DEG_MIN_SEC_TO_DMS(degrees, minutes, seconds, packed_dms)
IDL> PRINT, packed_dms
       65033000.
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDegMinSecToDms_tst_1.jl")
jMtkDegMinSecToDms_tst_1

julia> packed_dms = jMtkDegMinSecToDms_tst_1();

julia> @test packed_dms == 6.5033000001e7
Test Passed
```
"""
function jMtkDegMinSecToDms_tst_1()
    deg = 65
    minutes = 33
    seconds = 0.001
    packed_dms = jMtkDegMinSecToDms(deg, minutes, seconds)
    return packed_dms[]
end
