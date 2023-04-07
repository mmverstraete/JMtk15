using JMtk15
using Test

# ==========================================================================================
@testset "JMtk15.jl" begin
    @testset "Util" begin
# ---------------------------------------------------------- jMtkVersion
        include(JMtk15_test * "src/jMtkVersion_tst_0000.jl")
        @test jMtkVersion_tst_0000() == "1.5.0"
# ---------------------------------------------------------- jMtkErrorMessage
        include(JMtk15_test * "src/jMtkErrorMessage_tst_0000.jl")
        errmsg = jMtkErrorMessage_tst_0000();
        @test errmsg == "SUCCESS"

        include(JMtk15_test * "src/jMtkErrorMessage_tst_0010.jl")
        errmsg = jMtkErrorMessage_tst_0010();
        @test errmsg == "MALLOC FAILED"

        include(JMtk15_test * "src/jMtkErrorMessage_tst_0018.jl")
        errmsg = jMtkErrorMessage_tst_0018();
        @test errmsg == "MISR FORWARD PROJECTION FAILED"

        include(JMtk15_test * "src/jMtkErrorMessage_tst_0074.jl")
        errmsg = jMtkErrorMessage_tst_0074();
        @test errmsg == "INVALID ERROR CODE"
        # -------------------------------------------------- jMtkDateTimeToJulian
        include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_0001.jl")
        juldate = jMtkDateTimeToJulian_tst_0001();
        @test (juldate - 2452396.58333) < 0.0001

        include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_0002.jl")
        juldate = jMtkDateTimeToJulian_tst_0002();
        @test (juldate - 2452396.58333) < 0.0001

        include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_0003.jl")
        juldate = jMtkDateTimeToJulian_tst_0003();
        @test (juldate - 2453728.27312) < 0.0001
# ---------------------------------------------------------- jMtkJulianToDateTime
        include(JMtk15_test * "src/jMtkJulianToDateTime_tst_0001.jl")
        datetime = jMtkJulianToDateTime_tst_0001();
        @test datetime == "2002-05-02T02:00:00Z"

        include(JMtk15_test * "src/jMtkJulianToDateTime_tst_0002.jl")
        datetime = jMtkJulianToDateTime_tst_0002();
        @test datetime == "2022-06-13T12:15:18Z"
    end
# ==========================================================================================
    @testset "FileQuery" begin
# ---------------------------------------------------------- jMtkFileType
        include(JMtk15_test * "src/jMtkFileType_tst_0100.jl")
        filetype = jMtkFileType_tst_0100();
        @test filetype == "AGP"

        include(JMtk15_test * "src/jMtkFileType_tst_1000.jl")
        filetype = jMtkFileType_tst_1000();
        @test filetype == "GP_GMP"

        include(JMtk15_test * "src/jMtkFileType_tst_1100.jl")
        filetype = jMtkFileType_tst_1100();
        @test filetype == "GRP_ELLIPSOID_GM"

        include(JMtk15_test * "src/jMtkFileType_tst_1300.jl")
        filetype = jMtkFileType_tst_1300();
        @test filetype == "GRP_TERRAIN_GM"

        include(JMtk15_test * "src/jMtkFileType_tst_1500.jl")
        filetype = jMtkFileType_tst_1500();
        @test filetype == "GRP_RCCM"

        include(JMtk15_test * "src/jMtkFileType_tst_2100.jl")
        filetype = jMtkFileType_tst_2100();
        @test filetype == "TC_CLASSIFIERS"

        include(JMtk15_test * "src/jMtkFileType_tst_2300.jl")
        filetype = jMtkFileType_tst_2300();
        @test filetype == "TC_CLOUD"

        include(JMtk15_test * "src/jMtkFileType_tst_2400.jl")
        filetype = jMtkFileType_tst_2400();
        @test filetype == "AS_AEROSOL"

        include(JMtk15_test * "src/jMtkFileType_tst_2500.jl")
        filetype = jMtkFileType_tst_2500();
        @test filetype == "AS_LAND"
    # ------------------------------------------------------ jMtkFileLGID
        include(JMtk15_test * "src/jMtkFileLGID_tst_0100.jl")
        lgid = jMtkFileLGID_tst_0100();
        @test lgid == "MISR_AM1_AGP_P168_F01_24.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_1000.jl")
        lgid = jMtkFileLGID_tst_1000();
        @test lgid == "MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_1100.jl")
        lgid = jMtkFileLGID_tst_1100();
        @test lgid == "MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_1300.jl")
        lgid = jMtkFileLGID_tst_1300();
        @test lgid == "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_1500.jl")
        lgid = jMtkFileLGID_tst_1500();
        @test lgid == "MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_2100.jl")
        lgid = jMtkFileLGID_tst_2100();
        @test lgid == "MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_2300.jl")
        lgid = jMtkFileLGID_tst_2300();
        @test lgid == "MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_2400.jl")
        lgid = jMtkFileLGID_tst_2400();
        @test lgid == "MISR_AM1_AS_AEROSOL_P168_O068050_F13_0023.nc"

        include(JMtk15_test * "src/jMtkFileLGID_tst_2500.jl")
        lgid = jMtkFileLGID_tst_2500();
        @test lgid == "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
# ---------------------------------------------------------- jMtkFileVersion
        include(JMtk15_test * "src/jMtkFileVersion_tst_0100.jl")
        fversion = jMtkFileVersion_tst_0100();
        @test fversion == "F01_24"

        include(JMtk15_test * "src/jMtkFileVersion_tst_1000.jl")
        fversion = jMtkFileVersion_tst_1000();
        @test fversion == "F03_0013"

        include(JMtk15_test * "src/jMtkFileVersion_tst_1100.jl")
        fversion = jMtkFileVersion_tst_1100();
        @test fversion == "F03_0024"

        include(JMtk15_test * "src/jMtkFileVersion_tst_1300.jl")
        fversion = jMtkFileVersion_tst_1300();
        @test fversion == "F03_0024"

        include(JMtk15_test * "src/jMtkFileVersion_tst_1500.jl")
        fversion = jMtkFileVersion_tst_1500();
        @test fversion == "F04_0025"

        include(JMtk15_test * "src/jMtkFileVersion_tst_2100.jl")
        fversion = jMtkFileVersion_tst_2100();
        @test fversion == "F07_0012"

        include(JMtk15_test * "src/jMtkFileVersion_tst_2300.jl")
        fversion = jMtkFileVersion_tst_2300();
        @test fversion == "F01_0001"

        include(JMtk15_test * "src/jMtkFileVersion_tst_2400.jl")
        fversion = jMtkFileVersion_tst_2400();
        @test fversion == "F13_0023"

        include(JMtk15_test * "src/jMtkFileVersion_tst_2500.jl")
        fversion = jMtkFileVersion_tst_2500();
        @test fversion == "F08_0023"
# ---------------------------------------------------------- jMtkFileAttrList
        include(JMtk15_test * "src/jMtkFileAttrList_tst_0100.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_0100();
        @test attrcnt == 28
        @test attrlist[1:4] == ["StructMetadata.0", "Translation.number_id", "Translation.land_water_id", "Translation.dark_water_mask"]
        @test attrlist[16:19] == ["SOM_parameters.som_orbit.gama", "SOM_parameters.som_orbit.nrev", "SOM_parameters.som_orbit.ro", "SOM_parameters.som_orbit.i"]
        @test attrlist[25:28] == ["Origin_block.lrc.y", "Start_block", "End block", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_1000.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_1000();
        @test attrcnt == 30
        @test attrlist[1:4] == ["HDFEOSVersion", "StructMetadata.0", "coremetadata", "Path_number"]
        @test attrlist[18:21] == ["SOM_parameters.som_orbit.i", "SOM_parameters.som_orbit.P2P1", "SOM_parameters.som_orbit.lambda0", "Origin_block.ulc.x"]
        @test attrlist[27:30] == ["Cam_mode", "Num_local_modes", "Local_mode_site_name", "Orbit_QA"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_1100.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_1100();
        @test attrcnt == 31
        @test attrlist[4:7] == ["AGP_version_id", "DID_version_id", "Number_blocks", "Ocean_blocks_size"]
        @test attrlist[19:22] == ["SOM_parameters.som_orbit.lambda0", "Origin_block.ulc.x", "Origin_block.ulc.y", "Origin_block.lrc.x"]
        @test attrlist[28:31] == ["Local_mode_site_name", "Orbit_QA", "Camera", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_1300.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_1300();
        @test attrcnt == 31
        @test attrlist[6:9] == ["Number_blocks", "Ocean_blocks_size", "Ocean_blocks.count", "Ocean_blocks.numbers"]
        @test attrlist[16:19] == ["SOM_parameters.som_orbit.ro", "SOM_parameters.som_orbit.i", "SOM_parameters.som_orbit.P2P1", "SOM_parameters.som_orbit.lambda0"]
        @test attrlist[27:30] == ["Num_local_modes", "Local_mode_site_name", "Orbit_QA", "Camera"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_1500.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_1500();
        @test attrcnt == 31
        @test attrlist[3:6] == ["Path_number", "AGP_version_id", "DID_version_id", "Number_blocks"]
        @test attrlist[20:23] == ["Origin_block.ulc.x", "Origin_block.ulc.y", "Origin_block.lrc.x", "Origin_block.lrc.y"]
        @test attrlist[28:31] == ["Local_mode_site_name", "Orbit_QA", "Camera", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_2100.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_2100();
        @test attrcnt == 30
        @test attrlist[8:11] == ["Ocean_blocks.count", "Ocean_blocks.numbers", "SOM_parameters.som_ellipsoid.a", "SOM_parameters.som_ellipsoid.e2"]
        @test attrlist[21:24] == ["Origin_block.ulc.y", "Origin_block.lrc.x", "Origin_block.lrc.y", "Start_block"]
        @test attrlist[27:30] == ["Num_local_modes", "Local_mode_site_name", "Orbit_QA", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_2400.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_2400();
        @test attrcnt == 144
        @test attrlist[1:3] == ["Path_number", "AGP_version_id", "DID_version_id"]
        @test attrlist[25] == "SOM_map_maximum_corner.y"
        @test attrlist[130] == "config.het_bias_pixel_mode"
        @test attrlist[144] == "config.GeographicExclusions.latitude.0"

        include(JMtk15_test * "src/jMtkFileAttrList_tst_2500.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_2500();
        @test attrcnt == 88
        @test attrlist[1:5] == ["Path_number", "AGP_version_id", "DID_version_id", "Number_blocks", "Ocean_blocks_size"]
        @test attrlist[41:45] == ["title", "institution", "source", "history", "references"]
        @test attrlist[85:88] == ["config.sim.enable", "config.sim.surface_type", "config.SurfaceRetrieval.use_smoothed_aod", "config.underlight_albedo"]
# ---------------------------------------------------------- jMtkGridAttrList
        include(JMtk15_test * "src/jMtkGridAttrList_tst_0100.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_0100();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_1000.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_1000();
        @test nattrs == 5
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y", "SunDistanceAU"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_1100.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_1100();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_1300.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_1300();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_1500.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_1500();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_2100.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_2100();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_2300.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_2300();
        @test nattrs == 6
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y", "MISRReferenceCamera", "MISRCameras"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_2500.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_2500();
        @test nattrs == 4
        @test attrlist == ["GCTP_projection_parameters", "resolution_in_meters", "block_size_in_lines", "block_size_in_samples"]
# ---------------------------------------------------------- jMtkFieldAttrList
        include(JMtk15_test * "src/jMtkFieldAttrList_tst_0100.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_0100();
        @test nattrs == 0
        @test attrlist == String[]

        include(JMtk15_test * "src/jMtkFieldAttrList_tst_1000.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_1000();
        @test nattrs == 1
        @test attrlist == ["_FillValue"]

        include(JMtk15_test * "src/jMtkFieldAttrList_tst_1100.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_1100();
        @test nattrs == 1
        @test attrlist == ["_FillValue"]

        include(JMtk15_test * "src/jMtkFieldAttrList_tst_1300.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_1300();
        @test nattrs == 1
        @test attrlist == ["_FillValue"]

        include(JMtk15_test * "src/jMtkFieldAttrList_tst_1500.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_1500();
        @test nattrs == 1
        @test attrlist == ["_FillValue"]

        include(JMtk15_test * "src/jMtkFieldAttrList_tst_2300.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_2300();
        @test nattrs == 1
        @test attrlist == ["_FillValue"]

        include(JMtk15_test * "src/jMtkFieldAttrList_tst_2500.jl")
        nattrs, attrlist = jMtkFieldAttrList_tst_2500();
        @test nattrs == 5
        @test attrlist == ["_FillValue", "coordinates", "units", "standard_name", "long_name"]
# ---------------------------------------------------------- jMtkFileToPath
        include(JMtk15_test * "src/jMtkFileToPath_tst_0100.jl")
        path = jMtkFileToPath_tst_0100();
        @test path == 168

        include(JMtk15_test * "src/jMtkFileToPath_tst_1000.jl")
        path = jMtkFileToPath_tst_1000();
        @test path == 168

        include(JMtk15_test * "src/jMtkFileToPath_tst_1100.jl")
        path = jMtkFileToPath_tst_1100();
        @test path == 168

        include(JMtk15_test * "src/jMtkFileToPath_tst_1300.jl")
        path = jMtkFileToPath_tst_1300();
        @test path == 168

        include(JMtk15_test * "src/jMtkFileToPath_tst_1500.jl")
        path = jMtkFileToPath_tst_1500();
        @test path == 168

        include(JMtk15_test * "src/jMtkFileToPath_tst_2300.jl")
        path = jMtkFileToPath_tst_2300();
        @test path == 168

        include(JMtk15_test * "src/jMtkFileToPath_tst_2500.jl")
        path = jMtkFileToPath_tst_2500();
        @test path == 168
# ---------------------------------------------------------- jMtkFileToOrbit
# Note: Function jMtkFileToOrbit generates error conditions for AGP files because their filenames do not include orbit data.
        include(JMtk15_test * "src/jMtkFileToOrbit_tst_1000.jl")
        orbit = jMtkFileToOrbit_tst_1000();
        @test orbit == 68050

        include(JMtk15_test * "src/jMtkFileToOrbit_tst_1100.jl")
        orbit = jMtkFileToOrbit_tst_1100();
        @test orbit == 68050

        include(JMtk15_test * "src/jMtkFileToOrbit_tst_1300.jl")
        orbit = jMtkFileToOrbit_tst_1300();
        @test orbit == 68050

        include(JMtk15_test * "src/jMtkFileToOrbit_tst_1500.jl")
        orbit = jMtkFileToOrbit_tst_1500();
        @test orbit == 68050

        include(JMtk15_test * "src/jMtkFileToOrbit_tst_2300.jl")
        orbit = jMtkFileToOrbit_tst_2300();
        @test orbit == 68050

        include(JMtk15_test * "src/jMtkFileToOrbit_tst_2500.jl")
        orbit = jMtkFileToOrbit_tst_2500();
        @test orbit == 68050

# ---------------------------------------------------------- jMtkFileToBlockRange
        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_0100.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_0100();
        @test (start_block, end_block) == (1, 180)

        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_1000.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_1000();
        @test (start_block, end_block) == (19, 164)

        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_1100.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_1100();
        @test (start_block, end_block) == (19, 162)

        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_1300.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_1300();
        @test (start_block, end_block) == (19, 162)

        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_1500.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_1500();
        @test (start_block, end_block) == (19, 162)

        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_2300.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_2300();
        @test (start_block, end_block) == (19, 162)

        include(JMtk15_test * "src/jMtkFileToBlockRange_tst_2500.jl")
        start_block, end_block = jMtkFileToBlockRange_tst_2500();
        @test (start_block, end_block) == (29, 154)
# ---------------------------------------------------------- jMtkFileToGridList
        include(JMtk15_test * "src/jMtkFileToGridList_tst_0100.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_0100();
        @test ngrids == 2
        @test gridlist == ["Standard", "Regional"]

        include(JMtk15_test * "src/jMtkFileToGridList_tst_1000.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_1000();
        @test ngrids == 1
        @test gridlist == ["GeometricParameters"]

        include(JMtk15_test * "src/jMtkFileToGridList_tst_1100.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_1100();
        @test ngrids == 6
        @test gridlist == ["BlueBand", "GreenBand", "RedBand", "NIRBand", "BRF Conversion Factors", "GeometricParameters"]

        include(JMtk15_test * "src/jMtkFileToGridList_tst_1300.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_1300();
        @test ngrids == 6
        @test gridlist == ["BlueBand", "GreenBand", "RedBand", "NIRBand", "BRF Conversion Factors", "GeometricParameters"]

        include(JMtk15_test * "src/jMtkFileToGridList_tst_1500.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_1500();
        @test ngrids == 1
        @test gridlist == ["RCCM"]

        include(JMtk15_test * "src/jMtkFileToGridList_tst_2300.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_2300();
        @test ngrids == 3
        @test gridlist == ["Motion_17.6_km", "Stereo_WithoutWindCorrection_1.1_km", "Stereo_1.1_km"]

        include(JMtk15_test * "src/jMtkFileToGridList_tst_2500.jl")
        ngrids, gridlist = jMtkFileToGridList_tst_2500();
        @test ngrids == 2
        @test gridlist == ["4.4_KM_PRODUCTS", "1.1_KM_PRODUCTS"]
# ---------------------------------------------------------- jMtkFileGridToFieldList
        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_0100.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_0100();
        @test nfields == 9
        @test fieldlist == ["AveSceneElev", "StdDevSceneElev", "StdDevSceneElevRelSlp", "PtElev", "GeoLatitude", "GeoLongitude", "SurfaceFeatureID", "AveSurfNormAzAng", "AveSurfNormZenAng"]

        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1000.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_1000();
        @test nfields == 38
        @test fieldlist[1:5] == ["SolarAzimuth", "SolarZenith", "DfAzimuth", "DfZenith", "DfScatter"]
        @test fieldlist[11:15] == ["BfAzimuth", "BfZenith", "BfScatter", "BfGlitter", "AfAzimuth"]
        @test fieldlist[34:38] == ["CaGlitter", "DaAzimuth", "DaZenith", "DaScatter", "DaGlitter"]

        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1100.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_1100();
        @test nfields == 4
        @test fieldlist == ["BlueConversionFactor", "GreenConversionFactor", "RedConversionFactor", "NIRConversionFactor"]

        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1300.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_1300();
        @test nfields == 2
        @test fieldlist == ["SolarAzimuth", "SolarZenith"]

        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_1500.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_1500();
        @test nfields == 7
        @test fieldlist == ["Cloud", "Glitter", "Quality", "Dust_test", "First Observable", "Second Observable", "Dust Observable"]

        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_2300.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_2300();
        @test nfields == 7
        @test fieldlist == ["CloudTopHeight", "CloudMotionCrossTrack", "Raw CloudMotionCrossTrack", "CloudMotionCrossTrackHeading", "Raw CloudMotionCrossTrackHeading", "StereoDerivedCloudMask", "StereoQualityIndicator"]

        include(JMtk15_test * "src/jMtkFileGridToFieldList_tst_2500.jl")
        nfields, fieldlist = jMtkFileGridToFieldList_tst_2500();
        @test nfields == 39
        @test fieldlist[1:5] == ["X_Dim", "Y_Dim", "Block_Number", "Block_Start_X_Index", "Block_Start_Y_Index"]
        @test fieldlist[10:12] == ["Latitude", "Longitude", "Hemispherical_Directional_Reflectance_Factor"]
        @test fieldlist[20:22] == ["Leaf_Area_Index_Best_Estimate", "Leaf_Area_Index_Best_Estimate_QA", "Fractional_Absorbed_Photosynthetically_Active_Radiation_Best_Estimate"]
        @test fieldlist[34:35] == ["AUXILIARY/Mean_Leaf_Area_Index_Test_2", "AUXILIARY/Leaf_Area_Index_Merit_Function_Test_2"]
# ---------------------------------------------------------- jMtkFileGridToNativeFieldList
        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_0100.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_0100();
        @test nfields == 2
        @test fieldlist == ["RegAveSceneElev", "StdDevRegSceneElev"]

        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_1000.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_1000();
        @test nfields == 38
        @test fieldlist[2:6] == ["SolarZenith", "DfAzimuth", "DfZenith", "DfScatter", "DfGlitter"]
        @test fieldlist[12:16] == ["BfZenith", "BfScatter", "BfGlitter", "AfAzimuth", "AfZenith"]
        @test fieldlist[32:36] == ["CaZenith", "CaScatter", "CaGlitter", "DaAzimuth", "DaZenith"]

        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_1100.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_1100();
        @test nfields == 1
        @test fieldlist == ["Red Radiance/RDQI"]

        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_1300.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_1300();
        @test nfields == 4
        @test fieldlist == ["BlueConversionFactor", "GreenConversionFactor", "RedConversionFactor", "NIRConversionFactor"]

        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_1500.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_1500();
        @test nfields == 7
        @test fieldlist == ["Cloud", "Glitter", "Quality", "Dust_test", "First Observable", "Second Observable", "Dust Observable"]

        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_2300.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_2300();
        @test nfields == 5
        @test fieldlist == ["CloudTopHeightOfMotion", "CloudMotionNorthward", "CloudMotionEastward", "MotionDerivedCloudMask", "MotionQualityIndicator"]

        include(JMtk15_test * "src/jMtkFileGridToNativeFieldList_tst_2500.jl")
        nfields, fieldlist = jMtkFileGridToNativeFieldList_tst_2500();
        @test nfields == 24
        @test fieldlist[1:4] == ["X_Dim", "Y_Dim", "Block_Number", "Block_Start_X_Index"]
        @test fieldlist[10:13] == ["Latitude", "Longitude", "Elevation", "Normalized_Black_Surface_Irradiance"]
        @test fieldlist[21:24] == ["GEOMETRY/View_Zenith_Angle", "GEOMETRY/View_Azimuth_Angle", "GEOMETRY/Scattering_Angle", "GEOMETRY/Glint_Angle"]
# ---------------------------------------------------------- jMtkFileGridFieldToDimList
        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_0100.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_0100();
        @test ndims == 0
        @test dimnames == String[]
        @test dimsizes == Int32[]

        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_1000.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_1000();
        @test ndims == 0
        @test dimnames == String[]
        @test dimsizes == Int32[]

        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_1100.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_1100();
        @test ndims == 0
        @test dimnames == String[]
        @test dimsizes == Int32[]

        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_1300.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_1300();
        @test ndims == 0
        @test dimnames == String[]
        @test dimsizes == Int32[]

        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_1500.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_1500();
        @test ndims == 0
        @test dimnames == String[]
        @test dimsizes == Int32[]

        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_2300.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_2300();
        @test ndims == 0
        @test dimnames == String[]
        @test dimsizes == Int32[]

        # The following test causes Julia to crash with the following error message:
        # julia(19310,0x2047052c0) malloc: *** error for object 0x6000030cb990: pointer being freed was not allocated
        # include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_2500.jl")
        # ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_2500();
        # @test ndims == 2
        # @test dimnames == ["Band_Dim", "Camera_Dim"]
        # @test dimsizes == [4, 9]








end
# =============================================================================



end