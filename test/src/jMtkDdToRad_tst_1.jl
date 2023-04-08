"""
    radians = jMtkDdToRad_tst_1()

# Purpose:
Generate the output of `jMtkDdToRad` for testing purposes.

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
IDL> status = MTK_DD_TO_RAD(decdeg, radians)
IDL> PRINT, radians
       1.1431907
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkDdToRad_tst_1.jl")
jMtkDdToRad_tst_1

julia> radians = jMtkDdToRad_tst_1();

julia> @test radians == 1.1431906600562858
Test Passed
```
"""
function jMtkDdToRad_tst_1()
    decdeg = 65.5
    radians = jMtkDdToRad(decdeg)
    return radians[]
end
