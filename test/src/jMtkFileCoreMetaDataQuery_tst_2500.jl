"""
    nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_2500()

# Purpose:
Generate the output of `jMtkFileCoreMetaDataQuery` for testing purposes. Test 2500: For a MISR `AS_LAND` file.

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
IDL> status = MTK_FILE_COREMETADATA_QUERY(filename, nparams, paramlist)
IDL> PRINT, nparams
          38
IDL> PRINT, paramlist
LOCALGRANULEID PRODUCTIONDATETIME LOCALVERSIONID PGEVERSION MEASUREDPARAMETERCONTAINER
    PARAMETERNAME AUTOMATICQUALITYFLAG AUTOMATICQUALITYFLAGEXPLANATION QAPERCENTMISSINGDATA
    ORBITCALCULATEDSPATIALDOMAINCONTAINER ORBITNUMBER EQUATORCROSSINGLONGITUDE
    EQUATORCROSSINGTIME EQUATORCROSSINGDATE SHORTNAME VERSIONID INPUTPOINTER GPOLYGONCONTAINER
    EXCLUSIONGRINGFLAG GRINGPOINTLATITUDE GRINGPOINTLONGITUDE GRINGPOINTSEQUENCENO
    RANGEBEGINNINGTIME RANGEENDINGTIME RANGEBEGINNINGDATE RANGEENDINGDATE
    ADDITIONALATTRIBUTESCONTAINER ADDITIONALATTRIBUTENAME PARAMETERVALUE
    ADDITIONALATTRIBUTESCONTAINER ADDITIONALATTRIBUTENAME PARAMETERVALUE
    ADDITIONALATTRIBUTESCONTAINER ADDITIONALATTRIBUTENAME PARAMETERVALUE
    ADDITIONALATTRIBUTESCONTAINER ADDITIONALATTRIBUTENAME PARAMETERVALUE
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_2500.jl")
jMtkFileCoreMetaDataQuery_tst_2500

julia> nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_2500();

julia> @test nparams == 38
Test Passed

julia> @test paramlist[3:7] == ["LOCALVERSIONID", "PGEVERSION",
    "MEASUREDPARAMETERCONTAINER", "PARAMETERNAME", "AUTOMATICQUALITYFLAG"]
Test Passed

julia> @test paramlist[25:28] == ["RANGEBEGINNINGDATE", "RANGEENDINGDATE",
    "ADDITIONALATTRIBUTESCONTAINER", "ADDITIONALATTRIBUTENAME"]
Test Passed

julia> @test paramlist[36:38] == ["ADDITIONALATTRIBUTESCONTAINER",
    "ADDITIONALATTRIBUTENAME", "PARAMETERVALUE"]
Test Passed
```
"""
function jMtkFileCoreMetaDataQuery_tst_2500()
    filename = JMtk15_data * "MISR/MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc"
    nparams, paramlist = jMtkFileCoreMetaDataQuery(filename);
    return nparams, paramlist
end
