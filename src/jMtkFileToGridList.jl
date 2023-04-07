"""
    gridlist = jMtkFileToGridList(filename)

# Purpose:
Return a list of grid names for a MISR product file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Example:
```julia
julia> using JMtk15

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
"./data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"

julia> ngrids, gridlist = jMtkFileToGridList(filename);

julia> ngrids
6

julia> gridlist
6-element Vector{String}:
 "BlueBand"
 "GreenBand"
 "RedBand"
 "NIRBand"
 "BRF Conversion Factors"
 "GeometricParameters"
```
"""
function jMtkFileToGridList(filename::AbstractString)
    ngrids = Ref{Cint}(0)
    gridlist = Ref{Ptr{Ptr{UInt8}}}()
    status = ccall((:MtkFileToGridList, mtklib),
        Cint,
        (Cstring, Ref{Cint}, Ref{Ptr{Ptr{UInt8}}}),
        filename, ngrids, gridlist)
    if status != 0
        error("jMtkFileToGridList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_gridlist = [unsafe_string(unsafe_load(gridlist[], i)) for i in 1:ngrids[]]
    status = @ccall mtklib.MtkStringListFree(
        ngrids[]::Cint,
        gridlist::Ref{Ptr{Ptr{UInt8}}})::Cint
    if status != 0
        error("jMtkFileToGridList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return ngrids[], julia_gridlist
end
