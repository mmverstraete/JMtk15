"""
    databuf = jMtkReadBlock_tst_1000()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

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
IDL> filename = root + 'MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf'
IDL> gridname = 'GeometricParameters'
IDL> fieldname = 'SolarAzimuth'
IDL> blocknum = 111
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, databuf)
IDL> SIZE(databuf)
           2          32           8           5         256
IDL> PRINT, databuf[20:23, 0:7]
       230.08959       229.82531       229.55951       229.29219
       229.89184       229.62716       229.36099       229.09329
       229.69559       229.43054       229.16399       228.89594
       229.50085       229.23543       228.96852       228.70011
       229.30761       229.04182       228.77456       228.50581
       229.11584       228.84970       228.58210       228.31302
       228.92556       228.65907       228.39113       228.12173
       228.73674       228.46992       228.20165       227.93194
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_1000.jl")
jMtkReadBlock_tst_1000

julia> databuf = jMtkReadBlock_tst_1000();

julia> @test typeof(databuf) == Matrix{Float64}
Test Passed

julia> @test size(databuf) == (32, 8)
Test Passed

julia> idl_res = Float64.([
        230.08959       229.82531       229.55951       229.29219
        229.89184       229.62716       229.36099       229.09329
        229.69559       229.43054       229.16399       228.89594
        229.50085       229.23543       228.96852       228.70011
        229.30761       229.04182       228.77456       228.50581
        229.11584       228.84970       228.58210       228.31302
        228.92556       228.65907       228.39113       228.12173
        228.73674       228.46992       228.20165       227.93194]);

julia> jul_res = transpose(databuf[21:24, 1:8]);

julia> @test isapprox(idl_res, jul_res, atol = 0.001)
Test Passed
```
"""
function jMtkReadBlock_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    gridname = "GeometricParameters"
    fieldname = "SolarAzimuth"
    blocknum = 111
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return databuf
end
