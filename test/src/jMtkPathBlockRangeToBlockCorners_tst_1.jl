"""
    block_corners = jMtkPathBlockRangeToBlockCorners_tst_1()

# Purpose:
Generate the output of `jMtkPathBlockRangeToBlockCorners` for testing purposes.

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
IDL> path = 37
IDL> start_block = 50
IDL> end_block = 50
IDL> status = MTK_PATH_BLOCKRANGE_TO_BLOCKCORNERS(path, start_block, end_block, block_corners)
IDL> PRINT, block_corners.path
          37
IDL> PRINT, block_corners.start_block, block_corners.end_block
          50          50
IDL> PRINT, block_corners.block[50].block_number
          50
IDL> PRINT, block_corners.block[50].ulc
{       51.501728      -110.34181}
IDL> PRINT, block_corners.block[50].urc
{       50.559215      -102.45622}
IDL> PRINT, block_corners.block[50].ctr
{       50.476195      -106.54373}
IDL> PRINT, block_corners.block[50].lrc
{       49.332393      -102.91557}
IDL> PRINT, block_corners.block[50].llc
{       50.250725      -110.60485}
```

# Example:
Information about the corner coordinates of blocks 50 will be found in element 51 of the output variable `block_corners`:

```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkPathBlockRangeToBlockCorners_tst_1.jl")
jMtkPathBlockRangeToBlockCorners_tst_1

julia> block_corners = jMtkPathBlockRangeToBlockCorners_tst_1();

julia> @test block_corners.path == 37
Test Passed

julia> @test (block_corners.start_block, block_corners.end_block) == (50, 50)
Test Passed

julia> @test block_corners.block[51].ulc == MTKt_GeoCoord(51.50172788126263, -110.34181235426887)
Test Passed

julia> @test block_corners.block[51].urc == MTKt_GeoCoord(50.55921476448539, -102.45622291180113)
Test Passed

julia> @test block_corners.block[51].ctr == MTKt_GeoCoord(50.47619474545069, -106.54373076847435)
Test Passed

julia> @test block_corners.block[51].lrc == MTKt_GeoCoord(49.33239267609881, -102.91557271102047)
Test Passed

julia> @test block_corners.block[51].llc == MTKt_GeoCoord(50.25072514075242, -110.60484537214862)
Test Passed
```
"""
function jMtkPathBlockRangeToBlockCorners_tst_1()
    path = 37
    start_block = 50
    end_block = 50
    block_corners = jMtkPathBlockRangeToBlockCorners(path, start_block, end_block)
    return block_corners
end
