`/*

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

*/'

`#ifndef FLOATTYPES_CATS_FLOATTYPES__HEADER_GUARD__'
`#define FLOATTYPES_CATS_FLOATTYPES__HEADER_GUARD__'

`#include "floattypes/HATS/config.hats"'

`/*
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
'dnl

divert(-1)                      # Not supported on my system yet.
`
#define floattypes__fmod_float fmodf
#define floattypes__fmod_double fmod
#define floattypes__fmod_ldouble fmodl
#define floattypes__fmod_float32 fmodf32
#define floattypes__fmod_float64 fmodf64
#define floattypes__fmod_float128 fmodf128
#define floattypes__fmod_decimal32 fmodd32
#define floattypes__fmod_decimal64 fmodd64
#define floattypes__fmod_decimal128 fmodd128
#define floattypes__fmod_float32x fmodf32x
#define floattypes__fmod_float64x fmodf64x
#define floattypes__fmod_float128x fmodf128x
#define floattypes__fmod_decimal64x fmodd64x
#define floattypes__fmod_decimal128x fmodd128x
'dnl
divert`'dnl

divert(-1)

include(`floattypes/common-macros.m4')

define(`negation_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_neg_$1 (floattypes_$1 f) dnl
{ return (-f); }')

define(`abs_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_abs_$1 (floattypes_$1 f) dnl
{ return ((f < 0) ? (-f) : (f)); }')

define(`successor_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_succ_$1 (floattypes_$1 f) dnl
{ return (f + 1); }')

define(`predecessor_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_pred_$1 (floattypes_$1 f) dnl
{ return (f - 1); }')

define(`binary_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (f1 $3 f2); }')

define(`binary_op_sometype_float',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_$2_$4_$1 ($4 f1, floattypes_$1 f2) dnl
{ return (((floattypes_$1) f1) $3 f2); }')

define(`binary_op_float_sometype',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_$2_$1_$4 (floattypes_$1 f1, $4 f2) dnl
{ return (f1 $3 ((floattypes_$1) f2)); }')

define(`mod_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_mod_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes__fmod_$1 (f1, f2)); }')

define(`comparison_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 $3 f2) ? atsbool_true : atsbool_false); }')

define(`comparison_op_sometype_float',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_$2_$4_$1 ($4 f1, floattypes_$1 f2) dnl
{ return ((((floattypes_$1) f1) $3 f2) ? atsbool_true : atsbool_false); }')

define(`comparison_op_float_sometype',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_$2_$1_$4 (floattypes_$1 f1, $4 f2) dnl
{ return ((f1 $3 ((floattypes_$1) f2)) ? atsbool_true : atsbool_false); }')

define(`compare_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_compare_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 < f2) ? -1 : ((f2 < f1) ? 1 : 0)); }')

define(`min_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_min_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 <= f2) ? f1 : f2); }')

define(`max_op',
`ATSinline() dnl
floattypes_$1 dnl
floattypes__g0float_max_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 >= f2) ? f1 : f2); }')

divert`'dnl

foreach(`t',(extra_floattypes),dnl
``#if' HAVE__`'toupper(t)

negation_op(t)
abs_op(t)
successor_op(t)
predecessor_op(t)
dnl
binary_op(t,`add',`+')
binary_op(t,`sub',`-')
binary_op(t,`mul',`*')
binary_op(t,`div',`/')
dnl
binary_op_sometype_float(t,`add',`+',`int')
binary_op_sometype_float(t,`sub',`-',`int')
binary_op_sometype_float(t,`mul',`*',`int')
binary_op_sometype_float(t,`div',`/',`int')
dnl
binary_op_float_sometype(t,`add',`+',`int')
binary_op_float_sometype(t,`sub',`-',`int')
binary_op_float_sometype(t,`mul',`*',`int')
binary_op_float_sometype(t,`div',`/',`int')
dnl
dnl mod_op(t)
dnl
comparison_op(t,`lt',`<')
comparison_op(t,`lte',`<=')
comparison_op(t,`gt',`>')
comparison_op(t,`gte',`>=')
comparison_op(t,`eq',`==')
comparison_op(t,`neq',`!=')
dnl
comparison_op_sometype_float(t,`lt',`<',`int')
comparison_op_sometype_float(t,`lte',`<=',`int')
comparison_op_sometype_float(t,`gt',`>',`int')
comparison_op_sometype_float(t,`gte',`>=',`int')
comparison_op_sometype_float(t,`eq',`==',`int')
comparison_op_sometype_float(t,`neq',`!=',`int')
dnl
compare_op(t)
dnl
min_op(t)
max_op(t)

`#endif' /* HAVE__`'toupper(t) */

')

`#endif /* FLOATTYPES_CATS_FLOATTYPES__HEADER_GUARD__ */'
