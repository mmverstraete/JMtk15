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
        @test filetype == "TC_CLOUD"
    
        include(JMtk15_test * "src/jMtkFileType_tst_170.jl")
        filetype = jMtkFileType_tst_170();
        @test filetype == "AS_LAND"
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
        @test lgid == "MISR_AM1_TC_CLOUD_P168_O068050_F01_0001.hdf"

        include(JMtk15_test * "src/jMtkFileLGID_tst_170.jl")
        lgid = jMtkFileLGID_tst_170();
        @test lgid == "MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
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
        @test fversion == "F01_0001"

        include(JMtk15_test * "src/jMtkFileVersion_tst_170.jl")
        fversion = jMtkFileVersion_tst_170();
        @test fversion == "F08_0023"

    end
# =============================================================================



end