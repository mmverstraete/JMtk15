"""
    include(JMtk15_src * "include/MisrCoordQuery_h.jl")

Partial translation of the symbols defined in the C file "MisrCoordQuery.h" of Mtk.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-01-16)

# Notes:
* See the original file for additional details and in-line comments.
* C arrays use 0-based indexing. Since MISR Blocks are numbered 1 to 180, an
    array referring to all Blocks contains 181 elements (from 0 to 180), and
    the first element is ignored. For consistency and debugging purposes,
    the corresponding Julia array also contains 181 elements (from 1 to 181),
    so Block `n` in C corresponds to Block `n - 1` in Julia, where Block 1
    must be ignored.

# Example:
```julia
julia> using JMtk15

julia> include(JMtk15_src * "include/MisrCoordQuery_h.jl")
```
"""
struct MTKt_GeoBlock
    block_number::Cint
    ulc::MTKt_GeoCoord
    urc::MTKt_GeoCoord
    ctr::MTKt_GeoCoord
    lrc::MTKt_GeoCoord
    llc::MTKt_GeoCoord
end
export MTKt_GeoBlock

const MTKT_GEOBLOCK_INIT = MTKt_GeoBlock(0,
    MTKT_GEOCOORD_INIT,
    MTKT_GEOCOORD_INIT,
    MTKT_GEOCOORD_INIT,
    MTKT_GEOCOORD_INIT,
    MTKT_GEOCOORD_INIT)
export MTKT_GEOBLOCK_INIT

struct MTKt_BlockCorners
    path::Cint
    start_block::Cint
    end_block::Cint
    block::SVector{181, MTKt_GeoBlock}   #NTuple{181, MTKt_GeoBlock}   # 
end
export MTKt_BlockCorners

# Option 1: Suggested by Clang
# const MTKT_BLOCKCORNERS_INIT = {0, 0, 0, {MTKT_GEOBLOCK_INIT}}
# leads to compilation `ERROR: LoadError: syntax: { } vector syntax is discontinued
# around /Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/src/include/MisrCoordQuery_h.jl:50`

# Option 2: Replace {} by ():
# const MTKT_BLOCKCORNERS_INIT = (0, 0, 0, (MTKT_GEOBLOCK_INIT))
# leads to no compilation error when `using JMtk15`, but generates `ERROR: MethodError:
# Cannot `convert` an object of type Tuple{Int64, Int64, Int64, MTKt_GeoBlock}
# to an object of type MTKt_BlockCorners when calling `jMtkPathBlockRangeToBlockCorners.jl`
# The fact that `0` is `Int64` by default may be part of the problem...

# Option 3: Replace `0` by Int32 values:
# const MTKT_BLOCKCORNERS_INIT = (convert(Int32, 0), convert(Int32, 0), convert(Int32, 0),
#     (MTKT_GEOBLOCK_INIT))
# leads to no compilation error when `using JMtk15`, but generates `ERROR: MethodError:
# Cannot `convert` an object of type Tuple{Int32, Int32, Int32, MTKt_GeoBlock}
# to an object of type MTKt_BlockCorners` when calling `jMtkPathBlockRangeToBlockCorners.jl`
# Perhaps this syntax initializes only one instance of `MTKt_GeoBlock` instead of all 181...

# Option 4: Force 181 initializations:
# const MTKT_BLOCKCORNERS_INIT = (convert(Int32, 0), convert(Int32, 0), convert(Int32, 0),
#     NTuple{181, MTKT_GEOBLOCK_INIT})
# leads to no compilation error when `using JMtk15`, but generates `ERROR: MethodError:
# Cannot `convert` an object of type Tuple{Int32, Int32, Int32, DataType}
# to an object of type MTKt_BlockCorners`

# Option 5: Replace {} by () in the NTuple initialization:
# const MTKT_BLOCKCORNERS_INIT = (convert(Int32, 0), convert(Int32, 0), convert(Int32, 0),
#     NTuple(181, MTKT_GEOBLOCK_INIT))
# leads to compilation `ERROR: LoadError: MethodError: no method matching
# (Tuple{Vararg{T, N}} where {N, T})(::Int64, ::JMtk15.MTKt_GeoBlock)`

# Option 6: Edit the NTuple to show the initial value after the type:
# const MTKT_BLOCKCORNERS_INIT = (convert(Int32, 0), convert(Int32, 0), convert(Int32, 0),
#     NTuple{181, MTKt_GeoBlock}(MTKT_GEOBLOCK_INIT))
# leads to compilation `ERROR: LoadError: MethodError: no method matching
# length(::JMtk15.MTKt_GeoBlock)`, followed by long list of `Closest candidates`.

# Option 7: Use SVector instead of NTuple, BOTH in the definition of the struct
# (block::SVector{181, MTKt_GeoBlock}) and in the initialization, as suggested by CLang:
# const MTKT_BLOCKCORNERS_INIT = {0, 0, 0, {MTKT_GEOBLOCK_INIT}}
# leads to compilation `ERROR: LoadError: syntax: { } vector syntax is discontinued
# around /Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/src/include/MisrCoordQuery_h.jl:90`, just as
# was the case in Option 1 above.

# Option 8: Initialize the SVector explicitly:
# const MTKT_BLOCKCORNERS_INIT = {0, 0, 0, [MTKT_GEOBLOCK_INIT for i in 1:181]}
# leads to compilation `ERROR: LoadError: syntax: { } vector syntax is discontinued
# around /Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/src/include/MisrCoordQuery_h.jl:96`

# Option 9: Use () instead of {}:
# const MTKT_BLOCKCORNERS_INIT = (0, 0, 0, [MTKT_GEOBLOCK_INIT for i in 1:181])
# leads to no compilation error when `using JMtk15`, but generates `ERROR: MethodError:
# Cannot `convert` an object of type Tuple{Int64, Int64, Int64, Vector{MTKt_GeoBlock}}
# to an object of type MTKt_BlockCorners`

# Option 10: Same as 9, but explicitly mention that this is an instance of `MTKt_BlockCorners`:
const MTKT_BLOCKCORNERS_INIT = MTKt_BlockCorners(0, 0, 0, [MTKT_GEOBLOCK_INIT for i in 1:181])
# leads to no compilation error when `using JMtk15`, AND does not generate any error when
# calling `jMtkPathBlockRangeToBlockCorners.jl`. However, see the output generated by this
# function, as it appears to involve `MTKt_GeoBlock[MTKt_GeoBlock(...`

export MTKT_BLOCKCORNERS_INIT
