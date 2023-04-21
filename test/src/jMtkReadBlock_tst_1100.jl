"""
    databuf = jMtkReadBlock_tst_1100()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf'
IDL> gridname = 'GreenBand'
IDL> fieldname = 'Green Radiance/RDQI'
IDL> blocknum = 111
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, databuf)
IDL> SIZE(databuf)
           2         512         128           1       65536
IDL> PRINT, databuf[290:293, 50:55]
    3576    3504    3416    3432
    3552    3604    3532    3424
    3528    3580    3576    3592
    3648    3612    3504    3556
    3708    3672    3612    3612
    3748    3652    3560    3592
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_1100.jl")
jMtkReadBlock_tst_1100

julia> databuf = jMtkReadBlock_tst_1100();

julia> @test typeof(databuf) == Matrix{UInt16}
Test Passed

julia> @test size(databuf) == (512, 128)
Test Passed

julia> @test transpose(databuf[291:294, 51:56]) == UInt16.([
    3576    3504    3416    3432
    3552    3604    3532    3424
    3528    3580    3576    3592
    3648    3612    3504    3556
    3708    3672    3612    3612
    3748    3652    3560    3592])
Test Passed
    ```
"""
function jMtkReadBlock_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"
    gridname = "GreenBand"
    fieldname = "Green Radiance/RDQI"
    blocknum = 111
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return databuf
end
