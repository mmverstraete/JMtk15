"""
    databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)

# Purpose:
Return 2-D array of MISR data given a file, grid, field, and region. The data
    returned is unscaled, unpacked or interpreted.  If a field is not packed
    or the fieldname parameter input string is preceded by the word “raw”,
    Mtk_ReadRaw is called and no unpacking, unscaling or interpreting is done.
    If the field has a flag associated with it the word “flag” can follow the
    fieldname parameter input string and the fields flag value is returned.
    Use Mtk_file_grid_to_fieldlist to get a complete list of field options
    for a given MISR product file and grid. The Mtk_ReadData routine always
    returns data on a MISR grid approximated by the region, no spatial
    interpolation is performed (only block assembly). 
    See Particulars below regarding extra dimensions in some fields.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Note:
* Respect the order of the variables `databuf.nsample` and `databuf.nline` when
retrieving the data buffer values from the double pointer returned by the `ccall`.

# Example:
```julia
julia> using JMtk15

julia> path = 168
168

julia> start_block = 110
110

julia> end_block = 110
110

julia> region = jMtkSetRegionByPathBlockRange(path, start_block, end_block)
MTKt_Region(MTKt_GeoCenter(MTKt_GeoCoord(-24.479478582488763, 32.028724322255464)), MTKt_Extent(70262.5, 281462.5))

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"

julia> gridname = "RedBand"
"RedBand"

julia> fieldname = "Red Radiance/RDQI"
"Red Radiance/RDQI"

julia> databuf, mapinfo = jMtkReadData(filename, gridname, fieldname, region)
(UInt16[0xffeb 0xffeb … 0xffeb 0xffeb; 0xffeb 0xffeb … 0xffeb 0xffeb; … ; 0xffeb 0xffeb … 0xffeb 0xffeb; 0xffeb 0xffeb … 0xffeb 0xffeb], MTKt_MapInfo(168, 110, 110, 275, 1, 512, 2048, JMtk15.MTK_TRUE, MTKt_SomRegion(168, MTKt_SomCoord(2.28080875e7, -634012.5), MTKt_SomCoord(2.287835e7, -352550.0), MTKt_SomCoord(2.29486125e7, -71087.5)), MTKt_GeoRegion(MTKt_GeoCoord(-23.58297245891216, 29.35011472257243), MTKt_GeoCoord(-24.064196594381425, 34.84872166826311), MTKt_GeoCoord(-24.479478582488763, 32.028724322255464), MTKt_GeoCoord(-25.327919099507437, 34.744282389822025), MTKt_GeoCoord(-24.84214182375054, 29.19112051959548)), MTKt_MisrProjParam(168, 22, -1, 12, [6.378137e6, -0.006694348, 0.0, 9.8018013752e7, -1.3001505477562232e8, 0.0, 0.0, 0.0, 98.88, 0.0, 0.0, 180.0, 0.0, 0.0, 0.0], [7.46075e6, 1.09065e6], [7.60155e6, 527450.0], 180, 512, 2048, Float32[0.0, 64.0, 0.0, 64.0, 0.0, 0.0, 0.0, 64.0, 0.0, 0.0  …  0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0, 0.0, 64.0, 0.0], 275)))

julia> typeof(databuf)
Matrix{UInt16} (alias for Array{UInt16, 2})

julia> size(databuf)
(2048, 512)

julia> Int.(databuf[1000:1005, 200:201])
6×2 Matrix{Int64}:
 5720  6024
 5844  6056
 5884  6004
 5988  6076
 5848  5920
 5724  5808
 ```

 where the function `Int` has been called to visualize decimal rather hexadecimal values,
    (this also turned the values into Int64 by default), and where the `.` operator
    indicates that the function can be vectorized, i.e., applied element-wise on all
    elements of the matrix.

 Note that there are two important differences between Julia and IDL:

 * Julia uses 1-based array indexing, and matrix elements are stored in row-major order (or, in the MISR parlance, line-priority, which is the typical convention in mathematics).

 * IDL uses 0-based array indexing, and matrix elements are stored in column-major order (or, in the MISR parlance, sample-priority, which is the "natural" order to generate output on a screen).

 As a result, a Julia matrix needs to be transposed to match an IDL matrix, and the indices of a sub-matrix must be 1-larger than those in an IDL matrix in each dimension. Conversely, the indices of an IDL sub-matrix must be 1-smaller than those in the Julia matrix in each dimension.

Compare the transposed matrix above

```julia
 julia> Int.(transpose(databuf[1000:1005, 200:201]))
2×6 Matrix{Int64}:
 5720  5844  5884  5988  5848  5724
 6024  6056  6004  6076  5920  5808
```
to the IDL results for the same inputs, with the indices adjusted:

```idl
IDL> path = 168
IDL> start_block = 110
IDL> end_block = 110
IDL> status = MTK_SETREGION_BY_PATH_BLOCKRANGE(path, start_block, end_block, region)
IDL> status
           0
IDL> filename = "/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
IDL> gridname = "RedBand"
IDL> fieldname = "Red Radiance/RDQI"
IDL> status = MTK_READDATA( filename, gridname, fieldname, region, databuf, mapinfo )
IDL> help, databuf
DATABUF         UINT      = Array[2048, 512]
IDL> databuf[999:1004, 199:200]
    5720    5844    5884    5988    5848    5724
    6024    6056    6004    6076    5920    5808
```
"""
function jMtkReadData(filename, gridname, fieldname, region)
    databuf = Ref{MTKt_DataBuffer}(MTKT_DATABUFFER_INIT)
    mapinfo = Ref{MTKt_MapInfo}(MTKT_MAPINFO_INIT)
    status = ccall((:MtkReadData, mtklib),
        Cint,
        (Cstring, Cstring, Cstring, MTKt_Region, Ptr{MTKt_DataBuffer}, Ptr{MTKt_MapInfo}),
        filename, gridname, fieldname, region, databuf, mapinfo)
    if status != 0
        error("jMtkReadData status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    nl = databuf[].nline
    ns = databuf[].nsample
    dt = databuf[].datatype
    r = databuf[].dataptr

    # Note: `dt = databuf[].datatype` is set by the C function to one of the `MTKe_xxx` labels defined in "MisrUtil_h.jl", not to one of the types recognizable by Julia, such as UInt8 or UInt16. The following if statement defines a variable `ct` of the appropriate type `dt`, and this value is used in the `unsafe_wrap` statement to keep the data in the designated type.

    if dt == MTKe_char8
        ct = Cchar
    elseif dt == MTKe_uchar8
        ct = Cuchar
    elseif dt == MTKe_int8
        ct = Int8
    elseif dt == MTKe_uint8
        ct = UInt8
    elseif dt == MTKe_int16
        ct = Int16
    elseif dt == MTKe_uint16
        ct = UInt16
    elseif dt == MTKe_int32
        ct = Int32
    elseif dt == MTKe_uint32
        ct = UInt32
    elseif dt == MTKe_int64
        ct = Int64
    elseif dt == MTKe_uint64
        ct = UInt64
    elseif dt == MTKe_float
        ct = Float32
    elseif dt == MTKe_double
        ct = Float64
    else
        error("jMtkReadData: Type not supported in translation.")
    end

    GC.@preserve databuf begin
        julia_databuf = unsafe_wrap(Array, Ptr{ct}(r), (ns, nl); own = true)
    end

    return julia_databuf, mapinfo[]
end
