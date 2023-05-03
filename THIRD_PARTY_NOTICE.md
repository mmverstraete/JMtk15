# Third Party Notice

This `JMtk15` package relies on the NASA JPL MISR Toolkit (Mtk) C shared library `libMisrToolkit.so.1.5.0`, which is available under an [open source license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).

That C shared library `Mtk`, in turn, relies on the following publicly available libraries:

* [HDF-EOS2.18v1.00](https://observer.gsfc.nasa.gov/ftp/edhs/hdfeos/previous_releases)
* [HDF4.2.10](https://support.hdfgroup.org/ftp/HDF/releases/HDF4.2.10/src)
* [hdf5-1.8.16](https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8/hdf5-1.8.16/src)
* [netcdf-4.4.0](ftp://ftp.unidata.ucar.edu/pub/netcdf/)
* [jpegsrc.v6b](https://observer.gsfc.nasa.gov/ftp/edhs/hdfeos/previous_releases)
* [zlib-1.2.5](https://observer.gsfc.nasa.gov/ftp/edhs/hdfeos/previous_releases)

as described in `Mtk`'s [README](https://github.com/nasa/MISR-Toolkit/blob/master/README) file. Those third party libraries are automatically installed when `Mtk` is installed locally.
