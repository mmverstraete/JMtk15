"""
    errmsg = jMtkErrorMessage_tst_0010()

# Purpose:
Generate the output of `jMtkErrorMessage` for testing purposes. Test 0010: status = 10.

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
IDL> PRINT, MTK_ERROR_MESSAGE(10)
MALLOC FAILED
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkErrorMessage_tst_0010.jl")
jMtkErrorMessage_tst_0010

julia> errmsg = jMtkErrorMessage_tst_0010();

julia> @test errmsg == "MALLOC FAILED"
Test Passed
```
"""
function jMtkErrorMessage_tst_0010()
    status = 10
    return jMtkErrorMessage(status)
end
