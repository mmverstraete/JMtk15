"""
    resolution = jMtkFileGridToResolution_tst_1100()

# Purpose:
Generate the output of `jMtkFileGridToResolution` for testing purposes. Test 1100: For a MISR `GRP_ELLIPSOID_GM` file.

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
IDL> filename = root + 'MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf'
IDL> gridname = 'RedBand'
IDL> status = MTK_FILE_GRID_TO_RESOLUTION(filename, gridname, resolution)
IDL> PRINT, resolution
         275
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToResolution_tst_1100.jl")
jMtkFileGridToResolution_tst_1100

julia> resolution = jMtkFileGridToResolution_tst_1100();

julia> @test resolution == 275
Test Passed
```
"""
function jMtkFileGridToResolution_tst_1100()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf"
    gridname = "RedBand"
    resolution = jMtkFileGridToResolution(filename, gridname)
    return resolution
end
