"""
    degrees, minutes, seconds = jMtkDmsToDegMinSec_tst_1()

# Purpose:
Generate the output of `jMtkDmsToDegMinSec` for testing purposes.

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
IDL> packed_dms = 65033011.1
IDL> status = MTK_DMS_TO_DEG_MIN_SEC(packed_dms, degrees, minutes, seconds)
IDL> PRINT, degrees, minutes, seconds
          65          33       12.000000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDmsToDegMinSec_tst_1.jl")
jMtkDmsToDegMinSec_tst_1

julia> degrees, minutes, seconds = jMtkDmsToDegMinSec_tst_1();

julia> @test (degrees, minutes, seconds) == (65, 33, 11.100000001490116)
Test Passed
```
"""
function jMtkDmsToDegMinSec_tst_1()
    packed_dms = 65033011.1
    degrees, minutes, seconds = jMtkDmsToDegMinSec(packed_dms)
    return (degrees[], minutes[], seconds[])
end
