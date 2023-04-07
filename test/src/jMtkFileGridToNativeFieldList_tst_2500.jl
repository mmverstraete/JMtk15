"""
    nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_2500()

# Purpose:
Generate the output of `jMtkFileGridToNativeFieldList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> filename = root + 'MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc'
IDL> gridname = '4.4_KM_PRODUCTS'
IDL> status = MTK_FILE_GRID_TO_NATIVE_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
          24
IDL> PRINT, fieldlist
X_Dim Y_Dim Block_Number Block_Start_X_Index Block_Start_Y_Index Time Camera_Dim
    Band_Dim Mixture_Dim Latitude Longitude Elevation Normalized_Black_Surface_Irradiance
    Normalized_Black_Surface_Irradiance_Uncertainty Bottom_Of_Atmosphere_Bihemispherical_Albedo
    Bottom_Of_Atmosphere_Bihemispherical_Albedo_Uncertainty
    AUXILIARY/Smoothed_Aerosol_Optical_Depth_Per_Mixture AUXILIARY/Smoothed_Aerosol_Optical_Depth
    GEOMETRY/Solar_Zenith_Angle GEOMETRY/Solar_Azimuth_Angle GEOMETRY/View_Zenith_Angle
    GEOMETRY/View_Azimuth_Angle GEOMETRY/Scattering_Angle GEOMETRY/Glint_Angle
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_2500.jl")
jMtkFileGridToNativeFieldList_tst_2500

julia> nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_2500();

julia> @test nfields == 24
Test Passed

julia> @test fieldlist[1:4] == ["X_Dim", "Y_Dim", "Block_Number", "Block_Start_X_Index"]
Test Passed

julia> @test fieldlist[10:13] == ["Latitude", "Longitude", "Elevation", "Normalized_Black_Surface_Irradiance"]
Test Passed

julia> @test fieldlist[21:24] == ["GEOMETRY/View_Zenith_Angle", "GEOMETRY/View_Azimuth_Angle", "GEOMETRY/Scattering_Angle", "GEOMETRY/Glint_Angle"]
Test Passed
```
"""
function jMtkFileGridToNativeFieldList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "4.4_KM_PRODUCTS"
    nfields, fieldlist = jMtkFileGridToNativeFieldList(filename, gridname);
    return nfields, fieldlist
end
