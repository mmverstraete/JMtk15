"""
    path = jMtkOrbitToPath_tst_1()

# Purpose:
Generate the output of `jMtkOrbitToPath` for testing purposes.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-11).

# Verification:
```idl
IDL> orbit = 29058
IDL> status = MTK_ORBIT_TO_PATH(orbit, path)
IDL> PRINT, path
          37
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkOrbitToPath_tst_1.jl")
jMtkOrbitToPath_tst_1

julia> path = jMtkOrbitToPath_tst_1();
37

julia> @test path == 37
Test Passed
```
"""
function jMtkOrbitToPath_tst_1()
    orbit = 29058
    path = jMtkOrbitToPath(orbit)
    return path
end
