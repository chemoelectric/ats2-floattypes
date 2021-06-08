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

[#define floattypes_fmod_float fmodf
#define floattypes_fmod_double fmod
#define floattypes_fmod_ldouble fmodl
#define floattypes_fmod_float32 fmodf32
#define floattypes_fmod_float64 fmodf64
#define floattypes_fmod_float128 fmodf128
#define floattypes_fmod_decimal32 fmodd32
#define floattypes_fmod_decimal64 fmodd64
#define floattypes_fmod_decimal128 fmodd128
#define floattypes_fmod_float32x fmodf32x
#define floattypes_fmod_float64x fmodf64x
#define floattypes_fmod_float128x fmodf128x
#define floattypes_fmod_decimal64x fmodd64x
#define floattypes_fmod_decimal128x fmodd128x
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
[#if HAVE_floattypes_$1
#if HAVE_floattypes_fmod_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_mod_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_fmod_$1 (f1, f2)); }
#endif /* HAVE_floattypes_fmod_$1 */
#endif /* HAVE_floattypes_$1 */
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

divert[]dnl

foreach([t],(extra_floattypes),[negation_op(t)])
foreach([t],(extra_floattypes),[abs_op(t)])
foreach([t],(extra_floattypes),[successor_op(t)])
foreach([t],(extra_floattypes),[predecessor_op(t)])
dnl
foreach([t],(extra_floattypes),[binary_op(t,[add],[+])])
foreach([t],(extra_floattypes),[binary_op(t,[sub],[-])])
foreach([t],(extra_floattypes),[binary_op(t,[mul],[*])])
foreach([t],(extra_floattypes),[binary_op(t,[div],[/])])
dnl
foreach([t],(extra_floattypes),[mod_op(t)])
dnl
foreach([t],(extra_floattypes),[comparison_op(t,[lt],[<])])
foreach([t],(extra_floattypes),[comparison_op(t,[lte],[<=])])
foreach([t],(extra_floattypes),[comparison_op(t,[gt],[>])])
foreach([t],(extra_floattypes),[comparison_op(t,[gte],[>=])])
foreach([t],(extra_floattypes),[comparison_op(t,[eq],[==])])
foreach([t],(extra_floattypes),[comparison_op(t,[neq],[!=])])
dnl
foreach([t],(extra_floattypes),[compare_op(t)])
dnl
foreach([t],(extra_floattypes),[min_op(t)])
foreach([t],(extra_floattypes),[max_op(t)])

[#endif /* FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__ */]
