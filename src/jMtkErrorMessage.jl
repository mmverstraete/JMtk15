"""
    errmsg = jMtkErrorMessage(status)

# Purpose:
Report the error message corresponding to the specified status code.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15).

# Examples:
```julia
julia> using JMtk15

julia> status = 0
0

julia> errmsg = jMtkErrorMessage(status)
"SUCCESS"

julia> status = 3
3

julia> errmsg = jMtkErrorMessage(status)
"BAD ARGUMENT"
```
"""
function jMtkErrorMessage(status)
    return MTK_ERR_DESC[status + 1]
end
