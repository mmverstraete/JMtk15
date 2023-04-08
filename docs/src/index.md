```@meta
CurrentModule = JMtk15
```

# JMtk15 Package Documentation

Welcome to [JMtk15](https://github.com/Michel Verstraete/JMtk15.jl), a Julia language package to leverage the NASA JPL MISR Toolkit (Mtk) C shared library [Version 1.5], which is a convenient and simplified programming interface to access MISR L1B2, L2, and MISR-HR, conventional and ancillary data products.

The Multi-angle Imaging SpectroRadiometer (MISR) instrument is one of five instruments aboard NASA's Earth Observation Terra satellite launched on 18 December 1999. MISR has been collecting data on the causes and effects of climate change in the atmosphere and at the planetary surface every day since 24 February 2000, and is expected to continue operating until early 2027. A wide range of geophysical products are available on a per-orbit basis at spatial resoultions varying between 275 m and 17.6 km, depending on the product. Higher-level products with a global coverage and at coarser spatial resolution are also available.

Detailed information on the scientific context of this project is available on-line from:

* the [NASA Terra mission](https://terra.nasa.gov/about/mission),
* the [MISR instrument](https://misr.jpl.nasa.gov/), which includes a complete bibliography of thousands of published papers and reports,
* the [NASA Atmospheric Science Data Center](https://asdc.larc.nasa.gov/project/MISR), and
* the [MISR Toolkit](https://github.com/nasa/MISR-Toolkit).

## Package status and acknowledgments

The Julia functions described below are wrappers to a selection of some of the most useful C functions of Mtk. They are currently under active development and are expected to work as described in the associated tests and documentation, but they are provided under the MIT License, i.e., without any warranty about the their usability or effectiveness in your own applications. See the LICENSE file in this repository for more details.

Generating this package would not have been possible without the professional help of Sebastian Val at JPL concerning Mtk and the benevolent support of @Gnimuc, @stevengj as well as many other contributors with respect to the Julia implementation.

Please check this site regularly for updates and send me bug reports and suggestions through GitHub: I will attempt to address those in future releases, time permitting.

## Pre-requisites and Installation

The effective use of this `JMtk15` package requires access to the following resources:

* the Mtk shared library `libMisrToolkit.so.1.5.0`,
* a set of third party libraries supporting HDF and NetCDF file formats, as well as additional utilities, and
* MISR data files, as appropriate.

The Mtk and third party libraries can be installed on Intel `x86_32` or `x86_64` platforms as explained on the MISR Toolkit web site mentioned above. As of March 2023, the simplest approach to use this `JMtk15` package on an Apple `aarch_64` macBook equipped with a M1 or M2 chip is to port an existing working installation from an Intel-based platform and run under the `Rosetta 2` environment: All that is required is to copy the `Mtk` and `/usr/local/hdfeoslibs` directories in exactly the same locations on the Mx platform, and to use the `x86_64` version of Julia (see the [juliaup](https://github.com/JuliaLang/juliaup) for more details on installing multiple versions of Julia). Platform-specific libraries for the `aarch_64` architecture may be developed at a later stage.

MISR data are accessible from the ASDC web site mentioned above.

Once those libraries and data files have been installed, edit the main module file `JMtk15.jl` to point to the Mtk library and the data directory. Look for the `Package configuration` section near the top of that file.

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
jMtkFileCoreMetaDataGet
jMtkFileCoreMetaDataQuery
jMtkMakeFilename
jMtkFindFileList
jMtkFileBlockMetaList
jMtkFileBlockMetaFieldList
jMtkFileBlockMetaFieldRead
jMtkTimeMetaRead
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
jMtkCreateLatLon
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
