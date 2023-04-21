"""
    databuf = jMtkReadBlock_tst_1500()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf'
IDL> gridname = 'RCCM'
IDL> fieldname = 'Cloud'
IDL> blocknum = 106
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, databuf)
IDL> SIZE(databuf)
           2         512         128           1       65536
IDL> PRINT, databuf[186:190, 26:33]
   4   2   4   2   3
   4   3   4   2   2
   4   4   4   2   2
   4   3   3   2   4
   4   3   3   3   4
   4   3   3   0   4
   4   4   3   4   0
   4   0   3   4   4
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_1500.jl")
jMtkReadBlock_tst_1500

julia> databuf = jMtkReadBlock_tst_1500();

julia> @test typeof(databuf) == Matrix{UInt8}
Test Passed

julia> @test size(databuf) == (512, 128)
Test Passed

julia> @test transpose(databuf[187:191, 27:34]) == UInt8.([
        4   2   4   2   3
        4   3   4   2   2
        4   4   4   2   2
        4   3   3   2   4
        4   3   3   3   4
        4   3   3   0   4
        4   4   3   4   0
        4   0   3   4   4])
Test Passed
```
"""
function jMtkReadBlock_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf"
    gridname = "RCCM"
    fieldname = "Cloud"
    blocknum = 106
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return databuf
end
