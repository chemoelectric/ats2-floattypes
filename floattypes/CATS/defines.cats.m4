changequote([,])changecom([/*],[*/])dnl
include([common-macros.m4])dnl
/*

Copyright © 2021 Barry Schwartz

This program is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License, as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received copies of the GNU General Public License
along with this program. If not, see
<https://www.gnu.org/licenses/>.

*/

#ifndef FLOATTYPES_CATS_DEFINES_HEADER_GUARD__
#define FLOATTYPES_CATS_DEFINES_HEADER_GUARD__

#include "floattypes/HATS/config.hats"

/* Use #define instead of typedef, because the C compiler might not
   support all the types. */
#define floattypes_float atstype_float
#define floattypes_double atstype_double
#define floattypes_ldouble atstype_ldouble
#define floattypes_float32 _Float32
#define floattypes_float64 _Float64
#define floattypes_float128 _Float128
#define floattypes_decimal32 _Decimal32
#define floattypes_decimal64 _Decimal64
#define floattypes_decimal128 _Decimal128
#define floattypes_float32x _Float32x
#define floattypes_float64x _Float64x
#define floattypes_float128x _Float128x
#define floattypes_decimal64x _Decimal64x
#define floattypes_decimal128x _Decimal128x


m4_foreachq([func],[regular_math_functions],
[#define floattypes_[]func[]_float func[]f
#define floattypes_[]func[]_double func
#define floattypes_[]func[]_ldouble func[]l
#define floattypes_[]func[]_float32 func[]f32
#define floattypes_[]func[]_float64 func[]f64
#define floattypes_[]func[]_float128 func[]f128
#define floattypes_[]func[]_decimal32 func[]d32
#define floattypes_[]func[]_decimal64 func[]d64
#define floattypes_[]func[]_decimal128 func[]d128
#define floattypes_[]func[]_float32x func[]f32x
#define floattypes_[]func[]_float64x func[]f64x
#define floattypes_[]func[]_float128x func[]f128x
#define floattypes_[]func[]_decimal64x func[]d64x
#define floattypes_[]func[]_decimal128x func[]d128x
])

#define floattypes_lgamma_r_float lgammaf_r
#define floattypes_lgamma_r_double lgamma_r
#define floattypes_lgamma_r_ldouble lgammal_r
#define floattypes_lgamma_r_float32 lgammaf32_r
#define floattypes_lgamma_r_float64 lgammaf64_r
#define floattypes_lgamma_r_float128 lgammaf128_r
#define floattypes_lgamma_r_decimal32 lgammad32_r
#define floattypes_lgamma_r_decimal64 lgammad64_r
#define floattypes_lgamma_r_decimal128 lgammad128_r
#define floattypes_lgamma_r_float32x lgammaf32x_r
#define floattypes_lgamma_r_float64x lgammaf64x_r
#define floattypes_lgamma_r_float128x lgammaf128x_r
#define floattypes_lgamma_r_decimal64x lgammad64x_r
#define floattypes_lgamma_r_decimal128x lgammad128x_r

#define floattypes_strtod_float strtof
#define floattypes_strtod_double strtod
#define floattypes_strtod_ldouble strtol
#define floattypes_strtod_float32 strtof32
#define floattypes_strtod_float64 strtof64
#define floattypes_strtod_float128 strtof128
#define floattypes_strtod_decimal32 strtod32
#define floattypes_strtod_decimal64 strtod64
#define floattypes_strtod_decimal128 strtod128
#define floattypes_strtod_float32x strtof32x
#define floattypes_strtod_float64x strtof64x
#define floattypes_strtod_float128x strtof128x
#define floattypes_strtod_decimal64x strtod64x
#define floattypes_strtod_decimal128x strtod128x

#define floattypes_strfromd_float strfromf
#define floattypes_strfromd_double strfromd
#define floattypes_strfromd_ldouble strfroml
#define floattypes_strfromd_float32 strfromf32
#define floattypes_strfromd_float64 strfromf64
#define floattypes_strfromd_float128 strfromf128
#define floattypes_strfromd_decimal32 strfromd32
#define floattypes_strfromd_decimal64 strfromd64
#define floattypes_strfromd_decimal128 strfromd128
#define floattypes_strfromd_float32x strfromf32x
#define floattypes_strfromd_float64x strfromf64x
#define floattypes_strfromd_float128x strfromf128x
#define floattypes_strfromd_decimal64x strfromd64x
#define floattypes_strfromd_decimal128x strfromd128x

#define floattypes_HUGE_VAL_float HUGE_VALF
#define floattypes_HUGE_VAL_double HUGE_VAL
#define floattypes_HUGE_VAL_ldouble HUGE_VALL
#define floattypes_HUGE_VAL_float32 HUGE_VAL_F32
#define floattypes_HUGE_VAL_float64 HUGE_VAL_F64
#define floattypes_HUGE_VAL_float128 HUGE_VAL_F128
#define floattypes_HUGE_VAL_decimal32 HUGE_VAL_D32
#define floattypes_HUGE_VAL_decimal64 HUGE_VAL_D64
#define floattypes_HUGE_VAL_decimal128 HUGE_VAL_D128
#define floattypes_HUGE_VAL_float32x HUGE_VAL_F32X
#define floattypes_HUGE_VAL_float64x HUGE_VAL_F64X
#define floattypes_HUGE_VAL_float128x HUGE_VAL_F128X
#define floattypes_HUGE_VAL_decimal64x HUGE_VAL_D64X
#define floattypes_HUGE_VAL_decimal128x HUGE_VAL_D128X

#define floattypes_SNAN_float SNANF
#define floattypes_SNAN_double SNAN
#define floattypes_SNAN_ldouble SNANL
#define floattypes_SNAN_float32 SNANF32
#define floattypes_SNAN_float64 SNANF64
#define floattypes_SNAN_float128 SNANF128
#define floattypes_SNAN_decimal32 SNAND32
#define floattypes_SNAN_decimal64 SNAND64
#define floattypes_SNAN_decimal128 SNAND128
#define floattypes_SNAN_float32x SNANF32X
#define floattypes_SNAN_float64x SNANF64X
#define floattypes_SNAN_float128x SNANF128X
#define floattypes_SNAN_decimal64x SNAND64X
#define floattypes_SNAN_decimal128x SNAND128X

m4_foreachq([macro],[generic_math_macros],
[#define floattypes_[]macro[]_float macro
#define floattypes_[]macro[]_double macro
#define floattypes_[]macro[]_ldouble macro
#define floattypes_[]macro[]_float32 macro
#define floattypes_[]macro[]_float64 macro
#define floattypes_[]macro[]_float128 macro
#define floattypes_[]macro[]_decimal32 macro
#define floattypes_[]macro[]_decimal64 macro
#define floattypes_[]macro[]_decimal128 macro
#define floattypes_[]macro[]_float32x macro
#define floattypes_[]macro[]_float64x macro
#define floattypes_[]macro[]_float128x macro
#define floattypes_[]macro[]_decimal64x macro
#define floattypes_[]macro[]_decimal128x macro
])

#endif /* FLOATTYPES_CATS_DEFINES_HEADER_GUARD__ */
