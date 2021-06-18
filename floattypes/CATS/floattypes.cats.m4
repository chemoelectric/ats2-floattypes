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

#ifndef FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__
#define FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__

#include "floattypes/HATS/config.hats"
#include "floattypes/CATS/defines.cats"
#include <math.h>
#include <fenv.h>
#include <stdlib.h>


_Static_assert(sizeof (atstype_float) == sizeof (float),
               "atstype_float is not the same as float");
_Static_assert(sizeof (atstype_double) == sizeof (double),
               "atstype_double is not the same as double");
_Static_assert(sizeof (atstype_ldouble) == sizeof (long double),
               "atstype_ldouble is not the same as long double");

divert(-1)

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

m4_define([float_to_int],
[ATSinline() dnl
atstype_$2 dnl
floattypes_g0float2int_$1_$2 (floattypes_$1 f) dnl
{ return ((atstype_$2) f); }
])

m4_define([float_to_uint],
[ATSinline() dnl
atstype_$2 dnl
floattypes_g0float2uint_$1_$2 (floattypes_$1 f) dnl
{ return ((atstype_$2) f); }
])

m4_define([float_to_float],
[ATSinline() dnl
floattypes_$2 dnl
floattypes_g0float2float_$1_$2 (floattypes_$1 f) dnl
{ return ((floattypes_$2) f); }
])

m4_define([negation_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_neg_$1 (floattypes_$1 f) dnl
{ return (-f); }
#endif
])

m4_define([abs_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_abs_$1 (floattypes_$1 f) dnl
{ return ((f < 0) ? (-f) : (f)); }
#endif
])

m4_define([successor_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_succ_$1 (floattypes_$1 f) dnl
{ return (f + 1); }
#endif
])

m4_define([predecessor_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_pred_$1 (floattypes_$1 f) dnl
{ return (f - 1); }
#endif
])

m4_define([binary_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (f1 $3 f2); }
#endif
])

m4_define([mod_op],
[#if HAVE_floattypes_fmod_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_mod_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_fmod_$1 (f1, f2)); }
#endif
])

m4_define([comparison_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 $3 f2) ? atsbool_true : atsbool_false); }
#endif
])

m4_define([compare_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_compare_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 < f2) ? -1 : ((f2 < f1) ? 1 : 0)); }
#endif
])

m4_define([min_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_min_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 <= f2) ? f1 : f2); }
#endif
])

m4_define([max_op],
[#if HAVE_floattypes_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_max_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return ((f1 >= f2) ? f1 : f2); }
#endif
])

m4_define([nullary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (void) dnl
{ return (floattypes_$2_$1 ()); }
#endif
])

m4_define([unary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif
])

m4_define([binary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_$2_$1 (f1, f2)); }
#endif
])

m4_define([ternary_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, dnl
floattypes_$1 f2, dnl
floattypes_$1 f3) dnl
{ return (floattypes_$2_$1 (f1, f2, f3)); }
#endif
])

m4_define([nexttowardlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, atstype_ldouble f2) dnl
{ return (floattypes_$2_$1 (f1, f2)); }
#endif
])

m4_define([scalbnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_int i) dnl
{ return (floattypes_$2_$1 (f, i)); }
#endif
])

m4_define([scalblnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_lint i) dnl
{ return (floattypes_$2_$1 (f, i)); }
#endif
])

m4_define([lroundlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_lint dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif
])

m4_define([llroundlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_llint dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif
])

m4_define([frexplike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, atstype_int *p) dnl
{ return (floattypes_$2_$1 (f, p)); }
#endif
])

m4_define([remquolike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2, dnl
atstype_int *quo) dnl
{ return (floattypes_$2_$1 (f1, f2, quo)); }
#endif
])

m4_define([modflike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (floattypes_$1 f, floattypes_$1 *p) dnl
{ return (floattypes_$2_$1 (f, p)); }
#endif
])

m4_define([jnlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (atstype_int n, floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (n, f)); }
#endif
])

m4_define([ilogblike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_int dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif
])

m4_define([isfinitelike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_bool dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f) != 0); }
#endif
])

m4_define([isgreaterlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_bool dnl
floattypes_g0float_$2_$1 (floattypes_$1 f1, floattypes_$1 f2) dnl
{ return (floattypes_$2_$1 (f1, f2) != 0); }
#endif
])

m4_define([nanlike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
floattypes_$1 dnl
floattypes_g0float_$2_$1 (atstype_string s) dnl
{ return (floattypes_$2_$1 ((const char *) s)); }
#endif
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
#endif
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
atstype_string fmt, floattypes_$1 f) dnl
{ return (floattypes_$2_$1 ((char *) s, n, (const char *) fmt, f)); }
#endif
])

m4_define([fpclassifylike_fn],
[#if HAVE_floattypes_$2_$1
ATSinline() dnl
atstype_int dnl
floattypes_g0float_$2_$1 (floattypes_$1 f) dnl
{ return (floattypes_$2_$1 (f)); }
#endif
])

m4_define([typed_constant_value],
[#if HAVE_floattypes_$2_$1
m4_pushdef([_t],[m4_translit($2,m4_uppercase,m4_lowercase)])dnl
ATSinline() $3 dnl
floattypes_g0float_[]_t[]_$1 (void) { return (floattypes_$2_$1); }
m4_popdef([_t])dnl
#endif
])

divert[]dnl


m4_foreachq([_f],[all_floattypes],
[[#if HAVE_floattypes_]_f
m4_foreachq([_i],[all_int_kinds],
    [int_to_float(_i,_f)])dnl
m4_foreachq([_i],[all_uint_kinds],
    [uint_to_float(_i,_f)])dnl
m4_foreachq([_i],[all_int_kinds],
    [float_to_int(_f,_i)])dnl
m4_foreachq([_i],[all_uint_kinds],
    [float_to_uint(_f,_i)])dnl
[#endif /* HAVE_floattypes_]_f */

])

m4_foreachq([_f1],[all_floattypes],
[[#if HAVE_floattypes_]_f1
m4_foreachq([_f2],[all_floattypes],
[[#if HAVE_floattypes_]_f2
float_to_float(_f1,_f2)dnl
[#endif /* HAVE_floattypes_]_f2 */
])dnl
[#endif /* HAVE_floattypes_]_f1 */

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
dnl
m4_foreachq([func],[fpclassifylike_math_macros],
  [m4_foreachq([t],[all_floattypes],
    [ilogblike_fn(t,func)])])
dnl
m4_foreachq([func],[isfinitelike_math_macros],
  [m4_foreachq([t],[all_floattypes],
    [isfinitelike_fn(t,func)])])
dnl
m4_foreachq([func],[isgreaterlike_math_macros],
  [m4_foreachq([t],[all_floattypes],
    [isgreaterlike_fn(t,func)])])
dnl
m4_foreachq([t],[all_floattypes],
  [typed_constant_value(t,[HUGE_VAL],[floattypes_]t)])
dnl
m4_foreachq([t],[all_floattypes],
  [typed_constant_value(t,[SNAN],[floattypes_]t)])

m4_foreachq([t],[extra_floattypes],
[#if HAVE_floattypes_strfromd_[]t
extern atsvoid_t0ype floattypes_fprint_[]t (atstype_ref r, floattypes_[]t x);
extern atsvoid_t0ype floattypes_print_[]t (floattypes_[]t x);
extern atsvoid_t0ype floattypes_prerr_[]t (floattypes_[]t x);
#endif

])

#endif /* FLOATTYPES_CATS_FLOATTYPES_HEADER_GUARD__ */
