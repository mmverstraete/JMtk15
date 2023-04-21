"""
    databuf = jMtkReadBlock_tst_1300()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 1300: For a MISR `GRP_TERRAIN_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf'
IDL> gridname = 'RedBand'
IDL> fieldname = 'Red Radiance/RDQI'
IDL> blocknum = 112
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, databuf)
IDL> SIZE(databuf)
           2        2048         512          12     1048576
IDL> PRINT, databuf[1260:1263, 213:219]
    3176    2900    2872    3176
    3112    2864    2908    3120
    2908    2856    2916    2988
    2964    2852    2964    2964
    2972    2924    3092    3004
    2976    2992    3192    3180
    3004    2936    3168    3596
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_1300.jl")
jMtkReadBlock_tst_1300

julia> databuf = jMtkReadBlock_tst_1300();

julia> @test typeof(databuf) == Matrix{UInt16}
Test Passed

julia> @test size(databuf) == (2048, 512)
Test Passed

julia> @test transpose(databuf[1261:1264, 214:220]) == UInt16.([
        3176    2900    2872    3176
        3112    2864    2908    3120
        2908    2856    2916    2988
        2964    2852    2964    2964
        2972    2924    3092    3004
        2976    2992    3192    3180
        3004    2936    3168    3596])
Test Passed
```
"""
function jMtkReadBlock_tst_1300()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    gridname = "RedBand"
    fieldname = "Red Radiance/RDQI"
    blocknum = 112
    databuf = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return databuf
end
