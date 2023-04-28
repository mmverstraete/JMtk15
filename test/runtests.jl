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
# ---------------------------------------------------------- jMtkFillValueGet
# Note: MISR AGP files provide globally valid data, and thus do not feature fill data.

        include(JMtk15_test * "src/jMtkFillValueGet_tst_1000.jl")
        fillval = jMtkFillValueGet_tst_1000();
        @test fillval == -555.0

        include(JMtk15_test * "src/jMtkFillValueGet_tst_1100.jl")
        fillval = jMtkFillValueGet_tst_1100();
        @test fillval == 65515

        include(JMtk15_test * "src/jMtkFillValueGet_tst_1300.jl")
        fillval = jMtkFillValueGet_tst_1300();
        @test fillval == -555.0

        include(JMtk15_test * "src/jMtkFillValueGet_tst_1500.jl")
        fillval = jMtkFillValueGet_tst_1500();
        @test fillval == 255

        include(JMtk15_test * "src/jMtkFillValueGet_tst_2300.jl")
        fillval = jMtkFillValueGet_tst_2300();
        @test fillval == -9999.0

        include(JMtk15_test * "src/jMtkFillValueGet_tst_2500.jl")
        fillval = jMtkFillValueGet_tst_2500();
        @test fillval == 65533
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
# ---------------------------------------------------------- jMtkFileAttrGet
        include(JMtk15_test * "src/jMtkFileAttrGet_tst_0100.jl")
        attrval = jMtkFileAttrGet_tst_0100();
        @test attrval == 2

        include(JMtk15_test * "src/jMtkFileAttrGet_tst_1000.jl")
        attrval = jMtkFileAttrGet_tst_1000();
        @test attrval == 19

        include(JMtk15_test * "src/jMtkFileAttrGet_tst_1100.jl")
        attrval = jMtkFileAttrGet_tst_1100();
        @test attrval == 4

        include(JMtk15_test * "src/jMtkFileAttrGet_tst_1300.jl")
        attrval = jMtkFileAttrGet_tst_1300();
        @test attrval == 527450.0

        include(JMtk15_test * "src/jMtkFileAttrGet_tst_1500.jl")
        attrval = jMtkFileAttrGet_tst_1500();
        @test attrval == 6378137.0

        include(JMtk15_test * "src/jMtkFileAttrGet_tst_2300.jl")
        attrval = jMtkFileAttrGet_tst_2300();
        @test attrval == 1.7157253262878522

        include(JMtk15_test * "src/jMtkFileAttrGet_tst_2500.jl")
        attrval = jMtkFileAttrGet_tst_2500();
        @test attrval == 37.4519193181101
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
# ---------------------------------------------------------- jMtkGridAttrGet
        include(JMtk15_test * "src/jMtkGridAttrGet_tst_0100.jl")
        attrval = jMtkGridAttrGet_tst_0100();
        @test attrval == 1100

        include(JMtk15_test * "src/jMtkGridAttrGet_tst_1000.jl")
        attrval = jMtkGridAttrGet_tst_1000();
        @test attrval == 1.0004615223771693

        include(JMtk15_test * "src/jMtkGridAttrGet_tst_1100.jl")
        attrval = jMtkGridAttrGet_tst_1100();
        @test attrval == 275

        include(JMtk15_test * "src/jMtkGridAttrGet_tst_1300.jl")
        attrval = jMtkGridAttrGet_tst_1300();
        @test attrval == 128

        include(JMtk15_test * "src/jMtkGridAttrGet_tst_1500.jl")
        attrval = jMtkGridAttrGet_tst_1500();
        @test attrval == 512

        include(JMtk15_test * "src/jMtkGridAttrGet_tst_2300.jl")
        attrval = jMtkGridAttrGet_tst_2300();
        @test attrval == 1100

        include(JMtk15_test * "src/jMtkGridAttrGet_tst_2500.jl")
        attrval = jMtkGridAttrGet_tst_2500();
        @test attrval == 1100
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
# ---------------------------------------------------------- jMtkFieldAttrGet
# Note: The fields of a MISR AGP file do not feature any attributes.
        include(JMtk15_test * "src/jMtkFieldAttrGet_tst_1000.jl")
        attrval = jMtkFieldAttrGet_tst_1000();
        @test attrval == -555.0

        include(JMtk15_test * "src/jMtkFieldAttrGet_tst_1100.jl")
        attrval = jMtkFieldAttrGet_tst_1100();
        @test attrval == -555.0

        include(JMtk15_test * "src/jMtkFieldAttrGet_tst_1300.jl")
        attrval = jMtkFieldAttrGet_tst_1300();
        @test attrval == 65515

        include(JMtk15_test * "src/jMtkFieldAttrGet_tst_1500.jl")
        attrval = jMtkFieldAttrGet_tst_1500();
        @test attrval == 255

        include(JMtk15_test * "src/jMtkFieldAttrGet_tst_2300.jl")
        attrval = jMtkFieldAttrGet_tst_2300();
        @test attrval == -9999.0

        include(JMtk15_test * "src/jMtkFieldAttrGet_tst_2500.jl")
        attrval = jMtkFieldAttrGet_tst_2500();
        @test attrval == 0.007936508f0
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

        include(JMtk15_test * "src/jMtkFileGridFieldToDimList_tst_2500.jl")
        ndims, dimnames, dimsizes = jMtkFileGridFieldToDimList_tst_2500();
        @test ndims == 2
        @test dimnames == ["Band_Dim", "Camera_Dim"]
        @test dimsizes == [4, 9]
# ---------------------------------------------------------- jMtkFileGridFieldCheck
        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_0100.jl")
        status = jMtkFileGridFieldCheck_tst_0100();
        @test status == "SUCCESS"

        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_1000.jl")
        status = jMtkFileGridFieldCheck_tst_1000();
        @test status == "SUCCESS"

        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_1100.jl")
        status = jMtkFileGridFieldCheck_tst_1100();
        @test status == "SUCCESS"

        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_1300.jl")
        status = jMtkFileGridFieldCheck_tst_1300();
        @test status == "SUCCESS"

        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_1500.jl")
        status = jMtkFileGridFieldCheck_tst_1500();
        @test status == "SUCCESS"

        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_2300.jl")
        status = jMtkFileGridFieldCheck_tst_2300();
        @test status == "SUCCESS"

        include(JMtk15_test * "src/jMtkFileGridFieldCheck_tst_2500.jl")
        status = jMtkFileGridFieldCheck_tst_2500();
        @test status == "SUCCESS"
# ---------------------------------------------------------- jMtkFileGridFieldToDataType
        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_0100.jl")
        datatype = jMtkFileGridFieldToDataType_tst_0100();
        @test datatype == Int16

        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1000.jl")
        datatype = jMtkFileGridFieldToDataType_tst_1000();
        @test datatype == Float64

        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1100.jl")
        datatype = jMtkFileGridFieldToDataType_tst_1100();
        @test datatype == UInt16

        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1300.jl")
        datatype = jMtkFileGridFieldToDataType_tst_1300();
        @test datatype == Float32

        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_1500.jl")
        datatype = jMtkFileGridFieldToDataType_tst_1500();
        @test datatype == UInt8

        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_2300.jl")
        datatype = jMtkFileGridFieldToDataType_tst_2300();
        @test datatype == Float32

        include(JMtk15_test * "src/jMtkFileGridFieldToDataType_tst_2500.jl")
        datatype = jMtkFileGridFieldToDataType_tst_2500();
        @test datatype == Float32
# ---------------------------------------------------------- jMtkFileGridToResolution
        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_0100.jl")
        resolution = jMtkFileGridToResolution_tst_0100();
        @test resolution == 1100

        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_1000.jl")
        resolution = jMtkFileGridToResolution_tst_1000();
        @test resolution == 17600

        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_1100.jl")
        resolution = jMtkFileGridToResolution_tst_1100();
        @test resolution == 275

        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_1300.jl")
        resolution = jMtkFileGridToResolution_tst_1300();
        @test resolution == 17600

        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_1500.jl")
        resolution = jMtkFileGridToResolution_tst_1500();
        @test resolution == 1100

        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_2300.jl")
        resolution = jMtkFileGridToResolution_tst_2300();
        @test resolution == 1100

        include(JMtk15_test * "src/jMtkFileGridToResolution_tst_2500.jl")
        resolution = jMtkFileGridToResolution_tst_2500();
        @test resolution == 4400
# ---------------------------------------------------------- jMtkFileCoreMetaDataQuery
# Note: This function works for multiple file types but crashes when applied to MISR GP_GMP data files, both when called in IDL and in Julia!

        include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_0100.jl")
        nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_0100();
        @test nparams == 24
        @test paramlist[1:5] == ["LOCALGRANULEID", "PRODUCTIONDATETIME",
            "LOCALVERSIONID", "PGEVERSION", "VERSIONID"]
        @test paramlist[10:14] == ["GRINGPOINTSEQUENCENO", "EXCLUSIONGRINGFLAG",
            "RANGEENDINGDATE", "RANGEENDINGTIME", "RANGEBEGINNINGDATE"]
        @test paramlist[20:24] == ["ADDITIONALATTRIBUTENAME", "PARAMETERVALUE",
            "ADDITIONALATTRIBUTESCONTAINER", "ADDITIONALATTRIBUTENAME", "PARAMETERVALUE"]

        # include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_1000.jl")
        # nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_1000();

        include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_1100.jl")
        nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_1100();
        @test nparams == 43
        @test paramlist[4:8] == ["PGEVERSION", "MEASUREDPARAMETERCONTAINER",
            "AUTOMATICQUALITYFLAGEXPLANATION", "AUTOMATICQUALITYFLAG", "QAPERCENTMISSINGDATA"]
        @test paramlist[14:18] == ["EQUATORCROSSINGLONGITUDE", "VERSIONID", "SHORTNAME",
            "INPUTPOINTER", "GPOLYGONCONTAINER"]
        @test paramlist[37:40] == ["ADDITIONALATTRIBUTENAME", "PARAMETERVALUE",
            "ASSOCIATEDPLATFORMINSTRUMENTSENSORCONTAINER", "ASSOCIATEDSENSORSHORTNAME"]

        include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_1300.jl")
        nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_1300();
        @test nparams == 43
        @test paramlist[8:12] == ["QAPERCENTMISSINGDATA", "PARAMETERNAME",
            "ORBITCALCULATEDSPATIALDOMAINCONTAINER", "EQUATORCROSSINGDATE",
            "EQUATORCROSSINGTIME"]
        @test paramlist[18:22] == ["GPOLYGONCONTAINER", "GRINGPOINTLONGITUDE",
            "GRINGPOINTLATITUDE", "GRINGPOINTSEQUENCENO", "EXCLUSIONGRINGFLAG"]
        @test paramlist[33:37] == ["ADDITIONALATTRIBUTESCONTAINER",
            "ADDITIONALATTRIBUTENAME", "PARAMETERVALUE", "ADDITIONALATTRIBUTESCONTAINER",
            "ADDITIONALATTRIBUTENAME"]

        include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_1500.jl")
        nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_1500();
        @test nparams == 43
        @test paramlist[1:4] == ["LOCALGRANULEID", "PRODUCTIONDATETIME",
            "LOCALVERSIONID", "PGEVERSION"]
        @test paramlist[10:14] == ["ORBITCALCULATEDSPATIALDOMAINCONTAINER",
            "EQUATORCROSSINGDATE", "EQUATORCROSSINGTIME", "ORBITNUMBER",
            "EQUATORCROSSINGLONGITUDE"]
        @test paramlist[40:43] == ["ASSOCIATEDSENSORSHORTNAME",
            "ASSOCIATEDPLATFORMSHORTNAME", "OPERATIONMODE",
            "ASSOCIATEDINSTRUMENTSHORTNAME"]

        include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_2300.jl")
        nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_2300();
        @test nparams == 38
        @test paramlist[1:5] == ["LOCALGRANULEID", "PRODUCTIONDATETIME",
            "LOCALVERSIONID", "PGEVERSION", "MEASUREDPARAMETERCONTAINER"]
        @test paramlist[12:16] == ["EQUATORCROSSINGLONGITUDE", "EQUATORCROSSINGTIME",
            "EQUATORCROSSINGDATE", "SHORTNAME", "VERSIONID"]
        @test paramlist[25:28] == ["RANGEBEGINNINGDATE", "RANGEENDINGDATE",
            "ADDITIONALATTRIBUTESCONTAINER", "ADDITIONALATTRIBUTENAME"]

        include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_2500.jl")
        nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_2500();
        @test nparams == 38
        @test paramlist[3:7] == ["LOCALVERSIONID", "PGEVERSION",
            "MEASUREDPARAMETERCONTAINER", "PARAMETERNAME", "AUTOMATICQUALITYFLAG"]
        @test paramlist[25:28] == ["RANGEBEGINNINGDATE", "RANGEENDINGDATE",
            "ADDITIONALATTRIBUTESCONTAINER", "ADDITIONALATTRIBUTENAME"]
        @test paramlist[36:38] == ["ADDITIONALATTRIBUTESCONTAINER",
            "ADDITIONALATTRIBUTENAME", "PARAMETERVALUE"]
# ---------------------------------------------------------- jMtkFileCoreMetaDataGet
# Note: This function does not currently work at all.

    #     # include(JMtk15_test * "src/jMtkFileCoreMetaDataGet_tst_1.jl")
    #     # include(JMtk15_test * "src/jMtkFileCoreMetaDataGet_tst_5.jl")
# ---------------------------------------------------------- jMtkMakeFilename
# Note: This function does not generate the correct file extension for NetCDF files.

        include(JMtk15_test * "src/jMtkMakeFilename_tst_0100.jl")
        filename = jMtkMakeFilename_tst_0100();
        @test filename == "../Mtk_testdata/in/MISR_AM1_AGP_P168_F01_24.hdf"

        include(JMtk15_test * "src/jMtkMakeFilename_tst_1000.jl")
        filename = jMtkMakeFilename_tst_1000();
        @test filename == "../Mtk_testdata/in/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"

        include(JMtk15_test * "src/jMtkMakeFilename_tst_1100.jl")
        filename = jMtkMakeFilename_tst_1100();
        @test filename == "../Mtk_testdata/in/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AN_F03_0024.hdf"

        include(JMtk15_test * "src/jMtkMakeFilename_tst_1300.jl")
        filename = jMtkMakeFilename_tst_1300();
        @test filename == "../Mtk_testdata/in/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf"

        include(JMtk15_test * "src/jMtkMakeFilename_tst_1500.jl")
        filename = jMtkMakeFilename_tst_1500();
        @test filename == "../Mtk_testdata/in/MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf"

        include(JMtk15_test * "src/jMtkMakeFilename_tst_2300.jl")
        filename = jMtkMakeFilename_tst_2300();
        @test filename == "../Mtk_testdata/in/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"

#         include(JMtk15_test * "src/jMtkMakeFilename_tst_2500.jl")
#         filename = jMtkMakeFilename_tst_2500();
#        @test filename == "../Mtk_testdata/in/MISR_AM1_AS_LAND_P168_O068050_F08_0023.hdf"
# ---------------------------------------------------------- jMtkFindFileList
# Note: This function does not currently work to locate `AGP` files because the C code always expects an orbit number, which is absent from the filename of AGP files.

        # include(JMtk15_test * "src/jMtkFindFileList_tst_0100.jl")
        # filecnt, filenames = jMtkFindFileList_tst_0100();
        # @test filecnt == 1

        include(JMtk15_test * "src/jMtkFindFileList_tst_1000.jl")
        filecnt, filenames = jMtkFindFileList_tst_1000();
        @test filecnt == 1
        @test filenames == ["/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"]

        include(JMtk15_test * "src/jMtkFindFileList_tst_1100.jl")
        filecnt, filenames = jMtkFindFileList_tst_1100();
        @test filecnt == 9
        @test filenames == [
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BF_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_BA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AF_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AN_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf"]

        include(JMtk15_test * "src/jMtkFindFileList_tst_1300.jl")
        filecnt, filenames = jMtkFindFileList_tst_1300();
        @test filecnt == 9
        @test filenames == [
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf", "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.hdf"]

        include(JMtk15_test * "src/jMtkFindFileList_tst_1500.jl")
        filecnt, filenames = jMtkFindFileList_tst_1500();
        @test filecnt == 9
        @test filenames == [
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DF_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf",
                "/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf"]

        include(JMtk15_test * "src/jMtkFindFileList_tst_2300.jl")
        filecnt, filenames = jMtkFindFileList_tst_2300();
        @test filecnt == 1
        @test filenames == ["/Users/michel/Projects/MISR/MISR_Toolkit.1.5/JMtk15/data/MISR/MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"]

# Note: This function does not currently work to locate `AS_LAND` files because the C code always assumes the file extension is `.hdf`, instead of `.nc` for NetCDF files.

        # include(JMtk15_test * "src/jMtkFindFileList_tst_2500.jl")
        # filecnt, filenames = jMtkFindFileList_tst_2500();
        # @test filecnt == 0
# ---------------------------------------------------------- jMtkFileBlockMetaList
        include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_0100.jl")
        nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_0100();
        @test nblockmeta == 2
        @test blockmetalist == ["PerBlockMetadataCommon", "PerBlockMetadataAGP"]

        include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_1000.jl")
        nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_1000();
        @test nblockmeta == 2
        @test blockmetalist == ["PerBlockMetadataCommon", "PerBlockMetadataGeoParm"]

        include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_1100.jl")
        nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_1100();
        @test nblockmeta == 3
        @test blockmetalist == ["PerBlockMetadataCommon", "PerBlockMetadataRad", "PerBlockMetadataTime"]

        include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_1300.jl")
        nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_1300();
        @test nblockmeta == 3
        @test blockmetalist == ["PerBlockMetadataCommon", "PerBlockMetadataRad", "PerBlockMetadataTime"]

        include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_1500.jl")
        nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_1500();
        @test nblockmeta == 1
        @test blockmetalist == ["PerBlockMetadataCommon"]

        include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_2300.jl")
        nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_2300();
        @test nblockmeta == 3
        @test blockmetalist == ["PerBlockMetadataCommon", "Common Per Block Metadata", "PerBlockMetadataTime"]

# Note: This function does not work with NetCDF files.
        # include(JMtk15_test * "src/jMtkFileBlockMetaList_tst_2500.jl")
        # nblockmeta, blockmetalist = jMtkFileBlockMetaList_tst_2500()
# ---------------------------------------------------------- jMtkFileBlockMetaFieldList
        include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_0100.jl")
        nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_0100();
        @test nfields == 7
        @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_1000.jl")
        nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_1000();
        @test nfields == 7
        @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_1100.jl")
        nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_1100();
        @test nfields == 7
        @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_1300.jl")
        nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_1300();
        @test nfields == 7
        @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_1500.jl")
        nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_1500();
        @test nfields == 7
        @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_2300.jl")
        nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_2300();
        @test nfields == 7
        @test fieldlist == ["Block_number", "Ocean_flag", "Block_coor_ulc_som_meter.x", "Block_coor_ulc_som_meter.y", "Block_coor_lrc_som_meter.x", "Block_coor_lrc_som_meter.y", "Data_flag"]

# Note: This function does not work with NetCDF files.
#         include(JMtk15_test * "src/jMtkFileBlockMetaFieldList_tst_2500.jl")
#         nfields, fieldlist = jMtkFileBlockMetaFieldList_tst_2500();
# ---------------------------------------------------------- jMtkFileBlockMetaFieldRead
        include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_0100.jl")
        metafield = jMtkFileBlockMetaFieldRead_tst_0100();
        @test typeof(metafield) == Vector{Int8}
        @test length(metafield) == 180
        @test metafield[1:10] == [0; 0; 0; 0; 0; 1; 1; 1; 1; 1]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1000.jl")
        metafield = jMtkFileBlockMetaFieldRead_tst_1000();
        @test typeof(metafield) == Vector{Float64}
        @test length(metafield) == 164
        @test metafield[51:60] == [1.450075e7; 1.464155e7; 1.478235e7; 1.492315e7;
           1.506395e7; 1.520475e7; 1.534555e7; 1.548635e7; 1.562715e7; 1.576795e7]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1100.jl")
        metafield = jMtkFileBlockMetaFieldRead_tst_1100();
        @test typeof(metafield) == Vector{Float64}
        @test length(metafield) == 162
        @test metafield[51:60] == [1.464155e7; 1.478235e7; 1.492315e7; 1.506395e7;
           1.520475e7; 1.534555e7; 1.548635e7; 1.562715e7; 1.576795e7; 1.590875e7]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1300.jl")
        metafield = jMtkFileBlockMetaFieldRead_tst_1300();
        @test typeof(metafield) == Vector{Float64}
        @test length(metafield) == 162
        @test metafield[51:60] == [967450.0; 949850.0; 932250.0; 914650.0;
           914650.0; 897050.0; 879450.0; 861850.0; 844250.0; 844250.0]

        include(JMtk15_test * "src/jMtkFileBlockMetaFieldRead_tst_1500.jl")
        metafield = jMtkFileBlockMetaFieldRead_tst_1500();
        @test typeof(metafield) == Vector{Float64}
        @test length(metafield) == 162
        @test metafield[51:60] == [404250.0; 386650.0; 369050.0; 351450.0;
           351450.0; 333850.0; 316250.0; 298650.0; 281050.0; 281050.0]
# ---------------------------------------------------------- jMtkTimeMetaRead
        include(JMtk15_test * "src/jMtkTimeMetaRead_tst_1105.jl")
        timedata = jMtkTimeMetaRead_tst_1105();
        @test timedata.path == 168
        @test timedata.start_block == 19
        @test timedata.end_block == 162
        @test String(timedata.camera) == "AN\0"
        @test timedata.number_transform[21] == 2
        @test String(timedata.ref_time[21][1]) == "2012-10-03T07:35:06.093760Z\0"
        @test String(timedata.ref_time[21][2]) == "2012-10-03T07:35:06.093760Z\0"
        @test timedata.start_line[21] == Int32[9728, 9984]
        @test timedata.number_line[21] == Int32[256, 256]
        @test timedata.coeff_line[21][1][1] == 343.63912818600835
        @test timedata.coeff_line[21][1][2] == 596.8625892179571
        @test timedata.coeff_line[21][2][1] == 0.9891433525445832
        @test timedata.coeff_line[21][2][2] == 0.9891625570665201
        @test timedata.coeff_line[21][3][1] == -0.0004884364332011053
        @test timedata.coeff_line[21][3][2] == -0.0012594304174612728
        @test timedata.coeff_line[21][4][1] == -3.1505301908925205e-8
        @test timedata.coeff_line[21][4][2] == 8.304457205878514e-9
        @test timedata.coeff_line[21][5][1] == -2.8275584372222565e-6
        @test timedata.coeff_line[21][5][2] == -2.9153112097163063e-6
        @test timedata.coeff_line[21][6][1] == -3.644407914887632e-11
        @test timedata.coeff_line[21][6][2] == 3.756058009214872e-11
    end
# ==========================================================================================
    @testset "UnitConv" begin
# ---------------------------------------------------------- jMtkDdToDegMinSec
        include(JMtk15_test * "src/jMtkDdToDegMinSec_tst_1.jl")
        degrees, minutes, seconds = jMtkDdToDegMinSec_tst_1();
        @test (degrees, minutes, seconds) == (65, 30, 0.0)
# ---------------------------------------------------------- jMtkDdToDms
        include(JMtk15_test * "src/jMtkDdToDms_tst_1.jl")
        packed_dms = jMtkDdToDms_tst_1();
        @test packed_dms == 6.503e7
# ---------------------------------------------------------- jMtkDdToRad
        include(JMtk15_test * "src/jMtkDdToRad_tst_1.jl")
        radians = jMtkDdToRad_tst_1();
        @test radians == 1.1431906600562858
# ---------------------------------------------------------- jMtkDegMinSecToDd
        include(JMtk15_test * "src/jMtkDegMinSecToDd_tst_1.jl")
        decdeg = jMtkDegMinSecToDd_tst_1();
        @test decdeg == 65.55000027777777
# ---------------------------------------------------------- jMtkDegMinSecToDms
        include(JMtk15_test * "src/jMtkDegMinSecToDms_tst_1.jl")
        packed_dms = jMtkDegMinSecToDms_tst_1();
        @test packed_dms == 6.5033000001e7
# ---------------------------------------------------------- jMtkDegMinSecToRad
        include(JMtk15_test * "src/jMtkDegMinSecToRad_tst_1.jl")
        radians = jMtkDegMinSecToRad_tst_1();
        @test radians == 1.1440633295304197
# ---------------------------------------------------------- jMtkDmsToDd
        include(JMtk15_test * "src/jMtkDmsToDd_tst_1.jl")
        decdeg = jMtkDmsToDd_tst_1();
        @test decdeg == 65.5500027777772
# ---------------------------------------------------------- jMtkDmsToDegMinSec
        include(JMtk15_test * "src/jMtkDmsToDegMinSec_tst_1.jl")
        degrees, minutes, seconds = jMtkDmsToDegMinSec_tst_1();
        @test (degrees, minutes, seconds) == (65, 33, 11.100000001490116)
# ---------------------------------------------------------- jMtkDmsToRad
        include(JMtk15_test * "src/jMtkDmsToRad_tst_1.jl")
        radians = jMtkDmsToRad_tst_1();
        @test radians == 1.144063373163641
# ---------------------------------------------------------- jMtkRadToDd
        include(JMtk15_test * "src/jMtkRadToDd_tst_1.jl")
        decdeg = jMtkRadToDd_tst_1();
        @test decdeg == 65.55000431538731
# ---------------------------------------------------------- jMtkRadToDegMinSec
        include(JMtk15_test * "src/jMtkRadToDegMinSec_tst_1.jl")
        degrees, minutes, seconds = jMtkRadToDegMinSec_tst_1();
        @test (degrees, minutes, seconds) == (65, 33, 0.0010968595743179321)
# ---------------------------------------------------------- jMtkRadToDms
        include(JMtk15_test * "src/jMtkRadToDms_tst_1.jl")
        packed_dms = jMtkRadToDms_tst_1();
        @test packed_dms == 6.503205999903421e7
    end
# ==========================================================================================
    @testset "CoordQuery" begin
# ---------------------------------------------------------- jMtkBlsToLatLon
        include(JMtk15_test * "src/jMtkBlsToLatLon_tst_1.jl")
        latitude, longitude = jMtkBlsToLatLon_tst_1();
        @test (latitude, longitude) == (55.16137325083296, 16.435317837222424)
# ---------------------------------------------------------- jMtkBlsToSomXY
        include(JMtk15_test * "src/jMtkBlsToSomXY_tst_1.jl")
        somx, somy = jMtkBlsToSomXY_tst_1();
        @test (somx, somy) == (1.7145919996643066e7, 222089.9932861328)
# ---------------------------------------------------------- jMtkLatLonToBls
        include(JMtk15_test * "src/jMtkLatLonToBls_tst_1.jl")
        block, line, sample = jMtkLatLonToBls_tst_1();
        @test (block, line, sample) == (45, 19.521484f0, 207.88611f0)
# ---------------------------------------------------------- jMtkSomXYToBls
        include(JMtk15_test * "src/jMtkSomXYToBls_tst_1.jl")
        block, line, sample = jMtkSomXYToBls_tst_1();
        @test (block, line, sample) == (69, 100.200195f0, 89.899994f0)
# ---------------------------------------------------------- jMtkLatLonToSomXY
        include(JMtk15_test * "src/jMtkLatLonToSomXY_tst_1.jl")
        somx, somy = jMtkLatLonToSomXY_tst_1();
        @test (somx, somy) == (1.3677973731411265e7, 686274.716033836)
# ---------------------------------------------------------- jMtkSomXYToLatLon
        include(JMtk15_test * "src/jMtkSomXYToLatLon_tst_1.jl")
        latitude, longitude = jMtkSomXYToLatLon_tst_1();
        @test (latitude, longitude) == (26.737612422281604, -54.149627910796426)
# ---------------------------------------------------------- jMtkPathToProjParam
        include(JMtk15_test * "src/jMtkPathToProjParam_tst_1.jl")
        proj_params = jMtkPathToProjParam_tst_1();
        @test proj_params.path == 160
        @test proj_params.projcode == 22
        @test proj_params.zonecode == -1
        @test proj_params.spherecode == 12
        @test proj_params.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.1705401692154506e8]
        @test proj_params.ulc == [7.46075e6, 1.09065e6]
        @test proj_params.lrc == [7.60155e6, 527450.0]
        @test proj_params.reloffset[2] == 64.0
# ---------------------------------------------------------- jMtkPathBlockRangeToBlockCorners
        include(JMtk15_test * "src/jMtkPathBlockRangeToBlockCorners_tst_1.jl")
        block_corners = jMtkPathBlockRangeToBlockCorners_tst_1();
        @test block_corners.path == 37
        @test (block_corners.start_block, block_corners.end_block) == (50, 50)
        @test block_corners.block[51].ulc == MTKt_GeoCoord(51.50172788126263, -110.34181235426887)
        @test block_corners.block[51].urc == MTKt_GeoCoord(50.55921476448539, -102.45622291180113)
        @test block_corners.block[51].ctr == MTKt_GeoCoord(50.47619474545069, -106.54373076847435)
        @test block_corners.block[51].lrc == MTKt_GeoCoord(49.33239267609881, -102.91557271102047)
        @test block_corners.block[51].llc == MTKt_GeoCoord(50.25072514075242, -110.60484537214862)
# ---------------------------------------------------------- jMtkPixelTime

#     # include(JMtk15_test * "src/jMtkPixelTime_tst_1.jl")
    end
# ==========================================================================================
    @testset "MapQuery" begin
# ---------------------------------------------------------- jMtkLSToLatLon
        include(JMtk15_test * "src/jMtkLSToLatLon_tst_0100.jl")
        latitude, longitude = jMtkLSToLatLon_tst_0100();
        @test (latitude, longitude) == (-24.216289492769953, 30.63597054987332)

        include(JMtk15_test * "src/jMtkLSToLatLon_tst_1000.jl")
        latitude, longitude = jMtkLSToLatLon_tst_1000();
        @test (latitude, longitude) == (-24.763422014332374, 32.17378749123402)

        include(JMtk15_test * "src/jMtkLSToLatLon_tst_1100.jl")
        latitude, longitude = jMtkLSToLatLon_tst_1100();
        @test (latitude, longitude) == (-25.808810030321773, 32.082301626959335)

        include(JMtk15_test * "src/jMtkLSToLatLon_tst_1300.jl")
        latitude, longitude = jMtkLSToLatLon_tst_1300();
        @test (latitude, longitude) == (-27.006268920147406, 30.77788841016984)

        include(JMtk15_test * "src/jMtkLSToLatLon_tst_1500.jl")
        latitude, longitude = jMtkLSToLatLon_tst_1500();
        @test (latitude, longitude) == (-24.491393852709678, 32.515787119559384)

        include(JMtk15_test * "src/jMtkLSToLatLon_tst_2300.jl")
        latitude, longitude = jMtkLSToLatLon_tst_2300();
        @test (latitude, longitude) == (-21.872392767809703, 32.70617471105444)

        include(JMtk15_test * "src/jMtkLSToLatLon_tst_2500.jl")
        latitude, longitude = jMtkLSToLatLon_tst_2500();
        @test (latitude, longitude) == (-21.872392767809703, 32.70617471105444)
# ---------------------------------------------------------- jMtkLSToSomXY
        include(JMtk15_test * "src/jMtkLSToSomXY_tst_0100.jl")
        somx, somy = jMtkLSToSomXY_tst_0100();
        @test (somx, somy) == (2.292411e7, -405350.0)

        include(JMtk15_test * "src/jMtkLSToSomXY_tst_1000.jl")
        somx, somy = jMtkLSToSomXY_tst_1000();
        @test (somx, somy) == (2.298923e7, -153670.0)

        include(JMtk15_test * "src/jMtkLSToSomXY_tst_1100.jl")
        somx, somy = jMtkLSToSomXY_tst_1100();
        @test (somx, somy) == (2.263415e7, -218240.0)

        include(JMtk15_test * "src/jMtkLSToSomXY_tst_1300.jl")
        somx, somy = jMtkLSToSomXY_tst_1300();
        @test (somx, somy) == (2.272567e7, -258280.0)

        include(JMtk15_test * "src/jMtkLSToSomXY_tst_1500.jl")
        somx, somy = jMtkLSToSomXY_tst_1500();
        @test (somx, somy) == (2.314983e7, -528220.0)

        include(JMtk15_test * "src/jMtkLSToSomXY_tst_2300.jl")
        somx, somy = jMtkLSToSomXY_tst_2300();
        @test (somx, somy) == (2.222803e7, -308440.0)

        include(JMtk15_test * "src/jMtkLSToSomXY_tst_2500.jl")
        somx, somy = jMtkLSToSomXY_tst_2500();
        @test (somx, somy) == (2.287912e7, -358600.0)
# ---------------------------------------------------------- jMtkLatLonToLS
        include(JMtk15_test * "src/jMtkLatLonToLS_tst_0100.jl")
        line, sample = jMtkLatLonToLS_tst_0100();
        @test (line, sample) == (2.6562471f0, 7.3437467f0)

        include(JMtk15_test * "src/jMtkLatLonToLS_tst_1000.jl")
        line, sample = jMtkLatLonToLS_tst_1000();
        @test (line, sample) == (2.6562471f0, 7.3437467f0)

        include(JMtk15_test * "src/jMtkLatLonToLS_tst_1100.jl")
        line, sample = jMtkLatLonToLS_tst_1100();
        @test (line, sample) == (201.49982f0, 501.4998f0)

        include(JMtk15_test * "src/jMtkLatLonToLS_tst_1300.jl")
        line, sample = jMtkLatLonToLS_tst_1300();
        @test (line, sample) == (49.999954f0, 124.99995f0)

        include(JMtk15_test * "src/jMtkLatLonToLS_tst_1500.jl")
        line, sample = jMtkLatLonToLS_tst_1500();
        @test (line, sample) == (49.999954f0, 124.99995f0)

        include(JMtk15_test * "src/jMtkLatLonToLS_tst_2300.jl")
        line, sample = jMtkLatLonToLS_tst_2300();
        @test (line, sample) == (49.999954f0, 124.99995f0)

        include(JMtk15_test * "src/jMtkLatLonToLS_tst_2500.jl")
        line, sample = jMtkLatLonToLS_tst_2500();
        @test (line, sample) == (49.999954f0, 124.99995f0)
# ---------------------------------------------------------- jMtkSomXYToLS
        include(JMtk15_test * "src/jMtkSomXYToLS_tst_0100.jl")
        line, sample = jMtkSomXYToLS_tst_0100();
        @test (line, sample) == (6.1f0, 12.5f0)

        include(JMtk15_test * "src/jMtkSomXYToLS_tst_1000.jl")
        line, sample = jMtkSomXYToLS_tst_1000();
        @test (line, sample) == (1.8f0, 27.8f0)

        include(JMtk15_test * "src/jMtkSomXYToLS_tst_1100.jl")
        line, sample = jMtkSomXYToLS_tst_1100();
        @test (line, sample) == (97.5f0, 345.6f0)

        include(JMtk15_test * "src/jMtkSomXYToLS_tst_1300.jl")
        line, sample = jMtkSomXYToLS_tst_1300();
        @test (line, sample) == (52.7f0, 325.2f0)

        include(JMtk15_test * "src/jMtkSomXYToLS_tst_1500.jl")
        line, sample = jMtkSomXYToLS_tst_1500();
        @test (line, sample) == (54.3f0, 127.8f0)

        include(JMtk15_test * "src/jMtkSomXYToLS_tst_2300.jl")
        line, sample = jMtkSomXYToLS_tst_2300();
        @test (line, sample) == (112.3f0, 215.6f0)

        include(JMtk15_test * "src/jMtkSomXYToLS_tst_2500.jl")
        line, sample = jMtkSomXYToLS_tst_2500();
        @test (line, sample) == (64.2f0, 250.0f0)
# ---------------------------------------------------------- jMtkCreateLatLon
#     # include(JMtk15_test * "src/jMtkCreateLatLon_tst_x.jl")
    end
# ==========================================================================================
    @testset "OrbitPath" begin
# ---------------------------------------------------------- jMtkLatLonToPathList
        include(JMtk15_test * "src/jMtkLatLonToPathList_tst_1.jl")
        path_cnt, path_list = jMtkLatLonToPathList_tst_1();
        @test path_cnt == 17
        @test path_list == [7, 8, 9, 10, 11, 12, 13, 14, 146, 147, 148, 149, 150, 151, 152, 153, 154]
# ---------------------------------------------------------- jMtkRegionToPathList
        include(JMtk15_test * "src/jMtkRegionToPathList_tst_1.jl")
        path_cnt, path_list = jMtkRegionToPathList_tst_1();
        @test path_cnt == 5
        @test path_list == [41, 42, 43, 44, 45]
# ---------------------------------------------------------- jMtkRegionPathToBlockRange
        include(JMtk15_test * "src/jMtkRegionPathToBlockRange_tst_1.jl")
        start_block, end_block = jMtkRegionPathToBlockRange_tst_1();
        @test (start_block, end_block) == (32, 40)
# ---------------------------------------------------------- jMtkOrbitToPath
        include(JMtk15_test * "src/jMtkOrbitToPath_tst_1.jl")
        path = jMtkOrbitToPath_tst_1();
        @test path == 37
# ---------------------------------------------------------- jMtkTimeToOrbitPath
        include(JMtk15_test * "src/jMtkTimeToOrbitPath_tst_1.jl")
        orbit, path = jMtkTimeToOrbitPath_tst_1();
        @test orbit == 27271
        @test path == 104
# ---------------------------------------------------------- jMtkTimeRangeToOrbitList
        include(JMtk15_test * "src/jMtkTimeRangeToOrbitList_tst_1.jl")
        orbit_cnt, orbit_list = jMtkTimeRangeToOrbitList_tst_1();
        @test orbit_cnt == 2
        @test orbit_list == [27271, 27272]
# ---------------------------------------------------------- jMtkPathTimeRangeToOrbitList
        include(JMtk15_test * "src/jMtkPathTimeRangeToOrbitList_tst_1.jl")
        orbit_cnt, orbit_list = jMtkPathTimeRangeToOrbitList_tst_1();
        @test orbit_cnt == 6
        @test orbit_list == [11350, 11583, 11816, 12049, 12282, 12515]
# ---------------------------------------------------------- jMtkOrbitToTimeRange
        include(JMtk15_test * "src/jMtkOrbitToTimeRange_tst_1.jl")
        start_time, end_time = jMtkOrbitToTimeRange_tst_1();
        @test (start_time, end_time) == ("2006-01-24T19:56:53Z", "2006-01-24T21:35:46Z")
    end
# ==========================================================================================
    @testset "SetRegion" begin
# ---------------------------------------------------------- jMtkSetRegionByPathBlockRange
        include(JMtk15_test * "src/jMtkSetRegionByPathBlockRange_tst_1.jl")
        region = jMtkSetRegionByPathBlockRange_tst_1();
        @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(67.28628518822661, -95.22204196033839)), MTKt_Extent(633462.5, 307862.5))
        @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(67.28628518822661, -95.22204196033839))
        @test region.geo.ctr == MTKt_GeoCoord(67.28628518822661, -95.22204196033839)
        @test region.geo.ctr.lat == 67.28628518822661
        @test region.geo.ctr.lon == -95.22204196033839
        @test region.hextent == MTKt_Extent(633462.5, 307862.5)
        @test region.hextent.xlat == 633462.5
        @test region.hextent.ylon == 307862.5
# ---------------------------------------------------------- jMtkSetRegionByUlcLrc
        include(JMtk15_test * "src/jMtkSetRegionByUlcLrc_tst_1.jl")
        region = jMtkSetRegionByUlcLrc_tst_1();
        @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(111319.54315, 111319.54315))
        @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0))
        @test region.geo.ctr == MTKt_GeoCoord(66.0, -89.0)
        @test region.geo.ctr.lat == 66.0
        @test region.geo.ctr.lon == -89.0
        @test region.hextent == MTKt_Extent(111319.54315, 111319.54315)
        @test region.hextent.xlat == 111319.54315
        @test region.hextent.ylon == 111319.54315
# ---------------------------------------------------------- jMtkSetRegionByLatLonExtent
        include(JMtk15_test * "src/jMtkSetRegionByLatLonExtent_tst_1.jl")
        region = jMtkSetRegionByLatLonExtent_tst_1();
        @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0)), MTKt_Extent(55500.0, 55500.0))
        @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(66.0, -89.0))
        @test region.geo.ctr == MTKt_GeoCoord(66.0, -89.0)
        @test region.geo.ctr.lat == 66.0
        @test region.geo.ctr.lon == -89.0
        @test region.hextent == MTKt_Extent(55500.0, 55500.0)
        @test region.hextent.xlat == 55500.0
        @test region.hextent.ylon == 55500.0
# ---------------------------------------------------------- jMtkSetRegionByPathSomUlcLrc
        include(JMtk15_test * "src/jMtkSetRegionByPathSomUlcLrc_tst_1.jl")
        region = jMtkSetRegionByPathSomUlcLrc_tst_1();
        @test region == MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(35.38461751504492, -102.05138161671469)), MTKt_Extent(600137.5, 1287.5))
        @test region.geo == MTKt_GeoCenter(MTKt_GeoCoord(35.38461751504492, -102.05138161671469))
        @test region.geo.ctr == MTKt_GeoCoord(35.38461751504492, -102.05138161671469)
        @test region.geo.ctr.lat == 35.38461751504492
        @test region.geo.ctr.lon == -102.05138161671469
        @test region.hextent == MTKt_Extent(600137.5, 1287.5)
        @test region.hextent.xlat == 600137.5
        @test region.hextent.ylon == 1287.5
# ---------------------------------------------------------- jMtkSnapToGrid
        include(JMtk15_test * "src/jMtkSnapToGrid_tst_1.jl")
        mapinfo = jMtkSnapToGrid_tst_1();
        @test mapinfo.path == 37
        @test mapinfo.start_block == 36
        @test mapinfo.end_block == 37
        @test mapinfo.resolution == 275
        @test mapinfo.nline == 704
        @test mapinfo.nsample == 512
        @test mapinfo.som.ulc == MTKt_SomCoord(1.23888875e7, 1.0555875e6)
        @test mapinfo.som.ctr.x == 1.248555e7
        @test mapinfo.som.lrc.y == 1.1961125e6
        @test mapinfo.geo.ulc.lat == 67.03179518448705
        @test mapinfo.geo.urc.lon == -86.6996155055143
        @test mapinfo.pp.ulc[1] == 7.46075e6
        @test mapinfo.pp.lrc[2] == 527450.0
    end
# ==========================================================================================
    @testset "ReadData" begin
# ---------------------------------------------------------- jMtkReadData
        include(JMtk15_test * "src/jMtkReadData_tst_0100.jl")
        databuf, mapinfo = jMtkReadData_tst_0100();
        @test typeof(databuf) == Matrix{UInt8}
        @test size(databuf) == (512, 128)
        @test UInt8.(transpose(databuf[461:466, 67:71])) == UInt8.([
                1  1  1  1  1  1
                1  1  1  2  2  2
                1  1  2  2  3  2
                2  2  3  3  2  3
                3  3  3  3  2  2])
        @test mapinfo.resfactor == 4
        @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
        @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.28085e7, -633600.0), MTKt_SomCoord(2.287835e7, -352550.0), MTKt_SomCoord(2.29482e7, -71500.0))
        @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.28085e7, -633600.0)
        @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.287835e7, -352550.0)
        @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.29482e7, -71500.0)
        @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-23.58709279748763, 29.353665543180618), MTKt_GeoCoord(-24.0676258508188, 34.84437551586123), MTKt_GeoCoord(-24.479478582488763, 32.028724322255464), MTKt_GeoCoord(-25.323930208545036, 34.740509109113106), MTKt_GeoCoord(-24.838877358123973, 29.195643744542547))
        @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-23.58709279748763, 29.353665543180618)
        @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-24.0676258508188, 34.84437551586123)
        @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-24.479478582488763, 32.028724322255464)
        @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-25.323930208545036, 34.740509109113106)
        @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-24.838877358123973, 29.195643744542547)
        @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
        @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
        @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
        @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
        @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 128, 512)
        @test mapinfo.pp.reloffset[1:4] == [0.0, 16.0, 0.0, 16.0]

        include(JMtk15_test * "src/jMtkReadData_tst_1000.jl")
        databuf, mapinfo = jMtkReadData_tst_1000();
        @test typeof(databuf) == Matrix{Float64}
        @test size(databuf) == (32, 8)
        @test transpose(databuf[16:19, 4:5]) == [
                31.3949458411467 31.283454456643128 31.172319983604712 31.061547430619207;
                31.49954269576102 31.38843722293199 31.27768970248382 31.16730618391117]
        @test mapinfo.resfactor == 64
        @test (mapinfo.nline, mapinfo.nsample) == (8, 32)
        @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.295755e7, -642950.0), MTKt_SomCoord(2.301915e7, -370150.0), MTKt_SomCoord(2.308075e7, -97350.0))
        @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.295755e7, -642950.0)
        @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.301915e7, -370150.0)
        @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.308075e7, -97350.0)
        @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-24.912833295792158, 29.09305892265543), MTKt_GeoCoord(-25.390243230498008, 34.47763492777933), MTKt_GeoCoord(-25.72932186715566, 31.72061762407402), MTKt_GeoCoord(-26.497900285059888, 34.383017256768206), MTKt_GeoCoord(-26.0162837384446, 28.948916592857373))
        @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-24.912833295792158, 29.09305892265543)
        @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-25.390243230498008, 34.47763492777933)
        @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-25.72932186715566, 31.72061762407402)
        @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-26.497900285059888, 34.383017256768206)
        @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-26.0162837384446, 28.948916592857373)
        @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
        @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
        @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
        @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
        @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 8, 32)
        @test mapinfo.pp.reloffset[1:4] == [0.0, 1.0, 0.0, 1.0]

        include(JMtk15_test * "src/jMtkReadData_tst_1100.jl")
        databuf, mapinfo = jMtkReadData_tst_1100();
        @test typeof(databuf) == Matrix{UInt16}
        @test size(databuf) == (512, 128)
        @test Int.(transpose(databuf[252:256, 5:10])) == [
                9968  10720  10488   9420   7828
                9936  10816  11192  11000  10764
                9212   9552   9996  10176  10448
                8664   8668   8588   8364   9104
                8568   8576   8324   8212   8116
                8928   8972   8728   8732   8688]
       @test mapinfo.resfactor == 4
       @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
       @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.25269e7, -598400.0), MTKt_SomCoord(2.259675e7, -317350.0), MTKt_SomCoord(2.26666e7, -36300.0))
       @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.25269e7, -598400.0)
       @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.259675e7, -317350.0)
       @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.26666e7, -36300.0)
       @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-21.097325373532644, 29.99582427938279), MTKt_GeoCoord(-21.55799831374879, 35.39028205545153), MTKt_GeoCoord(-21.97741330429874, 32.627475397777744), MTKt_GeoCoord(-22.814872931137558, 35.29073891830416), MTKt_GeoCoord(-22.350387571641914, 29.84908666726994))
       @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-21.097325373532644, 29.99582427938279)
       @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-21.55799831374879, 35.39028205545153)
       @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-21.97741330429874, 32.627475397777744)
       @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-22.814872931137558, 35.29073891830416)
       @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-22.350387571641914, 29.84908666726994)
       @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
       @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
       @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
       @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
       @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 128, 512)
       @test mapinfo.pp.reloffset[1:4] == [0.0, 16.0, 0.0, 16.0]

       include(JMtk15_test * "src/jMtkReadData_tst_1300.jl")
       databuf, mapinfo = jMtkReadData_tst_1300();
       @test typeof(databuf) == Matrix{UInt16}
       @test size(databuf) == (2048, 512)
       @test Int.(transpose(databuf[1011:1015, 201:205])) == [
                4656  4704  4372  4512  4744
                4236  4256  4436  4480  4472
                4468  4624  4200  3764  3764
                4792  4736  4208  3720  3624
                4948  4808  4380  4140  4152]
       @test mapinfo.resfactor == 1
       @test (mapinfo.nline, mapinfo.nsample) == (512, 2048)
       @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.26672875e7, -616412.5), MTKt_SomCoord(2.273755e7, -334950.0), MTKt_SomCoord(2.28078125e7, -53487.5))
       @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.26672875e7, -616412.5)
       @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.273755e7, -334950.0)
       @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.28078125e7, -53487.5)
       @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-22.338655196971448, 29.67470803381622), MTKt_GeoCoord(-22.809586710229873, 35.123460533247695), MTKt_GeoCoord(-23.22882451114302, 32.33086052347723), MTKt_GeoCoord(-24.07360545797157, 35.02132140431515), MTKt_GeoCoord(-23.59848983222742, 29.521588205306525))
       @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-22.338655196971448, 29.67470803381622)
       @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-22.809586710229873, 35.123460533247695)
       @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-23.22882451114302, 32.33086052347723)
       @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-24.07360545797157, 35.02132140431515)
       @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-23.59848983222742, 29.521588205306525)
       @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
       @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
       @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
       @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
       @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 512, 2048)
       @test mapinfo.pp.reloffset[1:4] == [0.0, 64.0, 0.0, 64.0]

        include(JMtk15_test * "src/jMtkReadData_tst_1500.jl")
        databuf, mapinfo = jMtkReadData_tst_1500();
        @test typeof(databuf) == Matrix{UInt8}
        @test size(databuf) == (512, 128)
        @test Int.(transpose(databuf[388:392, 22:27])) == [
                4  2  3  4  4
                4  4  3  4  4
                4  4  2  4  2
                4  3  1  4  4
                4  2  1  4  4
                4  2  2  4  4]
        @test mapinfo.resfactor == 4
        @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
        @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.30901e7, -668800.0), MTKt_SomCoord(2.315995e7, -387750.0), MTKt_SomCoord(2.32298e7, -106700.0))
        @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.30901e7, -668800.0)
        @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.315995e7, -387750.0)
        @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.32298e7, -106700.0)
        @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-26.0721209058142, 28.681521176903196), MTKt_GeoCoord(-26.575431877271235, 34.28232743548915), MTKt_GeoCoord(-26.978298006176956, 31.40606162364945), MTKt_GeoCoord(-27.83108760787897, 34.173044569161036), MTKt_GeoCoord(-27.3224387040438, 28.51053243188757))
        @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-26.0721209058142, 28.681521176903196)
        @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-26.575431877271235, 34.28232743548915)
        @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-26.978298006176956, 31.40606162364945)
        @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-27.83108760787897, 34.173044569161036)
        @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-27.3224387040438, 28.51053243188757)
        @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
        @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
        @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
        @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
        @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 128, 512)
        @test mapinfo.pp.reloffset[1:4] == [0.0, 16.0, 0.0, 16.0]

        include(JMtk15_test * "src/jMtkReadData_tst_2300.jl")
        databuf, mapinfo = jMtkReadData_tst_2300();
        @test typeof(databuf) == Matrix{Int16}
        @test size(databuf) == (512, 128)
        @test Int.(transpose(databuf[244:248, 61:66])) == [
                277  524  286  292  284
                281  536  303  299   33
                  4  551  298  314   -4
                284  305  299  285  290
                283  292  527  565  291
                546  550  539  557  561]
       @test mapinfo.resfactor == 4
       @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
       @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.23861e7, -580800.0), MTKt_SomCoord(2.245595e7, -299750.0), MTKt_SomCoord(2.25258e7, -18700.0))
       @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.23861e7, -580800.0)
       @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.245595e7, -299750.0)
       @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.25258e7, -18700.0)
       @test mapinfo.geo == MTKt_GeoRegion(MTKt_GeoCoord(-19.85083825300675, 30.30688322418754), MTKt_GeoCoord(-20.302597970112007, 35.65809597736565), MTKt_GeoCoord(-20.725296200820143, 32.91899135913688), MTKt_GeoCoord(-21.559729345920385, 35.56034690307178), MTKt_GeoCoord(-21.104475164861434, 30.165228506422512))
       @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) == (-19.85083825300675, 30.30688322418754)
       @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) == (-20.302597970112007, 35.65809597736565)
       @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) == (-20.725296200820143, 32.91899135913688)
       @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) == (-21.559729345920385, 35.56034690307178)
       @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) == (-21.104475164861434, 30.165228506422512)
       @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
       @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
       @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
       @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
       @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 128, 512)
       @test mapinfo.pp.reloffset[1:4] == [0.0, 16.0, 0.0, 16.0]

       include(JMtk15_test * "src/jMtkReadData_tst_2500.jl")
       databuf, mapinfo = jMtkReadData_tst_2500();
       @test typeof(databuf) == Matrix{Float32}
       @test size(databuf) == (512, 128)
       idl_res = [
            0.100000     -9999.00     0.850000     -9999.00     -9999.00
            0.100000     0.811538     -9999.00     -9999.00     -9999.00
            0.100000     0.100000     0.961111     0.350000     0.950000
            0.100000     0.645455     0.350000     0.350000     0.350000
            0.350000     0.350000     0.350000     0.350000     0.350000];
        jul_res = transpose(databuf[251:255, 65:69]);
        @test isapprox(idl_res, jul_res, atol = 0.001)
        @test mapinfo.resfactor == 4
        @test (mapinfo.nline, mapinfo.nsample) == (128, 512)
        @test mapinfo.som == MTKt_SomRegion(168, MTKt_SomCoord(2.28085e7, -633600.0), MTKt_SomCoord(2.287835e7, -352550.0), MTKt_SomCoord(2.29482e7, -71500.0))
        @test (mapinfo.som.ulc.x, mapinfo.som.ulc.y) == (2.28085e7, -633600.0)
        @test (mapinfo.som.ctr.x, mapinfo.som.ctr.y) == (2.287835e7, -352550.0)
        @test (mapinfo.som.lrc.x, mapinfo.som.lrc.y) == (2.29482e7, -71500.0)
        @test mapinfo.geo == MTKt_GeoRegion(
                MTKt_GeoCoord(-23.58709279748763, 29.353665543180618),
                MTKt_GeoCoord(-24.0676258508188, 34.84437551586123),
                MTKt_GeoCoord(-24.479478582488763, 32.028724322255464),
                MTKt_GeoCoord(-25.323930208545036, 34.740509109113106),
                MTKt_GeoCoord(-24.838877358123973, 29.195643744542547))
        @test (mapinfo.geo.ulc.lat, mapinfo.geo.ulc.lon) ==
                (-23.58709279748763, 29.353665543180618)
        @test (mapinfo.geo.urc.lat, mapinfo.geo.urc.lon) ==
                (-24.0676258508188, 34.84437551586123)
        @test (mapinfo.geo.ctr.lat, mapinfo.geo.ctr.lon) ==
                (-24.479478582488763, 32.028724322255464)
        @test (mapinfo.geo.lrc.lat, mapinfo.geo.lrc.lon) ==
                (-25.323930208545036, 34.740509109113106)
        @test (mapinfo.geo.llc.lat, mapinfo.geo.llc.lon) ==
                (-24.838877358123973, 29.195643744542547)
        @test mapinfo.pp.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8]
        @test (mapinfo.pp.projparam[9], mapinfo.pp.projparam[12]) == (98.88, 180.0)
        @test mapinfo.pp.ulc == [7.46075e6, 1.09065e6]
        @test mapinfo.pp.lrc == [7.60155e6, 527450.0]
        @test (mapinfo.pp.nblock, mapinfo.pp.nline, mapinfo.pp.nsample) == (180, 128, 512)
        @test mapinfo.pp.reloffset[1:4] == [0.0, 16.0, 0.0, 16.0]
# ---------------------------------------------------------- jMtkReadBlock
        include(JMtk15_test * "src/jMtkReadBlock_tst_0100.jl")
        databuf = jMtkReadBlock_tst_0100();
        @test typeof(databuf) == Matrix{UInt8}
        @test size(databuf) == (512, 128)
        @test transpose(databuf[471:474, 65:71]) == UInt8.([
                 1   1   2   2
                 2   2   2   2
                 2   3   2   2
                 3   2   2   1
                 2   2   1   1
                 1   1   1   1
                 1   1   1   1])

        include(JMtk15_test * "src/jMtkReadBlock_tst_1000.jl")
        databuf = jMtkReadBlock_tst_1000();
        @test typeof(databuf) == Matrix{Float64}
        @test size(databuf) == (32, 8)
        idl_res = Float64.([
                230.08959       229.82531       229.55951       229.29219
                229.89184       229.62716       229.36099       229.09329
                229.69559       229.43054       229.16399       228.89594
                229.50085       229.23543       228.96852       228.70011
                229.30761       229.04182       228.77456       228.50581
                229.11584       228.84970       228.58210       228.31302
                228.92556       228.65907       228.39113       228.12173
                228.73674       228.46992       228.20165       227.93194]);
        jul_res = transpose(databuf[21:24, 1:8]);
        @test isapprox(idl_res, jul_res, atol = 0.001)

        include(JMtk15_test * "src/jMtkReadBlock_tst_1100.jl")
        databuf = jMtkReadBlock_tst_1100();
        @test typeof(databuf) == Matrix{UInt16}
        @test size(databuf) == (512, 128)
        @test transpose(databuf[291:294, 51:56]) == UInt16.([
                3576    3504    3416    3432
                3552    3604    3532    3424
                3528    3580    3576    3592
                3648    3612    3504    3556
                3708    3672    3612    3612
                3748    3652    3560    3592])

        include(JMtk15_test * "src/jMtkReadBlock_tst_1300.jl")
        databuf = jMtkReadBlock_tst_1300();
        @test typeof(databuf) == Matrix{UInt16}
        @test size(databuf) == (2048, 512)
        @test transpose(databuf[1261:1264, 214:220]) == UInt16.([
                3176    2900    2872    3176
                3112    2864    2908    3120
                2908    2856    2916    2988
                2964    2852    2964    2964
                2972    2924    3092    3004
                2976    2992    3192    3180
                3004    2936    3168    3596])

        include(JMtk15_test * "src/jMtkReadBlock_tst_1500.jl")
        databuf = jMtkReadBlock_tst_1500();
        @test typeof(databuf) == Matrix{UInt8}
        @test size(databuf) == (512, 128)
        @test transpose(databuf[187:191, 27:34]) == UInt8.([
                4   2   4   2   3
                4   3   4   2   2
                4   4   4   2   2
                4   3   3   2   4
                4   3   3   3   4
                4   3   3   0   4
                4   4   3   4   0
                4   0   3   4   4])

        include(JMtk15_test * "src/jMtkReadBlock_tst_2300.jl")
        databuf = jMtkReadBlock_tst_2300();
        @test typeof(databuf) == Matrix{Int8}
        @test size(databuf) == (512, 128)
        @test transpose(databuf[296:300, 91:97]) == Int8.([
                0   1   1   1   4
                1   4   0   4   4
                4   4   4   4   4
                3   3   4   0   4
                4   4   4   0   0
                1   1   4   2   1
                1   1   1   1   1])

        include(JMtk15_test * "src/jMtkReadBlock_tst_2500.jl")
        databuf = jMtkReadBlock_tst_2500();
        @test typeof(databuf) == Matrix{Float32}
        @test size(databuf) == (512, 128)
        idl_res = Float32.([
                1.16250     0.850000     0.850000
                1.10000      1.26667     0.850000
                1.10000      1.35000     0.850000
                1.10000     0.600000     0.850000
                1.25000      1.15000      1.20000
                0.850000      1.18333      1.10000
                1.35000     0.850000      1.10000
                -9999.00     -9999.00     0.850000]);
        jul_res = transpose(databuf[251:253, 61:68]);
        @test isapprox(idl_res, jul_res, atol = 0.001)
# ----------------------------------------------------------
    end
end