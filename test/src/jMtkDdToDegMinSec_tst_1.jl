"""
    degrees, minutes, seconds = jMtkDdToDegMinSec_tst_1()

# Purpose:
Generate the output of `jMtkDdToDegMinSec` for testing purposes.

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
IDL> decdeg = 65.5
IDL> status = MTK_DD_TO_DEG_MIN_SEC(decdeg, degrees, minutes, seconds)
IDL> PRINT, degrees, minutes, seconds
          65          30       0.0000000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDdToDegMinSec_tst_1.jl")
jMtkDdToDegMinSec_tst_1

julia> degrees, minutes, seconds = jMtkDdToDegMinSec_tst_1();

julia> @test (degrees, minutes, seconds) == (65, 30, 0.0)
Test Passed
```
"""
function jMtkDdToDegMinSec_tst_1()
    decdeg = 65.5
    degrees = Ref{Int32}(0)
    minutes = Ref{Int32}(0)
    seconds = Ref{Float64}(0.0)
    degrees, minutes, seconds = jMtkDdToDegMinSec(decdeg)
    return (degrees[], minutes[], seconds[])
end
