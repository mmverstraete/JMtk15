"""
    somx, somy = jMtkBlsToSomXY_tst_1()

# Purpose:
Generate the output of `jMtkBlsToSomXY` for testing purposes.

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
IDL> path = 230
IDL> resolution = 1100
IDL> block = 69
IDL> line = 100.2
IDL> sample = 89.9
IDL> status = MTK_BLS_TO_SOMXY(path, resolution, block, line, sample, somx, somy)
IDL> PRINT, somx, somy
       17145920.       222089.99
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkBlsToSomXY_tst_1.jl")
jMtkBlsToSomXY_tst_1

julia> somx, somy = jMtkBlsToSomXY_tst_1();

julia> @test (somx, somy) == (1.7145919996643066e7, 222089.9932861328)
Test Passed
```
"""
function jMtkBlsToSomXY_tst_1()
    path = 230
    resolution = 1100
    block = 69
    line = 100.2
    sample = 89.9
    somx, somy = jMtkBlsToSomXY(path, resolution, block, line, sample)
    return somx, somy
end
