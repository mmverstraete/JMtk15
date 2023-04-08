"""
    block_corners = jMtkPathBlockRangeToBlockCorners(path, start_block, end_block)

# Purpose:
Return block corner coordinates in decimal degrees of latitude and longitude
    for a given path and block range. Coordinates returned are with respect to
    the pixel center of the upper left corner, center and lower right corner
    of each block.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Notes:
* MISR blocks are numbered from 1 (near the North pole) to 180 (near the South pole).
* C and IDL arrays use 0-based array indexing, but Julia arrays use 1-based array indexing.
* To store information about block `n` in a C or IDL array at the same index value, that
    array must contain 181 elements (from 0 to 180), where the first one (index 0) is ignored.
* When the C function returns such an array to Julia, it is stored in an array of 181
    elements (from 1 to 181), where the first one (index 1) is also ignored.
* Hence the information about block `n` is located in the Julia array at element `n + 1`.
* When requesting information about a limited range of blocks, the coordinates for all other blocks are not computed, and therefore returned as zeros.

# Example:
Require information about the corner coordinates of blocks 50 to 53, which are to be found in elements 51 to 54 of the output variable `block_corners`:

```julia
julia> using JMtk15

julia> path = 37
37

julia> start_block = 50
50

julia> end_block = 53
53

julia> block_corners = jMtkPathBlockRangeToBlockCorners(path, start_block, end_block);

julia> block_corners.block[50]
MTKt_GeoBlock(0, MTKt_GeoCoord(0.0, 0.0), MTKt_GeoCoord(0.0, 0.0), MTKt_GeoCoord(0.0, 0.0),
    MTKt_GeoCoord(0.0, 0.0), MTKt_GeoCoord(0.0, 0.0))

julia> block_corners.block[51]
MTKt_GeoBlock(50, MTKt_GeoCoord(51.50172788126263, -110.34181235426887),
    MTKt_GeoCoord(50.55921476448539, -102.45622291180113),
    MTKt_GeoCoord(50.47619474545069, -106.54373076847435),
    MTKt_GeoCoord(49.33239267609881, -102.91557271102047),
    MTKt_GeoCoord(50.25072514075242, -110.60484537214862))

julia> block_corners.block[53]
MTKt_GeoBlock(52, MTKt_GeoCoord(49.014067408014164, -111.09560823489086),
    MTKt_GeoCoord(48.133868087931134, -103.58257839548311),
    MTKt_GeoCoord(48.012765787402664, -107.4704148885336),
    MTKt_GeoCoord(46.90188427533023, -103.99047252579555),
    MTKt_GeoCoord(47.76117892385338, -111.3306357462539))

julia> block_corners.block[54]
MTKt_GeoBlock(53, MTKt_GeoCoord(47.77794661143779, -111.56393495460624),
    MTKt_GeoCoord(46.93334647883273, -104.2166987821375),
    MTKt_GeoCoord(46.79114534637805, -108.01472259273179),
    MTKt_GeoCoord(45.69864278727337, -104.5996858571367),
    MTKt_GeoCoord(46.52405645775748, -111.78423927666803))

julia> block_corners.block[55]
MTKt_GeoBlock(0, MTKt_GeoCoord(0.0, 0.0), MTKt_GeoCoord(0.0, 0.0), MTKt_GeoCoord(0.0, 0.0),
    MTKt_GeoCoord(0.0, 0.0), MTKt_GeoCoord(0.0, 0.0))
```
"""
function jMtkPathBlockRangeToBlockCorners(path, start_block, end_block)
    block_corners = Ref{MTKt_BlockCorners}(MTKT_BLOCKCORNERS_INIT)
    status = ccall((:MtkPathBlockRangeToBlockCorners, mtklib),
        Cint,
        (Cint, Cint, Cint, Ptr{MTKt_BlockCorners}),
        path, start_block, end_block, block_corners)
    if status != 0
        error("jMtkPathBlockRangeToBlockCorners status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return block_corners[]
end
