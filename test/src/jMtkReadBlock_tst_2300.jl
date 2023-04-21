"""
    databuf = jMtkReadBlock_tst_2300()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 2300: For a MISR `TC_CLOUD` file.

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
IDL> gridname = 'Stereo_1.1_km'
IDL> fieldname = 'StereoDerivedCloudMask'
IDL> blocknum = 101
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, databuf)
IDL> SIZE(databuf)
           2         512         128           1       65536
IDL> PRINT, databuf[295:299, 90:96]
   0   1   1   1   4
   1   4   0   4   4
   4   4   4   4   4
   3   3   4   0   4
   4   4   4   0   0
   1   1   4   2   1
   1   1   1   1   1
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_2300.jl")
jMtkReadBlock_tst_2300

julia> databuf = jMtkReadBlock_tst_2300();

julia> @test typeof(databuf) == Matrix{Int8}
Test Passed

julia> @test size(databuf) == (512, 128)
Test Passed

julia> @test transpose(databuf[296:300, 91:97]) == Int8.([
    0   1   1   1   4
    1   4   0   4   4
    4   4   4   4   4
    3   3   4   0   4
    4   4   4   0   0
    1   1   4   2   1
    1   1   1   1   1])
Test Passed
```
"""
function jMtkReadBlock_tst_2300()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"
    gridname = "Stereo_1.1_km"
    fieldname = "StereoDerivedCloudMask"
    blocknum = 101
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return databuf
end
