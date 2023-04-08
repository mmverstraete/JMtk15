"""
    packed_dms = jMtkDdToDms_tst_1()

# Purpose:
Generate the output of `jMtkDdToDms` for testing purposes.

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
IDL> status = MTK_DD_TO_DMS(decdeg, packed_dms)
IDL> PRINT, packed_dms
       65030000.
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDdToDms_tst_1.jl")
jMtkDdToDms_tst_1

julia> packed_dms = jMtkDdToDms_tst_1();

julia> @test packed_dms == 6.503e7
Test Passed
```
"""
function jMtkDdToDms_tst_1()
    decdeg = 65.5
    packed_dms = jMtkDdToDms(decdeg)
    return packed_dms[]
end
