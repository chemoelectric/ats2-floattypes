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

dnl
dnl  FIXME: Move all the many #defines to a separate ‘.h’ file,
dnl         so a person can substitute their own values.
dnl

*/

#ifndef FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__
#define FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__

#include "floattypes/HATS/config.hats"
#include <math.h>
#include <fenv.h>
#include <stdlib.h>

_Static_assert(sizeof (atstype_float) == sizeof (float),
               "atstype_float is not the same as float");
_Static_assert(sizeof (atstype_double) == sizeof (double),
               "atstype_double is not the same as double");
_Static_assert(sizeof (atstype_ldouble) == sizeof (long double),
               "atstype_ldouble is not the same as long double");

/*
   The following statements are #define instead of typedef,
   so they will succeed even if the type is not supported.
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

divert(-1)

fun {tk1, tk2 : tk}
g0uint2float : g0uint(tk1) -<> g0float(tk2)

m4_define([int_to_float],
[ATSinline() dnl
floattypes_$2 dnl
floattypes_g0int2float_$1_$2 (atstype_$1 i) dnl
{ return ((floattypes_$2) i); }
])

m4_define([uint_to_float],
[ATSinline() dnl
floattypes_$2 dnl
floattypes_g0uint2float_$1_$2 (atstype_$1 i) dnl
{ return ((floattypes_$2) i); }
])

m4_define([negation_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_neg_$1 (floattypes_$1 f) dnl
{ return (-f); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([abs_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_abs_$1 (floattypes_$1 f) dnl
{ return ((f < 0) ? (-f) : (f)); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([successor_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_succ_$1 (floattypes_$1 f) dnl
{ return (f + 1); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([predecessor_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_pred_$1 (floattypes_$1 f) dnl
{ return (f - 1); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([binary_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (f1 $3 f2); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([mod_op],
[#if HAVE_floattypes_fmod_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_mod_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_fmod_$1 (f1, f2)); }
#endif /* HAVE_floattypes_fmod_$1 */
])

m4_define([comparison_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 $3 f2) ? atsbool_true : atsbool_false); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([compare_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_compare_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 < f2) ? -1 : ((f2 < f1) ? 1 : 0)); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([min_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_min_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 <= f2) ? f1 : f2); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([max_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_max_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 >= f2) ? f1 : f2); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([nullary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (void) dnl
{ return (floattypes_$2_$1 ()); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([unary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([binary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_$2_$1 (f1, f2)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([ternary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, dnl
floattypes_$1 f2, dnl
floattypes_$1 f3) dnl
{ return (floattypes_$2_$1 (f1, f2, f3)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([nexttowardlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, atstype_ldouble f2) dnl
{ return (floattypes_$2_$1 (f1, f2)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([scalbnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_int i) dnl
{ return (floattypes_$2_$1 (f, i)); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([scalblnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_lint i) dnl
{ return (floattypes_$2_$1 (f, i)); }
#endif /* HAVE_floattypes_$1 */
])

m4_define([lroundlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_lint dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([llroundlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_llint dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([frexplike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_int *p) dnl
{ return (floattypes_$2_$1 (f, p)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([remquolike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2, dnl
atstype_int *quo) dnl
{ return (floattypes_$2_$1 (f1, f2, quo)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([modflike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, floattypes_$1 *p) dnl
{ return (floattypes_$2_$1 (f, p)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([jnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (atstype_int n, floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (n, f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([ilogblike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_int dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif /* HAVE_floattypes_$2_$1 */
])

m4_define([nanlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (atstype_string s) dnl
{ return (floattypes_$2_$1 ((const char *) s)); }
#endif /* HAVE_floattypes_$2_$1 */
])

dnl
dnl  strtod:
dnl
dnl  For the second argument, instead of a char pointer,
dnl  a ssize_t is returned; the person writing this code
dnl  does not have a high opinion of using pointers much.
dnl
dnl  There is no provision for passing a NULL.
dnl
m4_define([strtodlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (atstype_string s, atstype_size *end) dnl
{ char *endptr; floattypes_$1 retval = dnl
(floattypes_$2_$1 ((const char *) s, &endptr)); dnl
*end = endptr - s; return retval; }
#endif /* HAVE_floattypes_$2_$1 */
])

dnl
dnl  strfromd:
dnl
dnl  This is an unsafe function, and I cannot think of any way
dnl  to make it safe. This is because the behavior is undefined
dnl  if the format string is malformed.
dnl
m4_define([strfromdlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_int dnl
floattypes_g0float_$2_unsafe_$1 (atstype_ptr s, atstype_size n, dnl
atstype_string fmt, floattypes_$1 fp) dnl
{ return (floattypes_$2_$1 ((char *) s, n, (const char *) fmt, fp)); }
#endif /* HAVE_floattypes_$2_$1 */
])

divert[]dnl


m4_foreachq([_t],[all_floattypes],
[#if HAVE_floattypes_[]_t
m4_foreachq([_i],[all_int_kinds],
    [int_to_float(_i,_t)])dnl
m4_foreachq([_i],[all_uint_kinds],
    [uint_to_float(_i,_t)])dnl
#endif /* HAVE_floattypes_[]_t */

])


#ifdef __GLIBC__

/* A workaround for glibc systems that do not declare
   prototypes for GCC’s builtin decimal floating-point
   functions. */

m4_foreachq([_size],[32,64,128,64x,128x],dnl
[#if HAVE_floattypes_fabs_decimal[]_size
[_Decimal]_size[ fabsd]_size[ (_Decimal]_size[);]
#endif
])
dnl
m4_foreachq([_size],[32,64,128,64x,128x],dnl
[#if HAVE_floattypes_nan_decimal[]_size
[_Decimal]_size[ nand]_size[ (const char *);]
#endif
])
dnl
#endif

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

m4_foreachq([t],[extra_floattypes],[negation_op(t)])
m4_foreachq([t],[extra_floattypes],[abs_op(t)])
m4_foreachq([t],[extra_floattypes],[successor_op(t)])
m4_foreachq([t],[extra_floattypes],[predecessor_op(t)])
dnl
m4_foreachq([t],[extra_floattypes],[binary_op(t,[add],[+])])
m4_foreachq([t],[extra_floattypes],[binary_op(t,[sub],[-])])
m4_foreachq([t],[extra_floattypes],[binary_op(t,[mul],[*])])
m4_foreachq([t],[extra_floattypes],[binary_op(t,[div],[/])])
dnl
m4_foreachq([t],[extra_floattypes],[mod_op(t)])
dnl
m4_foreachq([t],[extra_floattypes],[comparison_op(t,[lt],[<])])
m4_foreachq([t],[extra_floattypes],[comparison_op(t,[lte],[<=])])
m4_foreachq([t],[extra_floattypes],[comparison_op(t,[gt],[>])])
m4_foreachq([t],[extra_floattypes],[comparison_op(t,[gte],[>=])])
m4_foreachq([t],[extra_floattypes],[comparison_op(t,[eq],[==])])
m4_foreachq([t],[extra_floattypes],[comparison_op(t,[neq],[!=])])
dnl
m4_foreachq([t],[extra_floattypes],[compare_op(t)])
dnl
m4_foreachq([t],[extra_floattypes],[min_op(t)])
m4_foreachq([t],[extra_floattypes],[max_op(t)])
dnl
m4_foreachq([func],[nullary_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [nullary_fn(t,func)])])
dnl
m4_foreachq([func],[unary_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [unary_fn(t,func)])])
dnl
m4_foreachq([func],[binary_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [binary_fn(t,func)])])
dnl
m4_foreachq([func],[ternary_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [ternary_fn(t,func)])])
dnl
m4_foreachq([func],[nexttowardlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [nexttowardlike_fn(t,func)])])
dnl
m4_foreachq([func],[scalbnlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [scalbnlike_fn(t,func)])])
dnl
m4_foreachq([func],[scalblnlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [scalblnlike_fn(t,func)])])
dnl
m4_foreachq([func],[lroundlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [lroundlike_fn(t,func)])])
dnl
m4_foreachq([func],[llroundlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [llroundlike_fn(t,func)])])
dnl
m4_foreachq([func],[frexplike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [frexplike_fn(t,func)])])
dnl
m4_foreachq([func],[remquolike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [remquolike_fn(t,func)])])
dnl
m4_foreachq([func],[modflike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [modflike_fn(t,func)])])
dnl
m4_foreachq([func],[lgamma_rlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [frexplike_fn(t,func)])])
dnl
m4_foreachq([func],[jnlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [jnlike_fn(t,func)])])
dnl
m4_foreachq([func],[ilogblike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [ilogblike_fn(t,func)])])
dnl
m4_foreachq([func],[nanlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [nanlike_fn(t,func)])])
dnl
m4_foreachq([func],[strtodlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [strtodlike_fn(t,func)])])
dnl
m4_foreachq([func],[strfromdlike_math_functions],
  [m4_foreachq([t],[all_floattypes],
    [strfromdlike_fn(t,func)])])

#endif /* FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__ */
