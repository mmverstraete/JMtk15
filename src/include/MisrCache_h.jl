"""
    include(JMtk15_src * "include/MisrCache_h.jl")

Partial translation of the symbols defined in the C file "MisrCache.h" of Mtk.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-01-16)

# Note:
* See the original file for additional details and in-line comments.

# Example:
```julia
julia> using JMtk15

julia> include(JMtk15_src * "include/MisrCache_h.jl")
```
"""
const BLOCK_CACHE_MAX = 2
export BLOCK_CACHE_MAX

mutable struct MTKt_Block
    valid::MTKt_boolean
    buf::MTKt_DataBuffer
end
export MTKt_Block

const MTKT_BLOCK_INIT = (MTK_FALSE, MTKT_DATABUFFER_INIT)
export MTKT_BLOCK_INIT

mutable struct MTKt_Cache
    fid::Cint
    ncid::Cint
    gridname::Cstring
    fieldname::Cstring
    block_cnt::Cint
    fill::MTKt_DataBuffer
    block::MTKt_Block
end
export MTKt_Cache

const MTKT_CACHE_INIT = (0, 0, C_NULL, C_NULL, 0, MTKT_DATABUFFER_INIT, (MTKT_BLOCK_INIT))
export MTKT_CACHE_INIT
