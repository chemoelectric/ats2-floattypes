changequote([,])dnl
[/*

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

dnl
dnl  FIXME: Move all the many #defines to a separate ‘.h’ file,
dnl         so a person can substitute their own values.
dnl

*/]

[#ifndef FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__]
[#define FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__]

[#include "floattypes/HATS/config.hats"]
[#include <math.h>]
[#include <stdlib.h>]

_Static_assert(sizeof (atstype_float) == sizeof (float),
               "atstype_float is not the same as float");
_Static_assert(sizeof (atstype_double) == sizeof (double),
               "atstype_double is not the same as double");
_Static_assert(sizeof (atstype_ldouble) == sizeof (long double),
               "atstype_ldouble is not the same as long double");

[/*
 * The following statements are #define instead of typedef,
 * so they will succeed even if the type is not supported.
 */
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
]dnl

divert(-1)

include([common-macros.m4])

define([negation_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_neg_$1 (floattypes_$1 f) dnl
{ return (-f); }
#endif /* HAVE_floattypes_$1 */
])

define([abs_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_abs_$1 (floattypes_$1 f) dnl
{ return ((f < 0) ? (-f) : (f)); }
#endif /* HAVE_floattypes_$1 */
])

define([successor_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_succ_$1 (floattypes_$1 f) dnl
{ return (f + 1); }
#endif /* HAVE_floattypes_$1 */
])

define([predecessor_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_pred_$1 (floattypes_$1 f) dnl
{ return (f - 1); }
#endif /* HAVE_floattypes_$1 */
])

define([binary_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (f1 $3 f2); }
#endif /* HAVE_floattypes_$1 */
])

define([mod_op],
[#if HAVE_floattypes_fmod_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_mod_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_fmod_$1 (f1, f2)); }
#endif /* HAVE_floattypes_fmod_$1 */
])

define([comparison_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 $3 f2) ? atsbool_true : atsbool_false); }
#endif /* HAVE_floattypes_$1 */
])

define([compare_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_compare_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 < f2) ? -1 : ((f2 < f1) ? 1 : 0)); }
#endif /* HAVE_floattypes_$1 */
])

define([min_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_min_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 <= f2) ? f1 : f2); }
#endif /* HAVE_floattypes_$1 */
])

define([max_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_max_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 >= f2) ? f1 : f2); }
#endif /* HAVE_floattypes_$1 */
])

define([nullary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (void) dnl
{ return (floattypes_$2_$1 ()); }
#endif /* HAVE_floattypes_$2_$1 */
])

define([unary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

define([binary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_$2_$1 (f1, f2)); }
#endif /* HAVE_floattypes_$2_$1 */
])

define([ternary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, dnl
floattypes_$1 f2, dnl
floattypes_$1 f3) dnl
{ return (floattypes_$2_$1 (f1, f2, f3)); }
#endif /* HAVE_floattypes_$2_$1 */
])

define([frexplike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_int *p) dnl
{ return (floattypes_$2_$1 (f, p)); }
#endif /* HAVE_floattypes_$2_$1 */
])

define([jnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (atstype_int n, floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (n, f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

divert[]dnl

foreachq([func],[regular_math_functions],
[[#define] floattypes_[]func[]_float func[]f
[#define] floattypes_[]func[]_double func
[#define] floattypes_[]func[]_ldouble func[]l
[#define] floattypes_[]func[]_float32 func[]f32
[#define] floattypes_[]func[]_float64 func[]f64
[#define] floattypes_[]func[]_float128 func[]f128
[#define] floattypes_[]func[]_decimal32 func[]d32
[#define] floattypes_[]func[]_decimal64 func[]d64
[#define] floattypes_[]func[]_decimal128 func[]d128
[#define] floattypes_[]func[]_float32x func[]f32x
[#define] floattypes_[]func[]_float64x func[]f64x
[#define] floattypes_[]func[]_float128x func[]f128x
[#define] floattypes_[]func[]_decimal64x func[]d64x
[#define] floattypes_[]func[]_decimal128x func[]d128x
])

[#define] floattypes_lgamma_r_float lgammaf_r
[#define] floattypes_lgamma_r_double lgamma_r
[#define] floattypes_lgamma_r_ldouble lgammal_r
[#define] floattypes_lgamma_r_float32 lgammaf32_r
[#define] floattypes_lgamma_r_float64 lgammaf64_r
[#define] floattypes_lgamma_r_float128 lgammaf128_r
[#define] floattypes_lgamma_r_decimal32 lgammad32_r
[#define] floattypes_lgamma_r_decimal64 lgammad64_r
[#define] floattypes_lgamma_r_decimal128 lgammad128_r
[#define] floattypes_lgamma_r_float32x lgammaf32x_r
[#define] floattypes_lgamma_r_float64x lgammaf64x_r
[#define] floattypes_lgamma_r_float128x lgammaf128x_r
[#define] floattypes_lgamma_r_decimal64x lgammad64x_r
[#define] floattypes_lgamma_r_decimal128x lgammad128x_r

foreachq([t],[extra_floattypes],[negation_op(t)])
foreachq([t],[extra_floattypes],[abs_op(t)])
foreachq([t],[extra_floattypes],[successor_op(t)])
foreachq([t],[extra_floattypes],[predecessor_op(t)])
dnl
foreachq([t],[extra_floattypes],[binary_op(t,[add],[+])])
foreachq([t],[extra_floattypes],[binary_op(t,[sub],[-])])
foreachq([t],[extra_floattypes],[binary_op(t,[mul],[*])])
foreachq([t],[extra_floattypes],[binary_op(t,[div],[/])])
dnl
foreachq([t],[extra_floattypes],[mod_op(t)])
dnl
foreachq([t],[extra_floattypes],[comparison_op(t,[lt],[<])])
foreachq([t],[extra_floattypes],[comparison_op(t,[lte],[<=])])
foreachq([t],[extra_floattypes],[comparison_op(t,[gt],[>])])
foreachq([t],[extra_floattypes],[comparison_op(t,[gte],[>=])])
foreachq([t],[extra_floattypes],[comparison_op(t,[eq],[==])])
foreachq([t],[extra_floattypes],[comparison_op(t,[neq],[!=])])
dnl
foreachq([t],[extra_floattypes],[compare_op(t)])
dnl
foreachq([t],[extra_floattypes],[min_op(t)])
foreachq([t],[extra_floattypes],[max_op(t)])
dnl
foreachq([func],[nullary_math_functions],
  [foreachq([t],[all_floattypes],
    [nullary_fn(t,func)])])
dnl
foreachq([func],[unary_math_functions],
  [foreachq([t],[all_floattypes],
    [unary_fn(t,func)])])
dnl
foreachq([func],[binary_math_functions],
  [foreachq([t],[all_floattypes],
    [binary_fn(t,func)])])
dnl
foreachq([func],[ternary_math_functions],
  [foreachq([t],[all_floattypes],
    [ternary_fn(t,func)])])
dnl
foreachq([func],[frexplike_math_functions],
  [foreachq([t],[all_floattypes],
    [frexplike_fn(t,func)])])
dnl
foreachq([func],[lgamma_rlike_math_functions],
  [foreachq([t],[all_floattypes],
    [frexplike_fn(t,func)])])
dnl
foreachq([func],[jnlike_math_functions],
  [foreachq([t],[all_floattypes],
    [jnlike_fn(t,func)])])

[#endif /* FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__ */]
