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
#include "floattypes/CATS/floattypes.cats"
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

m4_define([declare_nullop],[fun g0float_$1_$2 : g0float_nullop_type($2[]_kind) = "mac#%"
])

m4_define([declare_uop],[fun g0float_$1_$2 : g0float_uop_type($2[]_kind) = "mac#%"
])

m4_define([declare_aop],[fun g0float_$1_$2 : g0float_aop_type($2[]_kind) = "mac#%"
])

m4_define([declare_fmaop],[fun g0float_$1_$2 : g0float_fmaop_type($2[]_kind) = "mac#%"
])

m4_define([declare_cmp],[fun g0float_$1_$2 : g0float_cmp_type($2[]_kind) = "mac#%"
])

m4_define([declare_compare],[fun g0float_$1_$2 : g0float_compare_type($2[]_kind) = "mac#%"
])

m4_define([declare_lroundlike],[fun g0float_$1_$2 : g0float_lroundlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_llroundlike],[fun g0float_$1_$2 : g0float_llroundlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_frexplike],[fun g0float_$1_$2 : g0float_frexplike_type($2[]_kind) = "mac#%"
])

m4_define([declare_jnlike],[fun g0float_$1_$2 : g0float_jnlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_ilogblike],[fun g0float_$1_$2 : g0float_ilogblike_type($2[]_kind) = "mac#%"
])

m4_define([declare_nanlike],[fun g0float_$1_$2 : g0float_nanlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_strtodlike],[fun g0float_$1_$2 : g0float_strtodlike_type($2[]_kind) = "mac#%"
])

m4_define([declare_strfromdlike_unsafe],
  [fun g0float_$1_$2 : g0float_strfromdlike_unsafe_type($2[]_kind) = "mac#%"
])

divert[]dnl

/* Nullary operations. */
typedef g0float_nullop_type (tk : tkind) =
  () -<fun0> g0float(tk)

/* Ternary operations similar to fused-multiply-add. */
typedef g0float_fmaop_type (tk : tkind) =
  (g0float(tk), g0float(tk), g0float(tk)) -<fun0> g0float(tk)

/* Operations taking a floating-point value and returning
   an int. */
typedef g0float_ilogblike_type (tk : tkind) =
  (g0float(tk)) -<fun0> int

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


m4_foreachq([t],[extra_floattypes],[declare_kind(t)])

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
