# JMtk15

[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

Welcome to [JMtk15](https://github.com/mmverstraete/JMtk15.jl), a Julia language package to leverage the NASA JPL MISR Toolkit (Mtk) C shared library [Version 1.5], a convenient and simplified programming interface to access MISR L1B2, L2, L3, and MISR-HR, conventional and ancillary data products.

All functions and files published as part of this `JMtk15` package are provided under the MIT License, i.e., without any warranty about their usability or effectiveness in your own applications. See the LICENSE file in this repository for more details. The C shared library `Mtk` itself is available under an [open source license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE), and so are the following public libraries required by Mtk: HDF-EOS2.18v1.00, HDF4.2.10, hdf5-1.8.16, netcdf-4.4.0, jpegsrc.v6b, zlib-1.2.5, and NumPy 1.15 or later, as described in the Mtk [README](https://github.com/nasa/MISR-Toolkit/blob/master/README) file.

Please read the [JMtk15 Package Documentation](https://mmverstraete.github.io/JMtk15/dev/) for detailed information on installing this package and its dependencies, and check the test files for additional hints and examples on the use of these functions.
