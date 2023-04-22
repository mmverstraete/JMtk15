"""
    include(JMtk15_src * "include/MisrRegression_h.jl")

Partial translation of the symbols defined in the C file "MisrRegression.h" of Mtk.

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

julia> include(JMtk15_src * "include/MisrRegression_h.jl")
```
"""
struct MTKt_RegressionCoeff
    valid_mask::MTKt_DataBuffer
    slope::MTKt_DataBuffer
    intercept::MTKt_DataBuffer
    correlation::MTKt_DataBuffer
end
export MTKt_RegressionCoeff

const MTKT_REGRESSION_COEFF_INIT = (
    MTKT_DATABUFFER_INIT,
    MTKT_DATABUFFER_INIT,
    MTKT_DATABUFFER_INIT)
export MTKT_REGRESSION_COEFF_INIT
