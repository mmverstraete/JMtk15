"""
    attrval = jMtkFileAttrGet_tst_1500()

# Purpose:
Generate the output of `jMtkFileAttrGet` for testing purposes. Test 1500: For a MISR `GRP_RCCM_GM` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-04).

# Verification:
```idl
IDL> filename = root + "MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf"
IDL> attrname = "SOM_parameters.som_ellipsoid.a"
IDL> status = MTK_FILEATTR_GET(filename, attrname, attrval)
IDL> PRINT, attrval
       6378137.0
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileAttrGet_tst_1500.jl")
jMtkFileAttrGet_tst_1500

julia> attrval = jMtkFileAttrGet_tst_1500();

julia> @test attrval == 6378137.0
Test Passed
```
"""
function jMtkFileAttrGet_tst_1500()
    filename = JMtk15_data * "MISR/MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf"
    attrname = "SOM_parameters.som_ellipsoid.a"
    attrval = jMtkFileAttrGet(filename, attrname)
    return attrval
end
