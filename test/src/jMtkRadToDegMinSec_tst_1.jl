"""
    degrees, minutes, seconds = jMtkRadToDegMinSec_tst_1()

# Purpose:
Generate the output of `jMtkRadToDegMinSec` for testing purposes.

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
IDL> radians = 1.14406333
IDL> status = MTK_RAD_TO_DEG_MIN_SEC(radians, degrees, minutes, seconds)
IDL> PRINT, degrees, minutes, seconds
          65          33    0.0059520230
```
# Note: there is a slight and unexplained discrepancy beyween the IDL and the C/Julia results.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkRadToDegMinSec_tst_1.jl")
jMtkRadToDegMinSec_tst_1

julia> degrees, minutes, seconds = jMtkRadToDegMinSec_tst_1();

julia> @test (degrees, minutes, seconds) == (65, 33, 0.0010968595743179321)
Test Passed
```
"""
function jMtkRadToDegMinSec_tst_1()
    radians = 1.14406333
    degrees, minutes, seconds = jMtkRadToDegMinSec(radians)
    return (degrees[], minutes[], seconds[])
end
