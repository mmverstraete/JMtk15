"""
    filename = jMtkMakeFilename(directory, product, camera, path, orbit, version)

# Purpose:
Return a MISR product file name given a base directory, product, camera, path, orbit,
   and version.  Pass an empty string for any unwanted fields, such as camera.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# WARNING: This function generates the correct filename but not the correct file extension
for NetCDF files (e.g., MISR AS_LAND or AEROSOLS products).

# Example:
```julia
julia> using JMtk15

julia> directory = "../Mtk_testdata/in/"
"../Mtk_testdata/in/"

julia> product = "GRP_ELLIPSOID_GM"
"GRP_ELLIPSOID_GM"

julia> camera = "AA"
"AA"

julia> path = 37
37

julia> orbit = 29058
29058

julia> version = "F03_0024"
"F03_0024"

julia> filename = jMtkMakeFilename(directory, product, camera, path, orbit, version)
"../Mtk_testdata/in/MISR_AM1_GRP_ELLIPSOID_GM_P037_O029058_AA_F03_0024.hdf"
```
"""
function jMtkMakeFilename(directory::AbstractString, product::AbstractString,
    camera::AbstractString, path::Number, orbit::Number, version::AbstractString)
    filename = Ref{Ptr{Cuchar}}()
    status = ccall((:MtkMakeFilename, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Cint, Cint, Cstring, Ref{Ptr{Cuchar}}),
        directory, product, camera, path, orbit, version, filename)
    if status != 0
        error("jMtkMakeFilename status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_filename = unsafe_string(filename[])
    return julia_filename
end
