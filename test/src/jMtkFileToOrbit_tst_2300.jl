"""
    orbit = jMtkFileToOrbit_tst_2300()

# Purpose:
Generate the output of `jMtkFileToOrbit` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf'
IDL> status = MTK_FILE_TO_ORBIT(filename, orbit)
IDL> IDL> PRINT, orbit
       68050
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileToOrbit_tst_2300.jl")
jMtkFileToOrbit_tst_2300

julia> orbit = jMtkFileToOrbit_tst_2300();

julia> @test orbit == 68050
Test Passed
```
"""
function jMtkFileToOrbit_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    return jMtkFileToOrbit(filename)
end
