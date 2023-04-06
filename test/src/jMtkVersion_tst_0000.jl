"""
    version = jMtkVersion_tst_0000()

# Purpose:
Generate the output of `jMtkVersion` for testing purposes.

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
IDL> PRINT, MTK_VERSION()
1.5.0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkVersion_tst_0000.jl")
jMtkVersion_tst

julia> version = jMtkVersion_tst_0000();

julia> @test version == "1.5.0"
Test Passed
```
"""
function jMtkVersion_tst_0000()
    version = jMtkVersion()
    return version
end
