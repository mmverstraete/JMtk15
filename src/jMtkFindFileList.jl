"""
    filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version)

# Purpose:
Return the file names found in a directory tree, using regular expressions.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# WARNING 1: This function does not currently work to locate `AGP` files because the C code always expects an orbit number, which is absent from the filename of AGP files.

# WARNING 2: This function does not currently work to locate `AS_LAND` files because the C code always assumes the file extension is `.hdf`, instead of `.nc` for NetCDF files.

# Note: The C function MtkFindFileList of Mtk requires the input arguments
    `path` and `orbit` to be provided as zero-padded strings (and NOT integers)
    of 3 and 6 characters, respectively, but this Julia wrapper function includes
    code to convert the usual integer inputs into the appropriate `Cstring`s.

# Example:
```julia
julia> using JMtk15

julia> search_dir = JMtk15_data * "MISR/"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/"

julia> product = "GRP_TERRAIN_GM"
"GRP_TERRAIN_GM"

julia> camera = ".*"
".*"

julia> path = 168
168

julia> orbit = 68050
68050

julia> version = "F03_0024"
"F03_0024"

julia> filecnt, filenames = jMtkFindFileList(search_dir, product, camera, path, orbit, version);

julia> filecnt
9

julia> filenames
9-element Vector{String}:
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_AN_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_CF_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_CA_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_DF_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_DA_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_AF_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_AA_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_BA_F03_0024.hdf"
 "/Users/michel/Codes/Julia/JMtk1" ⋯ 33 bytes ⋯ "GM_P168_O068050_BF_F03_0024.hdf"
```
"""
function jMtkFindFileList(search_dir::AbstractString, product::AbstractString, camera::AbstractString, path, orbit, version::AbstractString)
    if typeof(path) != String
        path = Base.cconvert(Cstring, lpad(path, 3, "0"))
    end
    if typeof(orbit) != String
        orbit = Base.cconvert(Cstring, lpad(orbit, 6, "0"))
    end
    filecnt = Ref{Cint}(0)
    filenames = Ref{Ptr{Ptr{UInt8}}}()
    status = ccall((:MtkFindFileList, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, Cstring, Cstring, Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}),
        search_dir, product, camera, path, orbit, version, filecnt, filenames)
    if status != 0
        error("jMtkFindFileList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_filenames = [unsafe_string(unsafe_load(filenames[], i)) for i in 1:filecnt[]]
    status = @ccall mtklib.MtkStringListFree(
        filecnt[]::Cint,
        filenames::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkFindFileList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return filecnt[], julia_filenames
end
