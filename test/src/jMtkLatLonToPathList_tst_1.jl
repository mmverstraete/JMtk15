"""
    path_cnt, path_list = jMtkLatLonToPathList_tst_1()

# Purpose:
Generate the output of `jMtkLatLonToPathList` for testing purposes.

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
IDL> latitude = 66.121646
IDL> longitude = 89.263022
IDL> status = MTK_LATLON_TO_PATHLIST(latitude, longitude, path_cnt, path_list)
IDL> PRINT, path_cnt
          17
IDL> PRINT, path_list
        7    8    9    10    11    12    13    14    146    147    148    149    150    151    152    153    154
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkLatLonToPathList_tst_1.jl")
jMtkLatLonToPathList_tst_1

julia> path_cnt, path_list = jMtkLatLonToPathList_tst_1();

julia> @test path_cnt == 17
Test Passed

julia> @test path_list == [7, 8, 9, 10, 11, 12, 13, 14, 146, 147, 148, 149, 150, 151, 152, 153, 154]
Test Passed
```
"""
function jMtkLatLonToPathList_tst_1()
    latitude = 66.121646
    longitude = 89.263022
    path_cnt, path_list = jMtkLatLonToPathList(latitude, longitude)
    return path_cnt, path_list
end
