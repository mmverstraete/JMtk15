"""
    timedata = jMtkTimeMetaRead(filename)

# Purpose:
Retrieve time metadata from a L1B2 Ellipsoid file for use with MTK_PIXEL_TIME().

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

julia> filename = JMtk15_data * "MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"
"/Users/michel/Codes/Julia/JMtk15/data/MISR/MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_AA_F03_0024.hdf"

julia> timedata = jMtkTimeMetaRead(filename);

julia> timedata.path
168

julia> timedata.start_block
19

julia> timedata.end_block
162

julia> String(timedata.camera)
"AA\0"

julia> timedata.number_transform[21]
2

julia> String(timedata.ref_time[21][1])
"2012-10-03T07:35:53.095920Z\0"

julia> String(timedata.ref_time[21][2])
"2012-10-03T07:35:53.095920Z\0"

julia> timedata.start_line[21]
2-element SVector{2, Int32} with indices SOneTo(2):
 9728
 9984

julia> timedata.number_line[21]
2-element SVector{2, Int32} with indices SOneTo(2):
 256
 256

julia> timedata.coeff_line[21]
6-element SVector{6, SVector{2, Float64}} with indices SOneTo(6):
 [311.20982008795704, 564.4506720815277]
 [0.9892057028398691, 0.9892008370019263]
 [-0.0034406040991434668, -0.004145231498701379]
 [1.0405266101925396e-5, 1.0395209103053846e-5]
 [-2.713647898637805e-6, -2.680038331177734e-6]
 [-3.664583734230783e-11, -1.70330365933894e-11]

julia> timedata.som_ctr_x[21]
2-element SVector{2, Float64} with indices SOneTo(2):
  9856.0
 10112.0

julia> timedata.som_ctr_y[21]
2-element SVector{2, Float64} with indices SOneTo(2):
 1024.0
 1024.0
```
"""
function jMtkTimeMetaRead(filename)
    timedata = Ref{MTKt_TimeMetaData}(MTKT_TIME_METADATA_INIT)
    status = ccall((:MtkTimeMetaRead, mtklib),
        Cint,
        (Cstring, Ptr{MTKt_TimeMetaData}),
        filename, timedata)
    if status != 0
        error("jMtkTimeMetaRead status = ", status,
            ", error message = ", jMtkErrorMessage(status))
    end
    return timedata[]
end
