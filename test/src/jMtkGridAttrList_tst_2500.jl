"""
    nattrs, attrlist = jMtkGridAttrList_tst_2500()

# Purpose:
Generate the output of `jMtkGridAttrList` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> status = MTK_GRIDATTR_LIST(filename, gridname, attrcnt, attrlist)
IDL> PRINT, attrcnt
           4
IDL> PRINT, attrlist
GCTP_projection_parameters resolution_in_meters block_size_in_lines block_size_in_samples
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkGridAttrList_tst_2500.jl")
jMtkGridAttrList_tst_2500

julia> nattrs, attrlist = jMtkGridAttrList_tst_2500();

julia> @test nattrs == 4
Test Passed

julia> @test attrlist == ["GCTP_projection_parameters", "resolution_in_meters", "block_size_in_lines", "block_size_in_samples"]
Test Passed
```
"""
function jMtkGridAttrList_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    gridname = "4.4_KM_PRODUCTS"
    nattrs, attrlist = jMtkGridAttrList(filename, gridname)
    return nattrs, attrlist
end
