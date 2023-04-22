"""
    include(JMtk15_src * "include/MisrToolkit_h.jl")

Partial translation of the symbols defined in the C file "MisrToolkit.h" of Mtk.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia wrapper: Version 0.1.0 (2023-02-15)

# Note:
* See the original file for additional details and in-line comments.

# Example:
```julia
julia> using JMtk15

julia> include(JMtk15_src * "src/include/MisrToolkit_h.jl")
```
"""
# Current version identifier of Mtk:
const MTK_VERSION = "1.5.0"
export MTK_VERSION
