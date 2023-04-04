using JMtk15
using Test

# ==========================================================================================
@testset "JMtk15.jl" begin
    @testset "Util" begin
# ---------------------------------------------------------- jMtkVersion
        include(JMtk15_test * "src/jMtkVersion_tst.jl")
        @test jMtkVersion_tst() == "1.5.0"
# ---------------------------------------------------------- jMtkErrorMessage
        include(JMtk15_test * "src/jMtkErrorMessage_tst_00.jl")
        errmsg = jMtkErrorMessage_tst_00();
        @test errmsg == "SUCCESS"

        include(JMtk15_test * "src/jMtkErrorMessage_tst_10.jl")
        errmsg = jMtkErrorMessage_tst_10();
        @test errmsg == "MALLOC FAILED"

        include(JMtk15_test * "src/jMtkErrorMessage_tst_18.jl")
        errmsg = jMtkErrorMessage_tst_18();
        @test errmsg == "MISR FORWARD PROJECTION FAILED"

        include(JMtk15_test * "src/jMtkErrorMessage_tst_74.jl")
        errmsg = jMtkErrorMessage_tst_74();
        @test errmsg == "INVALID ERROR CODE"
        # -------------------------------------------------- jMtkDateTimeToJulian
        include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_1.jl")
        juldate = jMtkDateTimeToJulian_tst_1();
        @test (juldate - 2452396.58333) < 0.0001

        include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_2.jl")
        juldate = jMtkDateTimeToJulian_tst_2();
        @test (juldate - 2452396.58333) < 0.0001

        include(JMtk15_test * "src/jMtkDateTimeToJulian_tst_3.jl")
        juldate = jMtkDateTimeToJulian_tst_3();
        @test (juldate - 2453728.27312) < 0.0001
# ---------------------------------------------------------- jMtkJulianToDateTime
        include(JMtk15_test * "src/jMtkJulianToDateTime_tst_1.jl")
        datetime = jMtkJulianToDateTime_tst_1();
        @test datetime == "2002-05-02T02:00:00Z"

        include(JMtk15_test * "src/jMtkJulianToDateTime_tst_2.jl")
        datetime = jMtkJulianToDateTime_tst_2();
        @test datetime == "2022-06-13T12:15:18Z"
    end
# ==========================================================================================
    @testset "FileQuery" begin
# ---------------------------------------------------------- jMtkFileType
        include(JMtk15_test * "src/jMtkFileType_tst_110.jl")
        filetype = jMtkFileType_tst_110();
        @test filetype == "AGP"
    
        include(JMtk15_test * "src/jMtkFileType_tst_120.jl")
        filetype = jMtkFileType_tst_120();
        @test filetype == "GP_GMP"
    
        include(JMtk15_test * "src/jMtkFileType_tst_130.jl")
        filetype = jMtkFileType_tst_130();
        @test filetype == "GRP_RCCM"
    
        include(JMtk15_test * "src/jMtkFileType_tst_140.jl")
        filetype = jMtkFileType_tst_140();
        @test filetype == "GRP_ELLIPSOID_GM"
    
        include(JMtk15_test * "src/jMtkFileType_tst_150.jl")
        filetype = jMtkFileType_tst_150();
        @test filetype == "GRP_TERRAIN_GM"
            
        include(JMtk15_test * "src/jMtkFileType_tst_160.jl")
        filetype = jMtkFileType_tst_160();
        @test filetype == "TC_CLASSIFIERS"
    
        include(JMtk15_test * "src/jMtkFileType_tst_170.jl")
        filetype = jMtkFileType_tst_170();
        @test filetype == "AS_LAND"

        include(JMtk15_test * "src/jMtkFileType_tst_180.jl")
        filetype = jMtkFileType_tst_180();
        @test filetype == "AS_AEROSOL"
    # ------------------------------------------------------ jMtkFileLGID
        include(JMtk15_test * "src/jMtkFileLGID_tst_110.jl")
        lgid = jMtkFileLGID_tst_110();
        @test lgid == "MISR_AM1_AGP_P168_F01_24.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_120.jl")
        lgid = jMtkFileLGID_tst_120();
        @test lgid == "MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_130.jl")
        lgid = jMtkFileLGID_tst_130();
        @test lgid == "MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_140.jl")
        lgid = jMtkFileLGID_tst_140();
        @test lgid == "MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_DF_F03_0024.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_150.jl")
        lgid = jMtkFileLGID_tst_150();
        @test lgid == "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_160.jl")
        lgid = jMtkFileLGID_tst_160();
        @test lgid == "MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_170.jl")
        lgid = jMtkFileLGID_tst_170();
        @test lgid == "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"

        include(JMtk15_test * "src/jMtkFileLGID_tst_180.jl")
        lgid = jMtkFileLGID_tst_180();
        @test lgid == "MISR_AM1_AS_AEROSOL_P168_O068050_F13_0023.nc"
# ---------------------------------------------------------- jMtkFileVersion
        include(JMtk15_test * "src/jMtkFileVersion_tst_110.jl")
        fversion = jMtkFileVersion_tst_110();
        @test fversion == "F01_24"

        include(JMtk15_test * "src/jMtkFileVersion_tst_120.jl")
        fversion = jMtkFileVersion_tst_120();
        @test fversion == "F03_0013"

        include(JMtk15_test * "src/jMtkFileVersion_tst_130.jl")
        fversion = jMtkFileVersion_tst_130();
        @test fversion == "F04_0025"

        include(JMtk15_test * "src/jMtkFileVersion_tst_140.jl")
        fversion = jMtkFileVersion_tst_140();
        @test fversion == "F03_0024"

        include(JMtk15_test * "src/jMtkFileVersion_tst_150.jl")
        fversion = jMtkFileVersion_tst_150();
        @test fversion == "F03_0024"

        include(JMtk15_test * "src/jMtkFileVersion_tst_160.jl")
        fversion = jMtkFileVersion_tst_160();
        @test fversion == "F07_0012"

        include(JMtk15_test * "src/jMtkFileVersion_tst_170.jl")
        fversion = jMtkFileVersion_tst_170();
        @test fversion == "F08_0023"

        include(JMtk15_test * "src/jMtkFileVersion_tst_180.jl")
        fversion = jMtkFileVersion_tst_180();
        @test fversion == "F13_0023"
# ---------------------------------------------------------- jMtkFileAttrList
        include(JMtk15_test * "src/jMtkFileAttrList_tst_110.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_110();
        @test attrcnt == 28
        @test attrlist[1:4] == ["StructMetadata.0", "Translation.number_id", "Translation.land_water_id", "Translation.dark_water_mask"]
        @test attrlist[16:19] == ["SOM_parameters.som_orbit.gama", "SOM_parameters.som_orbit.nrev", "SOM_parameters.som_orbit.ro", "SOM_parameters.som_orbit.i"]
        @test attrlist[25:28] == ["Origin_block.lrc.y", "Start_block", "End block", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_120.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_120();
        @test attrcnt == 30
        @test attrlist[1:4] == ["HDFEOSVersion", "StructMetadata.0", "coremetadata", "Path_number"]
        @test attrlist[18:21] == ["SOM_parameters.som_orbit.i", "SOM_parameters.som_orbit.P2P1", "SOM_parameters.som_orbit.lambda0", "Origin_block.ulc.x"]
        @test attrlist[27:30] == ["Cam_mode", "Num_local_modes", "Local_mode_site_name", "Orbit_QA"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_130.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_130();
        @test attrcnt == 31
        @test attrlist[3:6] == ["Path_number", "AGP_version_id", "DID_version_id", "Number_blocks"]
        @test attrlist[20:23] == ["Origin_block.ulc.x", "Origin_block.ulc.y", "Origin_block.lrc.x", "Origin_block.lrc.y"]
        @test attrlist[28:31] == ["Local_mode_site_name", "Orbit_QA", "Camera", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_140.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_140();
        @test attrcnt == 31
        @test attrlist[4:7] == ["AGP_version_id", "DID_version_id", "Number_blocks", "Ocean_blocks_size"]
        @test attrlist[19:22] == ["SOM_parameters.som_orbit.lambda0", "Origin_block.ulc.x", "Origin_block.ulc.y", "Origin_block.lrc.x"]
        @test attrlist[28:31] == ["Local_mode_site_name", "Orbit_QA", "Camera", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_150.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_150();
        @test attrcnt == 31
        @test attrlist[6:9] == ["Number_blocks", "Ocean_blocks_size", "Ocean_blocks.count", "Ocean_blocks.numbers"]
        @test attrlist[16:19] == ["SOM_parameters.som_orbit.ro", "SOM_parameters.som_orbit.i", "SOM_parameters.som_orbit.P2P1", "SOM_parameters.som_orbit.lambda0"]
        @test attrlist[27:30] == ["Num_local_modes", "Local_mode_site_name", "Orbit_QA", "Camera"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_160.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_160();
        @test attrcnt == 30
        @test attrlist[8:11] == ["Ocean_blocks.count", "Ocean_blocks.numbers", "SOM_parameters.som_ellipsoid.a", "SOM_parameters.som_ellipsoid.e2"]
        @test attrlist[21:24] == ["Origin_block.ulc.y", "Origin_block.lrc.x", "Origin_block.lrc.y", "Start_block"]
        @test attrlist[27:30] == ["Num_local_modes", "Local_mode_site_name", "Orbit_QA", "coremetadata"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_170.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_170();
        @test attrcnt == 88
        @test attrlist[1:5] == ["Path_number", "AGP_version_id", "DID_version_id", "Number_blocks", "Ocean_blocks_size"]
        @test attrlist[41:45] == ["title", "institution", "source", "history", "references"]
        @test attrlist[85:88] == ["config.sim.enable", "config.sim.surface_type", "config.SurfaceRetrieval.use_smoothed_aod", "config.underlight_albedo"]

        include(JMtk15_test * "src/jMtkFileAttrList_tst_180.jl")
        attrcnt, attrlist = jMtkFileAttrList_tst_180();
        @test attrcnt == 144
        @test attrlist[1:3] == ["Path_number", "AGP_version_id", "DID_version_id"]
        @test attrlist[25] == "SOM_map_maximum_corner.y"
        @test attrlist[130] == "config.het_bias_pixel_mode"
        @test attrlist[144] == "config.GeographicExclusions.latitude.0"
# ---------------------------------------------------------- jMtkGridAttrList
        include(JMtk15_test * "src/jMtkGridAttrList_tst_110.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_110();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_120.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_120();
        @test nattrs == 5
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y", "SunDistanceAU"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_130.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_130();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]
        include(JMtk15_test * "src/jMtkGridAttrList_tst_140.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_140();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_150.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_150();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_160.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_160();
        @test nattrs == 4
        @test attrlist == ["Block_size.resolution_x", "Block_size.resolution_y", "Block_size.size_x", "Block_size.size_y"]

        include(JMtk15_test * "src/jMtkGridAttrList_tst_170.jl")
        nattrs, attrlist = jMtkGridAttrList_tst_170();
        @test nattrs == 4
        @test attrlist == ["GCTP_projection_parameters", "resolution_in_meters", "block_size_in_lines", "block_size_in_samples"]

    end
# =============================================================================



end