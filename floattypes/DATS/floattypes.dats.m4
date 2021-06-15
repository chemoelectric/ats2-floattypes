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

[#define] ATS_PACKNAME "ATS2_FLOATTYPES.floattypes"
[#define] ATS_EXTERN_PREFIX "floattypes_"

[#define ATS_DYNLOADFLAG 0]

staload "prelude/basics_sta.sats"
staload "prelude/SATS/float.sats"
staload "floattypes/SATS/floattypes.sats"

divert(-1)

m4_define([implement_int_to_float],
  [implement g0int2float<$1[]knd,$2[]_kind> = g0int2float_$1_$2
])

m4_define([implement_uint_to_float],
  [implement g0uint2float<$1[]knd,$2[]_kind> = g0uint2float_$1_$2
])

m4_define([implement_float_to_int],
  [implement g0float2int<$1[]_kind,$2[]knd> = g0float2int_$1_$2
])

m4_define([implement_float_to_uint],
  [implement g0float2uint<$1[]_kind,$2[]knd> = g0float2uint_$1_$2
])

m4_define([implement_float_to_float],
  [implement g0float2float<$1[]_kind,$2[]_kind> = g0float2float_$1_$2
])

m4_define([implement_float],
  [implement g0float_$1<$2[]_kind> = g0float_$1_$2
])

divert[]dnl

m4_foreachq([_f],[all_floattypes],
[m4_foreachq([_i],[all_int_kinds],
    [implement_int_to_float(_i,_f)])
m4_foreachq([_i],[all_uint_kinds],
    [implement_uint_to_float(_i,_f)])
m4_foreachq([_i],[all_int_kinds],
    [implement_float_to_int(_f,_i)])
m4_foreachq([_i],[all_uint_kinds],
    [implement_float_to_uint(_f,_i)])
m4_foreachq([_f2],[all_floattypes],
    [implement_float_to_float(_f,_f2)])
])

m4_foreachq([t],[extra_floattypes],[implement_float([neg],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([abs],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([succ],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([pred],t)])
dnl
m4_foreachq([t],[extra_floattypes],[implement_float([add],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([sub],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([mul],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([div],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([mod],t)])
dnl
m4_foreachq([t],[extra_floattypes],[implement_float([lt],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([lte],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([gt],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([gte],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([eq],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([neq],t)])
dnl
m4_foreachq([t],[extra_floattypes],[implement_float([compare],t)])
dnl
m4_foreachq([t],[extra_floattypes],[implement_float([max],t)])
m4_foreachq([t],[extra_floattypes],[implement_float([min],t)])
dnl
m4_foreachq([func],[nullary_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[unary_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[binary_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[ternary_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[nexttowardlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[scalbnlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[scalblnlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[lroundlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[llroundlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[frexplike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[remquolike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[modflike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[lgamma_rlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[jnlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[ilogblike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[nanlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[strtodlike_math_functions],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([func],[strfromd_unsafe],
  [m4_foreachq([t],[all_floattypes],[implement_float(func,t)])])
dnl
m4_foreachq([t],[all_floattypes],[implement_float(huge_val,t)])
