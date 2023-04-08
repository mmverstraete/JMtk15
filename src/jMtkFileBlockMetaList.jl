"""
    nblockmeta, blockmetalist = jMtkFileBlockMetaList(filename)

# Purpose:
List block metadata of a file.

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"

julia> nblockmeta, blockmetalist = jMtkFileBlockMetaList(filename);

julia> nblockmeta
3

julia> blockmetalist
3-element Vector{String}:
 "PerBlockMetadataCommon"
 "PerBlockMetadataRad"
 "PerBlockMetadataTime"
```
"""
function jMtkFileBlockMetaList(filename::AbstractString)
    nblockmeta = Ref{Cint}(0)
    blockmetalist = Ref{Ptr{Ptr{Cuchar}}}()
    status = ccall((:MtkFileBlockMetaList, mtklib),
        Cint,
        (Cstring, Ptr{Cint}, Ptr{Ptr{Ptr{Cuchar}}}),
        filename, nblockmeta, blockmetalist)
    if status != 0
        error("jMtkFileBlockMetaList status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    julia_blockmetalist = [Base.unsafe_string(Base.unsafe_load(blockmetalist[], i)) for i in 1:nblockmeta[]]
    status = @ccall mtklib.MtkStringListFree(
        nblockmeta[]::Cint,
        blockmetalist::Ref{Ptr{Ptr{Cuchar}}})::Cint
    if status != 0
        error("jMtkFileBlockMetaList: MtkStringListFree status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return nblockmeta[], julia_blockmetalist
end
