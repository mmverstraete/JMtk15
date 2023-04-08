"""
    nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_0100()

# Purpose:
Generate the output of `jMtkFileCoreMetaDataQuery` for testing purposes. Test 0100: For a MISR `AGP` file.

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
IDL> filename = root + 'MISR_AM1_AGP_P168_F01_24.hdf'
IDL> status = MTK_FILE_COREMETADATA_QUERY(filename, nparams, paramlist)
IDL> PRINT, nparams
          24
IDL> PRINT, paramlist
LOCALGRANULEID PRODUCTIONDATETIME LOCALVERSIONID PGEVERSION VERSIONID
    SHORTNAME GPOLYGONCONTAINER GRINGPOINTLONGITUDE GRINGPOINTLATITUDE
    GRINGPOINTSEQUENCENO EXCLUSIONGRINGFLAG RANGEENDINGDATE RANGEENDINGTIME
    RANGEBEGINNINGDATE RANGEBEGINNINGTIME ADDITIONALATTRIBUTESCONTAINER
    ADDITIONALATTRIBUTENAME PARAMETERVALUE ADDITIONALATTRIBUTESCONTAINER
    ADDITIONALATTRIBUTENAME PARAMETERVALUE ADDITIONALATTRIBUTESCONTAINER
    ADDITIONALATTRIBUTENAME PARAMETERVALUE
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_0100.jl")
jMtkFileCoreMetaDataQuery_tst_0100

julia> nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_0100();

julia> @test nparams == 24
Test Passed

julia> @test paramlist[1:5] == ["LOCALGRANULEID", "PRODUCTIONDATETIME",
    "LOCALVERSIONID", "PGEVERSION", "VERSIONID"]
Test Passed

julia> @test paramlist[10:14] == ["GRINGPOINTSEQUENCENO", "EXCLUSIONGRINGFLAG",
    "RANGEENDINGDATE", "RANGEENDINGTIME", "RANGEBEGINNINGDATE"]
Test Passed

julia> @test paramlist[20:24] == ["ADDITIONALATTRIBUTENAME", "PARAMETERVALUE",
    "ADDITIONALATTRIBUTESCONTAINER", "ADDITIONALATTRIBUTENAME", "PARAMETERVALUE"]
Test Passed
```
"""
function jMtkFileCoreMetaDataQuery_tst_0100()
    filename = JMtk15_data * "MISR/MISR_AM1_AGP_P168_F01_24.hdf"
    nparams, paramlist = jMtkFileCoreMetaDataQuery(filename);
    return nparams, paramlist
end
