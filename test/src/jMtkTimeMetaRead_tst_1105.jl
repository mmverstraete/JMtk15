"""
    timedata = jMtkTimeMetaRead_tst_1105()

# Purpose:
Generate the output of `jMtkTimeMetaRead` for testing purposes. Test 1105: For a MISR `GRP_ELLIPSOID_GM` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-10).

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkTimeMetaRead_tst_1105.jl")
jMtkTimeMetaRead_tst_1105

julia> timedata = jMtkTimeMetaRead_tst_1105();

julia> @test timedata.path == 168
Test Passed

julia> @test timedata.start_block == 19
Test Passed

julia> @test timedata.end_block == 162
Test Passed

julia> @test String(timedata.camera) == "AN\0"
Test Passed

julia> @test timedata.number_transform[21] == 2
Test Passed

julia> @test String(timedata.ref_time[21][1]) == "2012-10-03T07:35:06.093760Z\0"
Test Passed

julia> @test String(timedata.ref_time[21][2]) == "2012-10-03T07:35:06.093760Z\0"
Test Passed

julia> @test timedata.start_line[21] == Int32[9728, 9984]
Test Passed

julia> @test timedata.number_line[21] == Int32[256, 256]
Test Passed

julia> @test timedata.coeff_line[21][1][1] == 343.63912818600835
Test Passed

julia> @test timedata.coeff_line[21][1][2] == 596.8625892179571
Test Passed

julia> @test timedata.coeff_line[21][2][1] == 0.9891433525445832
Test Passed

julia> @test timedata.coeff_line[21][2][2] == 0.9891625570665201
Test Passed

julia> @test timedata.coeff_line[21][3][1] == -0.0004884364332011053
Test Passed

julia> @test timedata.coeff_line[21][3][2] == -0.0012594304174612728
Test Passed

julia> @test timedata.coeff_line[21][4][1] == -3.1505301908925205e-8
Test Passed

julia> @test timedata.coeff_line[21][4][2] == 8.304457205878514e-9
Test Passed

julia> @test timedata.coeff_line[21][5][1] == -2.8275584372222565e-6
Test Passed

julia> @test timedata.coeff_line[21][5][2] == -2.9153112097163063e-6
Test Passed

julia> @test timedata.coeff_line[21][6][1] == -3.644407914887632e-11
Test Passed

julia> @test timedata.coeff_line[21][6][2] == 3.756058009214872e-11
Test Passed
```
"""
function jMtkTimeMetaRead_tst_1105()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AN_F03_0024.hdf"
    timedata = jMtkTimeMetaRead(filename)
    return timedata
end
