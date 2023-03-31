"""
    using JMtk15

# Purpose:
Provide Julia wrapper functions to the NASA JPL
    [MISR Toolkit](https://github.com/nasa/MISR-Toolkit) C functions.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Notes:
* This module allows one to use some of the C functions defined in the MISR Toolkit (Mtk) as if they were Julia functions. Please read the README.md file and the documentation for this package to determine which functions are available and how they can be used.
* The MISR Toolkit (Mtk) itself must be installed on your computer before this JMtk15 package can be used. In particular, the location of the shared library `libMisrToolkit.so` in the file system must be specified as part of the configuration of this package.
* MISR data must be available on your computer, and their physical location must be specified as part of the configuration of this package.
* This module must be imported before using any of the wrapper functions because it loads essential definitions and defines the location of resources (source files, test functions, documentation, data).

# Example:
```julia
julia> using JMtk15
[ Info: Precompiling JMtk15 [6c71635d-e68b-418f-880a-c8128ca9dc0a]
```
"""
module JMtk15

using CEnum
export CEnum

using StaticArrays
export SVector

using StringViews
export StringView

# Package configuration:
# Please update the following two assignment statements to match the current configuration.
# 1. Set the location of the Mtk shared library:

mtklib = "/Applications/Mtk-1.5.0/lib/libMisrToolkit.so.1.5.0"
export mtklib

# 2. Set the location of the MISR data files:
# const JMtk15_data = "/Users/michel/MISR_HR/Input/Sample_168/"
# export JMtk15_data

# Define root directories for the project JMtk15:
const JMtk15_root = dirname(@__DIR__)
export JMtk15_root
const JMtk15_src = JMtk15_root * "/src/"
export JMtk15_src
const JMtk15_test = JMtk15_root * "/test/"
export JMtk15_test
const JMtk15_docs = JMtk15_root * "/docs/"
export JMtk15_docs
const JMtk15_docs = JMtk15_root * "/docs/"
export JMtk15_docs
const JMtk15_data = JMtk15_root * "/data/"
export JMtk15_data


# Note 1: The order in which the following files are included is critical,
#   because subsequent files depend on previous files.
# Note 2: All available include files are currently loaded at the start of the
#   module JMtk15 to avoid conditional includes.
# =============================================================================
# Generic .h C files (require no other include files):
include(JMtk15_src * "include/MisrError_h.jl")
include(JMtk15_src * "include/MisrProjParam_h.jl")
# -----------------------------------------------------------------------------
# MisrUtil.h C file (requires MisrError.h):
include(JMtk15_src * "include/MisrUtil_h.jl")
# -----------------------------------------------------------------------------
# MisrUnitConv.h C file (requires MisrError.h), but does not contain any
#   definition that needs translating in Julia.
# -----------------------------------------------------------------------------
# MisrFileQuery.h C file (requires MisrError.h, MisrProjParam.h, MisrUtil.h):
include(JMtk15_src * "include/MisrFileQuery_h.jl")
# -----------------------------------------------------------------------------
# MisrMapQuery.h C file (requires MisrError.h, MisrProjParam.h, MisrUtil.h):
include(JMtk15_src * "include/MisrMapQuery_h.jl")
# -----------------------------------------------------------------------------
# MisrSetRegion.h C file (requires MisrError.h, MisrProjParam.h, MisrMapQuery.h):
include(JMtk15_src * "include/MisrSetRegion_h.jl")
# -----------------------------------------------------------------------------
# MisrOrbitPath.h C file (requires MisrError.h, MisrSetRegion.h):
include(JMtk15_src * "include/MisrOrbitPath_h.jl")
# -----------------------------------------------------------------------------
# MisrCoordQuery.h C file (requires MisrError.h, MisrProjParam.h,
#   MisrFileQuery.h, MisrSetRegion.h):
include(JMtk15_src * "include/MisrCoordQuery_h.jl")
# -----------------------------------------------------------------------------
# MisrReadData.h C file (requires MisrError.h, MisrUtil.h, MisrSetRegion.h),
#   but does not contain any definition that needs translating in Julia.
# MisrCache.h C file (requires MisrError.h, MisrProjParam.h, MisrUtil.h,
#   MisrReadData.h):
include(JMtk15_src * "include/MisrCache_h.jl")
# -----------------------------------------------------------------------------
# MisrWriteData.h C file (requires MisrError.h, MisrUtil.h, MisrMapQuery.h),
#   but does not contain any definition that needs translating in Julia.
# -----------------------------------------------------------------------------
# MisrReProject.h C file (requires MisrError.h, MisrProjParam.h, MisrMapQuery.h),
#   but does not contain any definition that needs translating in Julia.
# -----------------------------------------------------------------------------
# MisrRegression.h C file (requires MisrError.h, MisrProjParam.h, MisrUtil.h,
#    MisrMapQuery.h):
include(JMtk15_src * "include/MisrRegression_h.jl")
# -----------------------------------------------------------------------------
# MisrToolkit.h files (requires MisrUtil.h, MisrUnitConv.h, MisrFileQuery.h,
#    MisrMapQuery.h, MisrSetRegion.h, MisrOrbitPath.h, MisrCoordQuery.h,
#    MisrReadData.h, MisrWriteData.h, MisrReProject.h, MisrRegression.h):
include(JMtk15_src * "include/MisrToolkit_h.jl")
# -----------------------------------------------------------------------------
# misrproj.h C file
# Note: It is unclear whether this file (misrproj_h.jl) needs to be included.
#    In particular, it also defines NBLOCK, which causes problems because that
#    constant was already defined in MisrProjParam_h.jl.
# include(JMtk15_src * "include/misrproj_h.jl")
# =============================================================================
# Util functions:
include(JMtk15_src * "jMtkVersion.jl")
export jMtkVersion
include(JMtk15_src * "jMtkErrorMessage.jl")
export jMtkErrorMessage
include(JMtk15_src * "jMtkDateTimeToJulian.jl")
export jMtkDateTimeToJulian
include(JMtk15_src * "jMtkJulianToDateTime.jl")
export jMtkJulianToDateTime
# -----------------------------------------------------------------------------
# FileQuery functions:
include(JMtk15_src * "jMtkFileType.jl")
export jMtkFileType
include(JMtk15_src * "jMtkFileLGID.jl")
export jMtkFileLGID
include(JMtk15_src * "jMtkFileVersion.jl")
export jMtkFileVersion

# -----------------------------------------------------------------------------


end
