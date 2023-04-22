"""
    include(JMtk15_src * "include/MisrProjParam_h.jl")

Partial translation of the symbols defined in the C file "MisrProjParam.h" of Mtk.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15)

# Notes:
* See the original file for additional details and in-line comments.
* The translation of the first 4 lines of the C file "MisrProjParam.h" were
    moved after the following block of "const" definitions so that the macro
    identifiers RESOLUTION, NLINE and NSAMPLE were defined prior to the definition
    of MAXNLINE and MAXNSAMPLE.

# Example:
```julia
julia> using JMtk15

julia> include(JMtk15_src * "include/MisrProjParam_h.jl")
```
"""
# MISR projection parameters for Path 1 at 1100 meter resolution.
# All other paths and resolutions are derived from these parameters:
const NRES = 6
export NRES

const NPATH = 233
export NPATH

const PATHNUM = 1
export PATHNUM

const PROJCODE = 22
export PROJCODE

const ZONECODE = -1
export ZONECODE

const SPHERECODE = 12
export SPHERECODE

const PP1_SMAJOR = 6378137.0
export PP1_SMAJOR

const PP2_SMINOR = -0.006694348
export PP2_SMINOR

const PP3_UNUSED = 0.0
export PP3_UNUSED

const PP4_INCANG = 98018013.7520
export PP4_INCANG

const PP5_ASCLONG = 127045037.928240340
export PP5_ASCLONG

const PP6_UNUSED = 0.0
export PP6_UNUSED

const PP7_FE = 0.0
export PP7_FE

const PP8_FN = 0.0
export PP8_FN

const PP9_PSREV = 98.88
export PP9_PSREV

const PP10_LRAT = 0.0
export PP10_LRAT

const PP11_PFLAG = 0.0
export PP11_PFLAG

const PP12_BLOCKS = 180.0
export PP12_BLOCKS

const PP13_SOMA = 0.0
export PP13_SOMA

const PP14_UNUSED = 0.0
export PP14_UNUSED

const PP15_UNUSED = 0.0
export PP15_UNUSED

const NBLOCK = 180
export NBLOCK

const NLINE = 128
export NLINE

const NSAMPLE = 512
export NSAMPLE

const RESOLUTION = 1100
export RESOLUTION

const ULC_SOMX = 7460750.0
export ULC_SOMX

const ULC_SOMY = 1090650.0
export ULC_SOMY

const LRC_SOMX = 7601550.0
export LRC_SOMX

const LRC_SOMY = 527450.0
export LRC_SOMY

# MISR's max resolution, line and sample for a block:
const MAXRESOLUTION = 275
export MAXRESOLUTION

const MINRESOLUTION = 17600
export MINRESOLUTION

const MAXNLINE = (RESOLUTION / MAXRESOLUTION * NLINE)   # ((1100 / 275) * 128) = 512
export MAXNLINE

const MAXNSAMPLE = (RESOLUTION / MAXRESOLUTION * NSAMPLE)   # ((1100 / 275) * 512) = 2048
export MAXNSAMPLE

# Relative block offsets:
const RELOFFSET = (
    0.0, 16.0, 0.0, 16.0, 0.0, 0.0, 0.0, 16.0, 0.0, 0.0,
    0.0, 0.0, 16.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -16.0, 0.0, 0.0, 0.0,
    -16.0, 0.0, 0.0, -16.0, 0.0, 0.0, -16.0, 0.0, -16.0,
    0.0, -16.0, 0.0, -16.0, -16.0, 0.0, -16.0, 0.0, -16.0,
    -16.0, 0.0, -16.0, -16.0, -16.0, 0.0, -16.0, -16.0, -16.0,
    -16.0, 0.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0,
    -16.0, -16.0, -16.0, -32.0, -16.0, -16.0, -16.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -32.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, -16.0, -16.0, 0.0, -16.0,
    -16.0, -16.0, -16.0, -16.0, 0.0, -16.0, -16.0, -16.0, 0.0,
    -16.0, -16.0, 0.0, -16.0, 0.0, -16.0, -16.0, 0.0, -16.0,
    0.0, -16.0, 0.0, 0.0, -16.0, 0.0, -16.0, 0.0, 0.0, -16.0,
    0.0, 0.0, 0.0, 0.0, -16.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    16.0, 0.0, 0.0, 16.0, 0.0, 0.0, 16.0, 0.0)
export RELOFFSET

# GCTP projection parameter array:
const PROJPARAM = (
    PP1_SMAJOR, PP2_SMINOR, PP3_UNUSED, PP4_INCANG, PP5_ASCLONG,
    PP6_UNUSED, PP7_FE, PP8_FN, PP9_PSREV, PP10_LRAT, PP11_PFLAG,
    PP12_BLOCKS, PP13_SOMA, PP14_UNUSED, PP15_UNUSED)
export PROJPARAM

# Upper left corner and lower right corner of the first block:
const ULC = (ULC_SOMX, ULC_SOMY)
export ULC

const LRC = (LRC_SOMX, LRC_SOMY)
export LRC

# MISR Projection Parameters:
struct MTKt_MisrProjParam
    path::Cint
    projcode::Clonglong
    zonecode::Clonglong
    spherecode::Clonglong
    projparam::SVector{15, Cdouble}
    ulc::SVector{2, Cdouble}
    lrc::SVector{2, Cdouble}
    nblock::Cint
    nline::Cint
    nsample::Cint
    reloffset::SVector{179, Cfloat}
    resolution::Cint
end
export MTKt_MisrProjParam

# MTK MISR projection parameter initialization macro:
MTKT_MISRPROJPARAM_INIT = MTKt_MisrProjParam(
    PATHNUM, PROJCODE, ZONECODE, SPHERECODE,
    PROJPARAM, ULC, LRC, NBLOCK, NLINE, NSAMPLE, RELOFFSET, RESOLUTION)
export MTKT_MISRPROJPARAM_INIT
