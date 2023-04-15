```@meta
CurrentModule = JMtk15
```

# JMtk15 Package Documentation

Welcome to [JMtk15](https://github.com/mmverstraete/JMtk15.jl), a Julia language package to leverage the NASA JPL MISR Toolkit (Mtk) C shared library [Version 1.5], a convenient and simplified programming interface to access MISR L1B2, L2, and MISR-HR, conventional and ancillary data products.

The Multi-angle Imaging SpectroRadiometer (MISR) instrument is one of five instruments aboard NASA's Earth Observation Terra satellite launched on 18 December 1999. MISR has been collecting data on the causes and effects of climate change in the atmosphere and at the planetary surface every day since 24 February 2000, and is expected to continue operating until early 2027. A wide range of geophysical products are available on a per-orbit basis at spatial resolutions varying between 275 m and 17.6 km, depending on the product. Higher-level (L3) products with a global coverage and at coarser spatial resolution are also available.

Detailed information on the scientific context of this project is available on-line from:

* the [NASA Terra mission](https://terra.nasa.gov/about/mission),
* the [MISR instrument](https://misr.jpl.nasa.gov/), including a complete bibliography of thousands of published papers and reports,
* the [NASA Atmospheric Science Data Center](https://asdc.larc.nasa.gov/project/MISR), and
* the [MISR Toolkit](https://github.com/nasa/MISR-Toolkit).

## Package status and Acknowledgments

The Julia functions located in the `src` subdirectory of this `JMtk15` package are Julia wrappers to a selection of some of the most useful C functions of `Mtk`. This is Work in Progress (WIP): there are more functions in the `Mtk` library; additional wrapper functions will be added later, time permitting.

The `test` and `doc` subdirectories contain test functions and documentation for those wrapper functions, respectively.

All functions and files published as part of this `JMtk15` package are provided under the MIT License, i.e., without any warranty about the their usability or effectiveness in your own applications. See the LICENSE file in this repository for more details.

Generating this package would not have been possible without the professional help of Sebastian Val at JPL concerning MISR Toolkit (`Mtk`) and the benevolent and patient support of `@Gnimuc`, `@stevengj`, `@mkitti`, `@kellertuer` as well as many other contributors to the [Julia Discourse Forum](https://discourse.julialang.org/) with respect to the Julia implementation.

Please check this site regularly for updates and send bug reports or suggestions through GitHub: I will attempt to address those in future releases, time permitting.

## Pre-requisites and Installation

The effective use of this `JMtk15` package requires access to the following resources:

* the `Mtk` shared library `libMisrToolkit.so.1.5.0`,
* a set of third party libraries supporting HDF and NetCDF file formats, as well as additional utilities, and
* MISR data files, as appropriate.

The `Mtk` and third party libraries can be installed on Intel `x86_32` or `x86_64` Linux, macOS, or Windows platforms as explained on the MISR Toolkit web site mentioned above. As of March 2023, the simplest approach to use this `JMtk15` package on an Apple `aarch_64` MacBook equipped with a M1 or M2 chip is to port an existing working installation from an Intel-based platform and run under the `Rosetta 2` environment: All that is required is to copy the `Mtk` and `/usr/local/hdfeoslibs` directories in exactly the same locations on the Mx platform, and to use the `x86_64` version of Julia (see the [juliaup](https://github.com/JuliaLang/juliaup) for more details on installing multiple versions of Julia). Platform-specific libraries for the `aarch_64` architecture may be developed at a later stage.

MISR data are freely accessible from the NASA ASDC web site mentioned above.

Once those libraries and data files are set up, install this `JMtk15` package and edit the `Package configuration` section near the top of the main module file `JMtk15.jl` to point to the `Mtk` shared library and the MISR data directory.

## Index of functions

```@index
```

## Main module

```@docs
JMtk15
```

## Util

```@docs
jMtkVersion
jMtkErrorMessage
jMtkDateTimeToJulian
jMtkJulianToDateTime
```

## FileQuery

```@docs
jMtkFileType
jMtkFileLGID
jMtkFileVersion
jMtkFillValueGet
jMtkFileAttrList
jMtkFileAttrGet
jMtkGridAttrList
jMtkGridAttrGet
jMtkFieldAttrList
jMtkFieldAttrGet
jMtkFileToPath
jMtkFileToOrbit
jMtkFileToBlockRange
jMtkFileToGridList
jMtkFileGridToFieldList
jMtkFileGridToNativeFieldList
jMtkFileGridFieldToDimList
jMtkFileGridFieldCheck
jMtkFileGridFieldToDataType
jMtkFileGridToResolution
jMtkFileCoreMetaDataQuery
jMtkMakeFilename
jMtkFindFileList
jMtkFileBlockMetaList
jMtkFileBlockMetaFieldList
```

## UnitConv

```@docs
jMtkDdToDegMinSec
jMtkDdToDms
jMtkDdToRad
jMtkDegMinSecToDd
jMtkDegMinSecToDms
jMtkDegMinSecToRad
jMtkDmsToDd
jMtkDmsToDegMinSec
jMtkDmsToRad
jMtkRadToDd
jMtkRadToDegMinSec
jMtkRadToDms
```

## CoordQuery

```@docs
jMtkBlsToLatLon
jMtkBlsToSomXY
jMtkLatLonToBls
jMtkSomXYToBls
jMtkSomXYToLatLon
jMtkPathToProjParam
jMtkPathBlockRangeToBlockCorners
```

## MapQuery

```@docs
jMtkLSToLatLon
jMtkLSToSomXY
jMtkLatLonToLS
jMtkSomXYToLS
```

## OrbitPath

```@docs
jMtkLatLonToPathList
jMtkRegionToPathList
jMtkRegionPathToBlockRange
jMtkOrbitToPath
jMtkTimeToOrbitPath
jMtkTimeRangeToOrbitList
jMtkPathTimeRangeToOrbitList
jMtkOrbitToTimeRange
```

## SetRegion

```@docs
jMtkSetRegionByPathBlockRange
jMtkSetRegionByUlcLrc
jMtkSetRegionByLatLonExtent
jMtkSetRegionByPathSomUlcLrc
jMtkSnapToGrid
```

## ReadData

```@docs
jMtkReadData
```
