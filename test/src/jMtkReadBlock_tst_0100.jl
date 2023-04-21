"""
    databuf = jMtkReadBlock_tst_0100()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> filename = root + 'MISR_AM1_AGP_P168_F01_24.hdf'
IDL> gridname = 'Standard'
IDL> fieldname = 'SurfaceFeatureID'
IDL> blocknum = 110
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, databuf)
IDL> SIZE(databuf)
           2         512         128           1       65536
IDL> PRINT, databuf[470:473, 64:70]
   1   1   2   2
   2   2   2   2
   2   3   2   2
   3   2   2   1
   2   2   1   1
   1   1   1   1
   1   1   1   1
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_0100.jl")
jMtkReadBlock_tst_0100

julia> databuf = jMtkReadBlock_tst_0100();

julia> @test typeof(databuf) == Matrix{UInt8}
Test Passed

julia> @test size(databuf) == (512, 128)
Test Passed

julia> @test transpose(databuf[471:474, 65:71]) == UInt8.([
    1   1   2   2
    2   2   2   2
    2   3   2   2
    3   2   2   1
    2   2   1   1
    1   1   1   1
    1   1   1   1])
Test Passed
```
"""
function jMtkReadBlock_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    gridname = "Standard"
    fieldname = "SurfaceFeatureID"
    blocknum = 110
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return databuf
end
