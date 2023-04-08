"""
    packed_dms = jMtkRadToDms_tst_1()

# Purpose:
Generate the output of `jMtkRadToDms` for testing purposes.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-10).

# Verification:
```idl
IDL> radians = 1.14406332
IDL> status = MTK_RAD_TO_DMS(radians, packed_dms)
IDL> PRINT, packed_dms
       65033000.
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkRadToDms_tst_1.jl")
jMtkRadToDms_tst_1

julia> packed_dms = jMtkRadToDms_tst_1();

julia> @test packed_dms == 6.503205999903421e7
Test Passed
```
"""
function jMtkRadToDms_tst_1()
    radians = 1.14406332
    packed_dms = jMtkRadToDms(radians)
    return packed_dms
end
