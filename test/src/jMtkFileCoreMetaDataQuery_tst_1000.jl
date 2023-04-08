"""
    nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_1000()

# Purpose:
Generate the output of `jMtkFileCoreMetaDataQuery` for testing purposes. Test 1000: For a MISR `GP_GMP` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Verification:
WARNING: The following commands cause IDL to crash and quit!
```idl
IDL> filename = root + 'MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf'
IDL> status = MTK_FILE_COREMETADATA_QUERY(filename, nparams, paramlist)
[crash]
IDL> PRINT, nparams
          xxx
IDL> PRINT, paramlist
        yyy
```

# Example:
WARNING: The following commands cause Julia to generate a "signal (11): Segmentation fault: 11"... and crash!
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileCoreMetaDataQuery_tst_1000.jl")
jMtkFileCoreMetaDataQuery_tst_1000

julia> nparams, paramlist = jMtkFileCoreMetaDataQuery_tst_1000();

[crash]

julia> @test nparams == ?
Test Passed

julia> @test paramlist[1] == ?
Test Passed

julia> @test paramlist[7] == ?
Test Passed
```
"""
function jMtkFileCoreMetaDataQuery_tst_1000()
    filename = JMtk15_data * "MISR/MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"
    nparams, paramlist = jMtkFileCoreMetaDataQuery(filename);
    return nparams, paramlist
end
