"""
    proj_params = jMtkPathToProjParam_tst_1()

# Purpose:
Generate the output of `jMtkPathToProjParam` for testing purposes.

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
IDL> path = 160
IDL> resolution = 275
IDL> status = MTK_PATH_TO_PROJPARAM(path, resolution, proj_params)
IDL> PRINT, proj_params.path
         160
IDL> PRINT, proj_params.projcode
                    22
IDL> PRINT, proj_params.zonecode
                    -1
IDL> PRINT, proj_params.spherecode
                    12
IDL> PRINT, proj_params.projparam[0:4]
       6378137.0   -0.0066943480       0.0000000       98018014.  -1.1705402e+08
IDL> PRINT, proj_params.ulc_block1
       7460750.0       1090650.0
IDL> PRINT, proj_params.lrc_block1
       7601550.0       527450.00
IDL> PRINT, proj_params.reloffset[1]
      64.0000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkPathToProjParam_tst_1.jl")
jMtkPathToProjParam_tst_1

julia> proj_params = jMtkPathToProjParam_tst_1();

julia> @test proj_params.path == 160
Test Passed

julia> @test proj_params.projcode == 22
Test Passed

julia> @test proj_params.zonecode == -1
Test Passed

julia> @test proj_params.spherecode == 12
Test Passed

julia> @test proj_params.projparam[1:5] == [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.1705401692154506e8]
Test Passed

julia> @test proj_params.ulc == [7.46075e6, 1.09065e6]
Test Passed

julia> @test proj_params.lrc == [7.60155e6, 527450.0]
Test Passed

julia> @test proj_params.reloffset[2] == 64.0
Test Passed
```
"""
function jMtkPathToProjParam_tst_1()
    path = 160
    resolution = 275
    proj_params = jMtkPathToProjParam(path, resolution)
    return proj_params
end
