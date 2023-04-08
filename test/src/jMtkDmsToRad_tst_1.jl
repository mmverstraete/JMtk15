"""
    radians = jMtkDmsToRad_tst_1()

# Purpose:
Generate the output of `jMtkDmsToRad` for testing purposes.

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
IDL> packed_dms  = 65033000.010
IDL> status = MTK_DMS_TO_RAD(packed_dms, radians)
IDL> PRINT, radians
       1.1440633
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDmsToRad_tst_1.jl")
jMtkDmsToRad_tst_1

julia> radians = jMtkDmsToRad_tst_1();

julia> @test radians == 1.144063373163641
Test Passed
```
"""
function jMtkDmsToRad_tst_1()
    packed_dms  = 65033000.010
    radians = jMtkDmsToRad(packed_dms)
    return radians[]
end
