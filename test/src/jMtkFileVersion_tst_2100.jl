"""
    fversion = jMtkFileVersion_tst_160()

# Purpose:
Generate the output of `jMtkFileVersion` for testing purposes. Test 160: For a MISR `TC_CLASSIFIERS` file.

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
IDL> filename = root + 'MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf'
IDL> status = MTK_FILE_VERSION(filename, fversion)
IDL> PRINT, fversion
F07_0012
```

# Example:
```julia
julia> using JMtk15

julia> using Test

julia> include(JMtk15_test * "src/jMtkFileVersion_tst_160.jl")
jMtkFileVersion_tst_160

julia> fversion = jMtkFileVersion_tst_160();

julia> @test fversion == "F07_0012"
Test Passed
```
"""
function jMtkFileVersion_tst_160()
    filename = JMtk15_data * "MISR/MISR_AM1_TC_CLASSIFIERS_P168_O068050_F07_0012.hdf"
    fversion = jMtkFileVersion(filename)
    return fversion
end
