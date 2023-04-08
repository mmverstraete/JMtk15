"""
    block, line, sample = jMtkSomXYToBls_tst_1()

# Purpose:
Generate the output of `jMtkSomXYToBls` for testing purposes.

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
IDL> somx = 17145920.0
IDL> somy = 222090.0
IDL> status = MTK_SOMXY_TO_BLS(path, resolution, somx, somy, block, line, sample)
IDL> PRINT, block, line, sample
          69      100.200      89.9000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkSomXYToBls_tst_1.jl")
jMtkSomXYToBls_tst_1

julia> block, line, sample = jMtkSomXYToBls_tst_1();

julia> @test (block, line, sample) == (69, 100.200195f0, 89.899994f0)
Test Passed
```
"""
function jMtkSomXYToBls_tst_1()
    path = 230
    resolution = 1100
    somx = 17145920.0
    somy = 222090.0
    block, line, sample = jMtkSomXYToBls(path, resolution, somx, somy)
    return block, line, sample
end
