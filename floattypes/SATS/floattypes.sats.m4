changequote([,])dnl
[(*

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

*)]

[%{#
#include "floattypes/CATS/floattypes.cats"
%}]

[#define] ATS_PACKNAME "ATS2_FLOATTYPES.floattypes"
[#define] ATS_EXTERN_PREFIX "floattypes_"

staload "prelude/basics_sta.sats"
staload "prelude/SATS/float.sats"

divert(-1)

include([common-macros.m4])

define([default_overload_precedence],[0])

define([declare_kind],dnl
[dnl
tkindef $1_kind = "floattypes_$1"
typedef $1 = g0float($1_kind)

])

define([declare_uop],[fun g0float_$1_$2 : g0float_uop_type($2[]_kind) = "mac#%"
])

define([declare_aop],[fun g0float_$1_$2 : g0float_aop_type($2[]_kind) = "mac#%"
])

define([declare_fmaop],[fun g0float_$1_$2 : g0float_fmaop_type($2[]_kind) = "mac#%"
])

define([declare_cmp],[fun g0float_$1_$2 : g0float_cmp_type($2[]_kind) = "mac#%"
])

define([declare_compare],[fun g0float_$1_$2 : g0float_compare_type($2[]_kind) = "mac#%"
])

define([declare_frexplike],[fun g0float_$1_$2 : g0float_frexplike_type($2[]_kind) = "mac#%"
])

define([declare_jnlike],[fun g0float_$1_$2 : g0float_jnlike_type($2[]_kind) = "mac#%"
])

define([declare_nanlike],[fun g0float_$1_$2 : g0float_nanlike_type($2[]_kind) = "mac#%"
])

divert[]dnl

(* Ternary operations similar to fused-multiply-add. *)
typedef g0float_fmaop_type (tk : tkind) =
  (g0float(tk), g0float(tk), g0float(tk)) -<fun0> g0float(tk)

(* Unary operations returning a floating-point value, but also
   an integer as side effect by reference. *)
typedef g0float_frexplike_type (tk : tkind) =
  (g0float(tk), &int? >> int) -<fun0> g0float(tk)

(* An operation similar to C's 'jn' and 'yn' functions. *)
typedef g0float_jnlike_type (tk : tkind) =
  (int, g0float(tk)) -<fun0> g0float(tk)

(* An operation similar to C's 'nan' function. *)
typedef g0float_nanlike_type (tk : tkind) =
  (String0) -<fun0> g0float(tk)


foreachq([t],[extra_floattypes],[declare_kind(t)])

foreachq([t],[extra_floattypes],[declare_uop([neg],t)])
foreachq([t],[extra_floattypes],[declare_uop([abs],t)])
foreachq([t],[extra_floattypes],[declare_uop([succ],t)])
foreachq([t],[extra_floattypes],[declare_uop([pred],t)])
dnl
foreachq([t],[extra_floattypes],[declare_aop([add],t)])
foreachq([t],[extra_floattypes],[declare_aop([sub],t)])
foreachq([t],[extra_floattypes],[declare_aop([mul],t)])
foreachq([t],[extra_floattypes],[declare_aop([div],t)])
foreachq([t],[extra_floattypes],[declare_aop([mod],t)])
dnl
foreachq([t],[extra_floattypes],[declare_cmp([lt],t)])
foreachq([t],[extra_floattypes],[declare_cmp([lte],t)])
foreachq([t],[extra_floattypes],[declare_cmp([gt],t)])
foreachq([t],[extra_floattypes],[declare_cmp([gte],t)])
foreachq([t],[extra_floattypes],[declare_cmp([eq],t)])
foreachq([t],[extra_floattypes],[declare_cmp([neq],t)])
dnl
foreachq([t],[extra_floattypes],[declare_compare([compare],t)])
dnl
foreachq([t],[extra_floattypes],[declare_aop([max],t)])
foreachq([t],[extra_floattypes],[declare_aop([min],t)])
dnl
foreachq([func],[unary_math_functions],
[foreachq([t],[all_floattypes],[declare_uop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_uop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
foreachq([func],[binary_math_functions],
[foreachq([t],[all_floattypes],[declare_aop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_aop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
foreachq([func],[ternary_math_functions],
[foreachq([t],[all_floattypes],[declare_fmaop(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_fmaop_type(tk)
overload func with g0float_[]func of default_overload_precedence
])
dnl
foreachq([func],[frexplike_math_functions],
[foreachq([t],[all_floattypes],[declare_frexplike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_frexplike_type(tk) = "mac#%"
overload func with g0float_[]func of default_overload_precedence
])
dnl
foreachq([func],[lgamma_rlike_math_functions],
[foreachq([t],[all_floattypes],[declare_frexplike(func,t)])dnl
fun {tk : tk} dnl
g0float_[]func : g0float_frexplike_type(tk) = "mac#%"
overload func with g0float_[]func of default_overload_precedence
])
dnl
foreachq([func],[jnlike_math_functions],
[foreachq([t],[all_floattypes],[declare_jnlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_jnlike_type(tk) = "mac#%"
overload func with g0float_[]func of default_overload_precedence
])
dnl
foreachq([func],[nanlike_math_functions],
[foreachq([t],[all_floattypes],[declare_nanlike(func,t)])dnl
fun {tk : tk} g0float_[]func : g0float_nanlike_type(tk) = "mac#%"
overload func with g0float_[]func of default_overload_precedence
])
