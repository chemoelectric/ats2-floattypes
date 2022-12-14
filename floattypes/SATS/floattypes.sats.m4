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

%{#
#include "floattypes/CATS/defines.cats"
#include "floattypes/CATS/floattypes.cats"
#include "floattypes/CATS/constants.cats"
%}

#define ATS_PACKNAME "ATS2_FLOATTYPES.floattypes"
#define ATS_EXTERN_PREFIX "floattypes_"

staload "prelude/basics_sta.sats"
staload "prelude/SATS/float.sats"
staload "prelude/SATS/pointer.sats"

divert(-1)

m4_define([default_overload_precedence],[0])

m4_define([declare_kind],dnl
[dnl
tkindef $1_kind = "floattypes_$1"
typedef $1 = g0float($1_kind)

])

m4_define([declare_int_to_float],
  [fun g0int2float_$1_$2 : g0int($1[]knd) -<> g0float($2[]_kind) = "mac#%"
])

m4_define([declare_uint_to_float],
  [fun g0uint2float_$1_$2 : g0uint($1[]knd) -<> g0float($2[]_kind) = "mac#%"
])

m4_define([declare_float_to_int],
  [fun g0float2int_$1_$2 : g0float($1[]_kind) -<> g0int($2[]knd) = "mac#%"
])

m4_define([declare_float_to_uint],
  [fun g0float2uint_$1_$2 : g0float($1[]_kind) -<> g0uint($2[]knd) = "mac#%"
])

m4_define([declare_float_to_float],
  [fun g0float2float_$1_$2 : g0float($1[]_kind) -<> g0float($2[]_kind) = "mac#%"
])

m4_define([declare_nullop],
  [fun g0float_$1_$2 : g0float_nullop_type($2[]_kind) = "mac#%"
])

m4_define([declare_uop],
  [fun g0float_$1_$2 : g0float_uop_type($2[]_kind) = "mac#%"
])

m4_define([declare_aop],
  [fun g0float_$1_$2 : g0float_aop_type($2[]_kind) = "mac#%"
])

m4_define([declare_fmaop],
  [fun g0float_$1_$2 : g0float_fmaop_type($2[]_kind) = "mac#%"
])

m4_define([declare_nexttowardlike],
  [fun g0float_$1_$2 : g0float_nexttowardlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_cmp],
  [fun g0float_$1_$2 : g0float_cmp_type($2[]_kind) = "mac#%"
])

m4_define([declare_compare],
  [fun g0float_$1_$2 : g0float_compare_type($2[]_kind) = "mac#%"
])

m4_define([declare_scalbnlike],
  [fun g0float_$1_$2 : g0float_scalbnlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_scalblnlike],
  [fun g0float_$1_$2 : g0float_scalblnlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_lroundlike],
  [fun g0float_$1_$2 : g0float_lroundlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_llroundlike],
  [fun g0float_$1_$2 : g0float_llroundlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_frexplike],
  [fun g0float_$1_$2 : g0float_frexplike_type($2[]_kind) = "mac#%"
])

m4_define([declare_remquolike],
  [fun g0float_$1_$2 : g0float_remquolike_type($2[]_kind) = "mac#%"
])

m4_define([declare_modflike],
  [fun g0float_$1_$2 : g0float_modflike_type($2[]_kind) = "mac#%"
])

m4_define([declare_jnlike],
  [fun g0float_$1_$2 : g0float_jnlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_ilogblike],
  [fun g0float_$1_$2 : g0float_ilogblike_type($2[]_kind) = "mac#%"
])

m4_define([declare_nanlike],
  [fun g0float_$1_$2 : g0float_nanlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_strtodlike],
  [fun g0float_$1_$2 : g0float_strtodlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_strfromdlike_unsafe],
  [fun g0float_$1_$2 : g0float_strfromdlike_unsafe_type($2[]_kind) = "mac#%"
])

m4_define([declare_isfinitelike],
  [fun g0float_$1_$2 : g0float_isfinitelike_type($2[]_kind) = "mac#%"
])

m4_define([declare_isgreaterlike],
  [fun g0float_$1_$2 : g0float_isgreaterlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_typed_constant_value],
  [fun g0float_$1_$2 : () -<> $3 = "mac#%"
])

divert[]dnl

m4_foreachq([t],[extra_floattypes],[declare_kind(t)])

m4_foreachq([const],[math_constants_names],
  [m4_foreachq([t],[all_floattypes],
    [macdef const[_]t = $extval(g0float(t[_kind]), "[floattypes_]const[_]t")
])
])


fun {tk1, tk2 : tkind}
g0uint2float : g0uint(tk1) -<> g0float(tk2)

fun {tk1, tk2 : tkind}
g0float2uint : g0float(tk1) -<> g0uint(tk2)

m4_foreachq([_f],[all_floattypes],
[m4_foreachq([_i],[all_int_kinds],
  [declare_int_to_float(_i,_f)])
m4_foreachq([_i],[all_uint_kinds],
  [declare_uint_to_float(_i,_f)])
m4_foreachq([_i],[all_int_kinds],
  [declare_float_to_int(_f,_i)])
m4_foreachq([_i],[all_uint_kinds],
  [declare_float_to_uint(_f,_i)])
m4_foreachq([_f2],[all_floattypes],
  [declare_float_to_float(_f,_f2)])
])


/* Nullary operations. */
typedef g0float_nullop_type (tk : tkind) =
  () -<fun0> g0float(tk)

/* Ternary operations similar to fused-multiply-add. */
typedef g0float_fmaop_type (tk : tkind) =
  (g0float(tk), g0float(tk), g0float(tk)) -<fun0> g0float(tk)

/* Operations similar to C’s ‘nexttoward’. */
typedef g0float_nexttowardlike_type (tk : tkind) =
  (g0float(tk), ldouble) -<fun0> g0float(tk)

/* Operations taking a floating-point value and returning
   an int. */
typedef g0float_ilogblike_type (tk : tkind) =
  (g0float(tk)) -<fun0> int

/* Binary operations where the second argument is an int. */
typedef g0float_scalbnlike_type (tk : tkind) =
  (g0float(tk), int) -<fun0> g0float(tk)

/* Binary operations where the second argument is a lint. */
typedef g0float_scalblnlike_type (tk : tkind) =
  (g0float(tk), lint) -<fun0> g0float(tk)

/* Operations taking a floating-point value and returning
   a lint. */
typedef g0float_lroundlike_type (tk : tkind) =
  (g0float(tk)) -<fun0> lint

/* Operations taking a floating-point value and returning
   a llint. */
typedef g0float_llroundlike_type (tk : tkind) =
  (g0float(tk)) -<fun0> llint

/* Unary operations returning a floating-point value, but also
   an integer as side effect by reference. */
typedef g0float_frexplike_type (tk : tkind) =
  (g0float(tk), &int? >> int) -<fun,!refwrt> g0float(tk)

/* Binary operations returning a floating-point value, but also
   an integer as side effect by reference. */
typedef g0float_remquolike_type (tk : tkind) =
  (g0float(tk), g0float(tk), &int? >> int) -<fun,!refwrt> g0float(tk)

/* Unary operations returning a floating-point value, but also
   another floating-point value as side effect by reference. */
typedef g0float_modflike_type (tk : tkind) =
  (g0float(tk), &g0float(tk)? >> g0float(tk)) -<fun,!refwrt> g0float(tk)

/* An operation similar to C's 'jn' and 'yn' functions. */
typedef g0float_jnlike_type (tk : tkind) =
  (int, g0float(tk)) -<fun0> g0float(tk)

/* An operation similar to C's 'nan' function. */
typedef g0float_nanlike_type (tk : tkind) =
  (String0) -<fun0> g0float(tk)

/* An operation similar to C's 'strtod' function,
   though returning a size_t offset value instead of
   an 'end pointer'. */
typedef g0float_strtodlike_type (tk : tkind) =
  (String0, &size_t? >> size_t) -<fun,!refwrt> g0float(tk)

/* An operation similar to C's 'strfromd' function. */
typedef g0float_strfromdlike_unsafe_type (tk : tkind) =
  (charptr1, size_t, String0, g0float(tk)) -<fun,!refwrt> int

/* Operations taking a floating-point value and returning
   a bool. */
typedef g0float_isfinitelike_type (tk : tkind) =
  (g0float(tk)) -<fun0> bool

/* Operations taking two floating-point values and returning
   a bool. */
typedef g0float_isgreaterlike_type (tk : tkind) =
  (g0float(tk), g0float(tk)) -<fun0> bool


m4_foreachq([t],[extra_floattypes],[declare_uop([neg],t)])
m4_foreachq([t],[extra_floattypes],[declare_uop([abs],t)])
m4_foreachq([t],[extra_floattypes],[declare_uop([succ],t)])
m4_foreachq([t],[extra_floattypes],[declare_uop([pred],t)])
dnl
m4_foreachq([t],[extra_floattypes],[declare_aop([add],t)])
m4_foreachq([t],[extra_floattypes],[declare_aop([sub],t)])
m4_foreachq([t],[extra_floattypes],[declare_aop([mul],t)])
m4_foreachq([t],[extra_floattypes],[declare_aop([div],t)])
m4_foreachq([t],[extra_floattypes],[declare_aop([mod],t)])
dnl
m4_foreachq([t],[extra_floattypes],[declare_cmp([lt],t)])
m4_foreachq([t],[extra_floattypes],[declare_cmp([lte],t)])
m4_foreachq([t],[extra_floattypes],[declare_cmp([gt],t)])
m4_foreachq([t],[extra_floattypes],[declare_cmp([gte],t)])
m4_foreachq([t],[extra_floattypes],[declare_cmp([eq],t)])
m4_foreachq([t],[extra_floattypes],[declare_cmp([neq],t)])
dnl
m4_foreachq([t],[extra_floattypes],[declare_compare([compare],t)])
dnl
m4_foreachq([t],[extra_floattypes],[declare_aop([max],t)])
m4_foreachq([t],[extra_floattypes],[declare_aop([min],t)])
dnl
m4_foreachq([func],[nullary_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_nullop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_nullop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[unary_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_uop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_uop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[binary_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_aop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_aop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[ternary_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_fmaop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_fmaop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[nexttowardlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_nexttowardlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_nexttowardlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[scalbnlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_scalbnlike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_scalbnlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[scalblnlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_scalblnlike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_scalblnlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[lroundlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_lroundlike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_lroundlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[llroundlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_llroundlike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_llroundlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[frexplike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_frexplike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_frexplike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[remquolike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_remquolike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_remquolike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[modflike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_modflike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_modflike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[lgamma_rlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_frexplike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_frexplike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[jnlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_jnlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_jnlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[ilogblike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_ilogblike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_ilogblike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[nanlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_nanlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_nanlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[strtodlike_math_functions],
[m4_foreachq([t],[all_floattypes],[declare_strtodlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_strtodlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[strfromd_unsafe],
[m4_foreachq([t],[all_floattypes],[declare_strfromdlike_unsafe(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_strfromdlike_unsafe_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([t],[extra_floattypes],
[fun print_[]t : g0float(t[]_kind) -> void = "mac#%"
fun prerr_[]t : g0float(t[]_kind) -> void = "mac#%"
fun fprint_[]t : fprint_type (g0float(t[]_kind)) = "mac#%"
overload print with print_[]t
overload prerr with prerr_[]t
overload fprint with fprint_[]t
])


/* Values returned by fpclassify. (Other values are possible.) */
macdef FP_INFINITE = $extval(int, "FP_INFINITE")
macdef FP_NAN = $extval(int, "FP_NAN")
macdef FP_NORMAL = $extval(int, "FP_NORMAL")
macdef FP_SUBNORMAL = $extval(int, "FP_SUBNORMAL")
macdef FP_ZERO = $extval(int, "FP_ZERO")

m4_foreachq([func],[fpclassifylike_math_macros],
[m4_foreachq([t],[all_floattypes],[declare_ilogblike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_ilogblike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[isfinitelike_math_macros],
[m4_foreachq([t],[all_floattypes],[declare_isfinitelike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_isfinitelike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
m4_foreachq([func],[isgreaterlike_math_macros],
[m4_foreachq([t],[all_floattypes],[declare_isgreaterlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_isgreaterlike_type(tk)
overload func with g0float_[]func of default_overload_precedence
])


m4_foreachq([t],[all_floattypes],
  [declare_typed_constant_value([huge_val],t,[g0float(]t[_kind)])])dnl
fun {tk : tk} g0float_huge_val : () -<> g0float(tk)
overload huge_val with g0float_huge_val of default_overload_precedence
m4_foreachq([t],[all_floattypes],
  [macdef HUGE_VAL_[]t = g0float_huge_val_[]t ()
])dnl

/* Macros with the same names as the C macros. */
macdef HUGE_VALF = HUGE_VAL_float
macdef HUGE_VAL = HUGE_VAL_double
macdef HUGE_VALL = HUGE_VAL_ldouble
macdef HUGE_VAL_F32 = HUGE_VAL_float32
macdef HUGE_VAL_F64 = HUGE_VAL_float64
macdef HUGE_VAL_F128 = HUGE_VAL_float128
macdef HUGE_VAL_D32 = HUGE_VAL_decimal32
macdef HUGE_VAL_D64 = HUGE_VAL_decimal64
macdef HUGE_VAL_D128 = HUGE_VAL_decimal128
macdef HUGE_VAL_F32X = HUGE_VAL_float32x
macdef HUGE_VAL_F64X = HUGE_VAL_float64x
macdef HUGE_VAL_F128X = HUGE_VAL_float128x
macdef HUGE_VAL_D64X = HUGE_VAL_decimal64x
macdef HUGE_VAL_D128X = HUGE_VAL_decimal128x

m4_foreachq([t],[all_floattypes],
  [declare_typed_constant_value([snan],t,[g0float(]t[_kind)])])dnl
fun {tk : tk} g0float_snan : () -<> g0float(tk)
overload snan with g0float_snan of default_overload_precedence
m4_foreachq([t],[all_floattypes],
  [macdef SNAN_[]t = g0float_snan_[]t ()
])dnl

/* Macros with the same names as the C macros. */
macdef SNANF = SNAN_float
macdef SNAN = SNAN_double
macdef SNANL = SNAN_ldouble
macdef SNANF32 = SNAN_float32
macdef SNANF64 = SNAN_float64
macdef SNANF128 = SNAN_float128
macdef SNAND32 = SNAN_decimal32
macdef SNAND64 = SNAN_decimal64
macdef SNAND128 = SNAN_decimal128
macdef SNANF32X = SNAN_float32x
macdef SNANF64X = SNAN_float64x
macdef SNANF128X = SNAN_float128x
macdef SNAND64X = SNAN_decimal64x
macdef SNAND128X = SNAN_decimal128x
