"""
    nfields, fieldlist = jMtkFileGridToFieldList_tst_2500()

# Purpose:
Generate the output of `jMtkFileGridToFieldList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> gridname = '1.1_KM_PRODUCTS'
IDL> status = MTK_FILE_GRID_TO_FIELDLIST(filename, gridname, nfields, fieldlist)
IDL> PRINT, nfields
          39
IDL> PRINT, fieldlist
X_Dim Y_Dim Block_Number Block_Start_X_Index Block_Start_Y_Index Time Camera_Dim
    Band_Dim Biome_Type_Dim Latitude Longitude Hemispherical_Directional_Reflectance_Factor
    Hemispherical_Directional_Reflectance_Factor_Uncertainty Bi-Hemispherical_Reflectance
    Bi-Hemispherical_Reflectance_Relative_Uncertainty Bidirectional_Reflectance_Factor
    Directional_Hemispherical_Reflectance Normalized_Difference_Vegetation_Index
    Biome_Best_Estimate Leaf_Area_Index_Best_Estimate Leaf_Area_Index_Best_Estimate_QA
    Fractional_Absorbed_Photosynthetically_Active_Radiation_Best_Estimate
    Photosynthetically_Active_Radiation_Integrated_Bi-Hemispherical_Reflectance
    Photosynthetically_Active_Radiation_Integrated_Directional_Hemispherical_Reflectance
    Leaf_Area_Index_QA AUXILIARY/BRF_HDRF_Interpolation_Flag AUXILIARY/mRPV_Model_r0
    AUXILIARY/mRPV_Model_k AUXILIARY/mRPV_Model_b AUXILIARY/mRPV_Model_Fit_Residual
    AUXILIARY/Mean_Leaf_Area_Index_Test_1 AUXILIARY/Leaf_Area_Index_Merit_Function_Test_1
    AUXILIARY/Number_Passing_LAI_Values_Test_1 AUXILIARY/Mean_Leaf_Area_Index_Test_2
    AUXILIARY/Leaf_Area_Index_Merit_Function_Test_2 AUXILIARY/Number_Passing_LAI_Values_Test_2
    AUXILIARY/Equivalent_Reflectance_Subregion_Variability AUXILIARY/AGP_Surface_Type
    AUXILIARY/Suitable_For_Surface_Retrieval
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_2500.jl")
jMtkFileGridToFieldList_tst_2500

julia> nfields, fieldlist = jMtkFileGridToFieldList_tst_2500();

julia> @test nfields == 39
Test Passed

julia> @test fieldlist[1:5] == ["X_Dim", "Y_Dim", "Block_Number", "Block_Start_X_Index", "Block_Start_Y_Index"]
Test Passed

julia> @test fieldlist[10:12] == ["Latitude", "Longitude", "Hemispherical_Directional_Reflectance_Factor"]
Test Passed

julia> @test fieldlist[20:22] == ["Leaf_Area_Index_Best_Estimate", "Leaf_Area_Index_Best_Estimate_QA", "Fractional_Absorbed_Photosynthetically_Active_Radiation_Best_Estimate"]
Test Passed

julia> @test fieldlist[34:35] == ["AUXILIARY/Mean_Leaf_Area_Index_Test_2", "AUXILIARY/Leaf_Area_Index_Merit_Function_Test_2"]
Test Passed
```
"""
function jMtkFileGridToFieldList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "1.1_KM_PRODUCTS"
    nfields, fieldlist = jMtkFileGridToFieldList(filename, gridname);
    return nfields, fieldlist
end
