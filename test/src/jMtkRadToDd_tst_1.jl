"""
    decdeg = jMtkRadToDd_tst_1()

# Purpose:
Generate the output of `jMtkRadToDd` for testing purposes.

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
IDL> radians = 1.1440634
IDL> status = MTK_RAD_TO_DD(radians, decdeg)
IDL> PRINT, decdeg
       65.550002
IDL> PRINT, decdeg, FORMAT = '(D18.12)'
    65.550001653340
```
# Note: there is a slight and unexplained discrepancy beyween the IDL and the C/Julia results.

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkRadToDd_tst_1.jl")
jMtkRadToDd_tst_1

julia> decdeg = jMtkRadToDd_tst_1();

julia> @test decdeg == 65.55000431538731
Test Passed
```
"""
function jMtkRadToDd_tst_1()
    radians = 1.1440634
    decdeg = jMtkRadToDd(radians)
    return decdeg[]
end
