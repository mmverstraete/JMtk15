"""
    data = jMtkReadBlock_tst_2500()

# Purpose:
Generate the output of `jMtkReadBlock` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> fieldname = 'Leaf_Area_Index_Best_Estimate'
IDL> blocknum = 109
IDL> status = MTK_READBLOCK(filename, gridname, fieldname, blocknum, data)
IDL> SIZE(data)
           2         512         128           4       65536
IDL> PRINT, data[250:252, 60:67]
      1.16250     0.850000     0.850000
      1.10000      1.26667     0.850000
      1.10000      1.35000     0.850000
      1.10000     0.600000     0.850000
      1.25000      1.15000      1.20000
     0.850000      1.18333      1.10000
      1.35000     0.850000      1.10000
     -9999.00     -9999.00     0.850000
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkReadBlock_tst_2500.jl")
jMtkReadBlock_tst_2500

julia> data = jMtkReadBlock_tst_2500();

julia> @test typeof(data) == Matrix{Float32}
Test Passed

julia> @test size(data) == (512, 128)
Test Passed

julia> idl_res = Float32.([1.16250     0.850000     0.850000
       1.10000      1.26667     0.850000
       1.10000      1.35000     0.850000
       1.10000     0.600000     0.850000
       1.25000      1.15000      1.20000
       0.850000      1.18333      1.10000
       1.35000     0.850000      1.10000
       -9999.00     -9999.00     0.850000]);

julia> jul_res = transpose(data[251:253, 61:68]);

julia> @test isapprox(idl_res, jul_res, atol = 0.001)
Test Passed
```
"""
function jMtkReadBlock_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "1.1_KM_PRODUCTS"
    fieldname = "Leaf_Area_Index_Best_Estimate"
    blocknum = 109
    data = jMtkReadBlock(filename, gridname, fieldname, blocknum)
    return data
end
