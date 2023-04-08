"""
    decdeg = jMtkDmsToDd_tst_1()

# Purpose:
Generate the output of `jMtkDmsToDd` for testing purposes.

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
IDL> packed_dms = 65033000.010
IDL> status = MTK_DMS_TO_DD(packed_dms, decdeg)
IDL> PRINT, decdeg
       65.550000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDmsToDd_tst_1.jl")
jMtkDmsToDd_tst_1

julia> decdeg = jMtkDmsToDd_tst_1();

julia> @test decdeg == 65.5500027777772
Test Passed
```
"""
function jMtkDmsToDd_tst_1()
    packed_dms = 65033000.010
    decdeg = jMtkDmsToDd(packed_dms)
    return decdeg[]
end
