#
# Copyright © 2021 Barry Schwartz
#
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License, as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received copies of the GNU General Public License
# along with this program. If not, see
# <https://www.gnu.org/licenses/>.
#

#--------------------------------------------------------------------------

AC_PREREQ([2.69])
AC_INIT([ats2-floattypes],[1.0.0],[],[ats2-floattypes],[])

AC_CONFIG_SRCDIR([floattypes/SATS/floattypes.sats.m4])

AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AC_CANONICAL_BUILD                 dnl On what platform are we compiling?
AC_CANONICAL_HOST                  dnl For what platform are we compiling?
AC_USE_SYSTEM_EXTENSIONS           dnl Define such macros as _GNU_SOURCE.

#AC_CONFIG_TESTDIR([tests])

AM_INIT_AUTOMAKE
AM_SILENT_RULES
AM_MAINTAINER_MODE
LT_INIT

AC_LANG([C])

CPPFLAGS="${CPPFLAGS}${CPPFLAGS+ }-D__STDC_WANT_IEC_60559_BFP_EXT__"
CPPFLAGS="${CPPFLAGS}${CPPFLAGS+ }-D__STDC_WANT_IEC_60559_DFP_EXT__"
CPPFLAGS="${CPPFLAGS}${CPPFLAGS+ }-D__STDC_WANT_IEC_60559_TYPES_EXT__"
CPPFLAGS="${CPPFLAGS}${CPPFLAGS+ }-D__STDC_WANT_IEC_60559_FUNCS_EXT__"
CPPFLAGS="${CPPFLAGS}${CPPFLAGS+ }-D__STDC_WANT_IEC_60559_ATTRIBS_EXT__"

#--------------------------------------------------------------------------

m4_define([def1],[
  if :; then
    AC_SUBST(HAVE_$1,['1'])
  fi
])

m4_define([def0],[
  if :; then
    AC_SUBST(HAVE_$1,['0'])
  fi
])

#--------------------------------------------------------------------------

AC_DEFUN([MY_MATH_HEADERS],
[[
#define __STDC_WANT_IEC_60559_BFP_EXT__
#define __STDC_WANT_IEC_60559_DFP_EXT__	
#define __STDC_WANT_IEC_60559_TYPES_EXT__
#define __STDC_WANT_IEC_60559_FUNCS_EXT__
#define __STDC_WANT_IEC_60559_ATTRIBS_EXT__
#include <stddef.h>
#include <stdlib.h>
#include <math.h>
#define floattypes_float float
#define floattypes_double double
#define floattypes_ldouble long double
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
]])

AC_DEFUN([MY_CHECK_FLOAT_TYPE],
  [AC_CACHE_CHECK([for floating point type $1],
                  [AS_TR_SH([my_cv_float_type_$1])],
    [AC_COMPILE_IFELSE([
      AC_LANG_PROGRAM(
        [MY_MATH_HEADERS],
        [[
           $1 x = -1.1;
           $1 y = 0.0;
           $1 z = 1.1;
        ]])],
        [AS_TR_SH([my_cv_float_type_$1])=yes],
        [AS_TR_SH([my_cv_float_type_$1])=no])])
    case x"${AS_TR_SH([my_cv_float_type_$1])}" in
      xyes) $2 ;;
      *)    $3 ;;
    esac])

AC_DEFUN([MY_CHECK_FLOAT_LITERAL_SUFFIXES],
  [AC_CACHE_CHECK([suffix for $1 literals],
                  [AS_TR_SH([my_cv_float_suffix_$1])],
    [AS_TR_SH([my_cv_float_suffix_$1])=
     if test "[$]{AS_TR_SH([HAVE_floattypes_$1])}" = 1; then
       m4_foreach_w([suffix],$3,
         [if test -z "[$]{AS_TR_SH([my_cv_float_suffix_$1])}"; then
            AC_COMPILE_IFELSE([
             AC_LANG_PROGRAM(
               [MY_MATH_HEADERS],
               [[
                 _Static_assert(sizeof (1234.5e-6]]suffix[[ +
                                           345.7]]suffix[[ +
                                           0.]]suffix[[ +
                                           1.]]suffix[[)
                                  == sizeof ($2));
               ]])],
               [AS_TR_SH([my_cv_float_suffix_$1])='suffix'])
          fi
         ])
     else
        AS_ECHO_N(["(type not supported)"])
     fi
    ])
   AC_SUBST(AS_TR_SH([FLOAT_SUFFIX_$1],dnl
           AS_TR_SH([${my_cv_float_suffix_$1}])))])

AC_DEFUN([MY_CHECK_MATH_FUNC],
  [AC_CACHE_CHECK([for math function $1],
                  [AS_TR_SH([my_cv_math_func_$1])],
    [if test "[$]{AS_TR_SH([HAVE_floattypes_$2])}" = 1; then
       AS_ECHO_N(["($5) "])
       AC_LINK_IFELSE([
         AC_LANG_PROGRAM(
           [MY_MATH_HEADERS],
           [m4_case($5,
                    [unary],[floattypes_$2 x = $1 ((floattypes_$2) 1.2);],
                    [binary],[floattypes_$2 x = $1 ((floattypes_$2) 1.2,
                                                    (floattypes_$2) 3.4);],
                    [ternary],[floattypes_$2 x = $1 ((floattypes_$2) 1.2,
                                                    (floattypes_$2) 3.4,
                                                    (floattypes_$2) 5.6);],
                    [ilogblike],[int x = $1 ((floattypes_$2) 1.2);],
                    [scalbnlike],[floattypes_$2 x = $1 ((floattypes_$2) 1.2, 1);],
                    [scalblnlike],[floattypes_$2 x = $1 ((floattypes_$2) 1.2, 1L);],
                    [lroundlike],[long int x = $1 ((floattypes_$2) 1.2);],
                    [llroundlike],[long long int x = $1 ((floattypes_$2) 1.2);],
                    [jnlike],[floattypes_$2 x = $1 (1, (floattypes_$2) 1.2);],
                    [modflike],[floattypes_$2 y = (floattypes_$2) 1.2;
                                floattypes_$2 x = $1 ((floattypes_$2) 3.4, &y);],
                    [frexplike],[int y = 1;
                                 floattypes_$2 x = $1 ((floattypes_$2) 3.4, &y);],
                    [nanlike],[floattypes_$2 x = $1 ("");]
                    [nexttowardlike],[/* This may fail on types like _Float128. */
                                      floattypes_$2 x = $1 ((floattypes_$2) 1.2, 3.4L)],
                    [strtodlike],[floattypes_$2 x = $1 ("1.2", NULL);],
                    [strfromdlike],[char *s = malloc(1001);
                                    int n = $1 (s, 1000, "%g", (floattypes_$2) 1.2);],
                    [_Static_assert(false, "This branch should not be reached.");])
           ])],
           [AS_TR_SH([my_cv_math_func_$1])=yes],
           [AS_TR_SH([my_cv_math_func_$1])=no])
     else
        AS_TR_SH([my_cv_math_func_$1])=no
        AS_ECHO_N(["(type not supported) "])
     fi])
   case x"${AS_TR_SH([my_cv_math_func_$1])}" in
     xyes) $3 ;;
     *)    $4 ;;
   esac])

#--------------------------------------------------------------------------
#
# Checks for programs.

AC_PROG_CC
AC_PROG_CC_C99
AC_PROG_CC_C_O
AC_CHECK_PROGS([PATSOPT],[patsopt])
AC_CHECK_PROGS([M4],[m4])
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P
AC_PROG_AWK
AC_PROG_SED
AC_PROG_FGREP
AC_PROG_EGREP

#--------------------------------------------------------------------------
#
# Checks for libraries.

#--------------------------------------------------------------------------
#
# Checks for header files.

#--------------------------------------------------------------------------
#
# Checks for typedefs, structures, and compiler characteristics.

m4_define([check_type],
          [MY_CHECK_FLOAT_TYPE([$1],[def1([$2])],[def0([$2])])])

m4_define([the_floattypes],[
  float
  double
  ldouble
  float32
  float64
  float128
  decimal32
  decimal64
  decimal128
  float32x
  float64x
  float128x
  decimal64x
  decimal128x
])

check_type([float],[floattypes_float])
check_type([double],[floattypes_double])
check_type([long double],[floattypes_ldouble])

check_type([_Float32],[floattypes_float32])
check_type([_Float64],[floattypes_float64])
check_type([_Float128],[floattypes_float128])

check_type([_Decimal32],[floattypes_decimal32])
check_type([_Decimal64],[floattypes_decimal64])
check_type([_Decimal128],[floattypes_decimal128])

check_type([_Float32x],[floattypes_float32x])
check_type([_Float64x],[floattypes_float64x])
check_type([_Float128x],[floattypes_float128x])

check_type([_Decimal64x],[floattypes_decimal64x])
check_type([_Decimal128x],[floattypes_decimal128x])

#--------------------------------------------------------------------------
#
# Check how to write literal constants of the different types.
#
# (We know already to append "f" or "F" for float, nothing for double,
# and "l" or "L" for ldouble. Furthermore, these suffixes are
# supported in ATS2.)
#

MY_CHECK_FLOAT_LITERAL_SUFFIXES([float32],[_Float32],[F32 f32 F f])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([float64],[_Float64],[F64 f64])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([float128],[_Float128],[F128 f128 Q q])

MY_CHECK_FLOAT_LITERAL_SUFFIXES([decimal32],[_Decimal32],[D32 d32 DF df])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([decimal64],[_Decimal64],[D64 d64 DD dd])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([decimal128],[_Decimal128],[D128 d128 DL dl])

MY_CHECK_FLOAT_LITERAL_SUFFIXES([float32x],[_Float32x],[F32x f32x Fx fx])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([float64x],[_Float64x],[F64x f64x W w])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([float128x],[_Float128x],[F128x f128x])

MY_CHECK_FLOAT_LITERAL_SUFFIXES([decimal64x],[_Decimal64x],[D64x d64x])
MY_CHECK_FLOAT_LITERAL_SUFFIXES([decimal128x],[_Decimal128x],[D128x d128x])

#--------------------------------------------------------------------------
#
# Checks for library functions.

# We will need the math library.
AC_CHECK_LIB([m],[sin])

m4_define([check_math_func],
          [MY_CHECK_MATH_FUNC([$1],[$2],[def1([$3])],[def0([$3])],[$4])])

m4_define([check_regular_math_func],[
  check_math_func($1[f],[float],[floattypes_]$1[_float],[$2])
  check_math_func($1,[double],[floattypes_]$1[_double],[$2])
  check_math_func($1[l],[ldouble],[floattypes_]$1[_ldouble],[$2])
  check_math_func($1[f32],[float32],[floattypes_]$1[_float32],[$2])
  check_math_func($1[f64],[float64],[floattypes_]$1[_float64],[$2])
  check_math_func($1[f128],[float128],[floattypes_]$1[_float128],[$2])
  check_math_func($1[d32],[decimal32],[floattypes_]$1[_decimal32],[$2])
  check_math_func($1[d64],[decimal64],[floattypes_]$1[_decimal64],[$2])
  check_math_func($1[d128],[decimal128],[floattypes_]$1[_decimal128],[$2])
  check_math_func($1[f32x],[float32x],[floattypes_]$1[_float32x],[$2])
  check_math_func($1[f64x],[float64x],[floattypes_]$1[_float64x],[$2])
  check_math_func($1[f128x],[float128x],[floattypes_]$1[_float128x],[$2])
  check_math_func($1[d64x],[decimal64x],[floattypes_]$1[_decimal64x],[$2])
  check_math_func($1[d128x],[decimal128x],[floattypes_]$1[_decimal128x],[$2])
])

m4_define([the_regular_math_function_prototypes],[
  unary binary ternary
  lroundlike llroundlike
  ilogblike scalbnlike scalblnlike
  jnlike modflike frexplike nanlike
  nexttowardlike
])

m4_define([the_unary_math_functions],[
  ceil floor trunc round rint nearbyint
  sqrt cbrt
  exp exp2 exp10 expm1
  log log2 log10 log1p
  logb
  sin cos tan
  asin acos atan
  sinh cosh tanh
  asinh acosh atanh
  erf erfc
  lgamma tgamma
  j0 j1 y0 y1
])

m4_define([the_binary_math_functions],[
  fmin fmax
  fdim fmod
  pow hypot
  nextafter
  copysign
  atan2
])

m4_define([the_ternary_math_functions],[
  fma
])

m4_define([the_ilogblike_math_functions],[
  ilogb
])

m4_define([the_scalbnlike_math_functions],[
  scalbn
  ldexp
])

m4_define([the_scalblnlike_math_functions],[
  scalbln
])

m4_define([the_lroundlike_math_functions],[
  lround lrint
])

m4_define([the_llroundlike_math_functions],[
  llround llrint
])

m4_define([the_jnlike_math_functions],[
  jn yn
])

m4_define([the_modflike_math_functions],[
  modf
])

m4_define([the_frexplike_math_functions],[
  frexp
])

m4_define([the_nanlike_math_functions],[
  nan
])

m4_define([the_nexttowardlike_math_functions],[
  nexttoward
])

dnl The next one is frexplike but irregular in function name
dnl construction.
m4_define([the_lgamma_rlike_math_functions],
  lgamma_r
)

m4_define([the_strtodlike_math_functions],[
  strtod
])

m4_define([the_strfromdlike_math_functions],[
  strfromd
])

m4_define([the_regular_math_functions],
  m4_foreach_w([prototype],the_regular_math_function_prototypes,
    [m4_pushdef([the_functions],[the_]prototype[_math_functions])
     the_functions
     m4_popdef([the_functions])])
)

m4_define([the_irregular_math_functions],
  the_lgamma_rlike_math_functions
  the_strtodlike_math_functions
  the_strfromdlike_math_functions
)

m4_define([the_math_functions],
  the_regular_math_functions
  the_irregular_math_functions
)

m4_foreach_w([prototype],the_regular_math_function_prototypes,
  [m4_pushdef([the_functions],[the_]prototype[_math_functions])
   m4_foreach_w([the_func],the_functions,
                [check_regular_math_func([the_func],[prototype])])
   m4_popdef([the_functions])])

check_math_func([lgammaf_r],[float],[floattypes_lgamma_r_float],[frexplike])
check_math_func([lgamma_r],[double],[floattypes_lgamma_r_double],[frexplike])
check_math_func([lgammal_r],[ldouble],[floattypes_lgamma_r_ldouble],[frexplike])
check_math_func([lgammaf32_r],[float32],[floattypes_lgamma_r_float32],[frexplike])
check_math_func([lgammaf64_r],[float64],[floattypes_lgamma_r_float64],[frexplike])
check_math_func([lgammaf128_r],[float128],[floattypes_lgamma_r_float128],[frexplike])
check_math_func([lgammad32_r],[decimal32],[floattypes_lgamma_r_decimal32],[frexplike])
check_math_func([lgammad64_r],[decimal64],[floattypes_lgamma_r_decimal64],[frexplike])
check_math_func([lgammad128_r],[decimal128],[floattypes_lgamma_r_decimal128],[frexplike])
check_math_func([lgammaf32x_r],[float32x],[floattypes_lgamma_r_float32x],[frexplike])
check_math_func([lgammaf64x_r],[float64x],[floattypes_lgamma_r_float64x],[frexplike])
check_math_func([lgammaf128x_r],[float128x],[floattypes_lgamma_r_float128x],[frexplike])
check_math_func([lgammad64x_r],[decimal64x],[floattypes_lgamma_r_decimal64x],[frexplike])
check_math_func([lgammad128x_r],[decimal128x],[floattypes_lgamma_r_decimal128x],[frexplike])

check_math_func([strfromf],[float],[floattypes_strfromd_float],[strfromdlike])
check_math_func([strfromd],[double],[floattypes_strfromd_double],[strfromdlike])
check_math_func([strfroml],[ldouble],[floattypes_strfromd_ldouble],[strfromdlike])
check_math_func([strfromf32],[float32],[floattypes_strfromd_float32],[strfromdlike])
check_math_func([strfromf64],[float64],[floattypes_strfromd_float64],[strfromdlike])
check_math_func([strfromf128],[float128],[floattypes_strfromd_float128],[strfromdlike])
check_math_func([strfromd32],[decimal32],[floattypes_strfromd_decimal32],[strfromdlike])
check_math_func([strfromd64],[decimal64],[floattypes_strfromd_decimal64],[strfromdlike])
check_math_func([strfromd128],[decimal128],[floattypes_strfromd_decimal128],[strfromdlike])
check_math_func([strfromf32x],[float32x],[floattypes_strfromd_float32x],[strfromdlike])
check_math_func([strfromf64x],[float64x],[floattypes_strfromd_float64x],[strfromdlike])
check_math_func([strfromf128x],[float128x],[floattypes_strfromd_float128x],[strfromdlike])
check_math_func([strfromd64x],[decimal64x],[floattypes_strfromd_decimal64x],[strfromdlike])
check_math_func([strfromd128x],[decimal128x],[floattypes_strfromd_decimal128x],[strfromdlike])

check_math_func([strtof],[float],[floattypes_strtod_float],[strtodlike])
check_math_func([strtod],[double],[floattypes_strtod_double],[strtodlike])
check_math_func([strtol],[ldouble],[floattypes_strtod_ldouble],[strtodlike])
check_math_func([strtof32],[float32],[floattypes_strtod_float32],[strtodlike])
check_math_func([strtof64],[float64],[floattypes_strtod_float64],[strtodlike])
check_math_func([strtof128],[float128],[floattypes_strtod_float128],[strtodlike])
check_math_func([strtod32],[decimal32],[floattypes_strtod_decimal32],[strtodlike])
check_math_func([strtod64],[decimal64],[floattypes_strtod_decimal64],[strtodlike])
check_math_func([strtod128],[decimal128],[floattypes_strtod_decimal128],[strtodlike])
check_math_func([strtof32x],[float32x],[floattypes_strtod_float32x],[strtodlike])
check_math_func([strtof64x],[float64x],[floattypes_strtod_float64x],[strtodlike])
check_math_func([strtof128x],[float128x],[floattypes_strtod_float128x],[strtodlike])
check_math_func([strtod64x],[decimal64x],[floattypes_strtod_decimal64x],[strtodlike])
check_math_func([strtod128x],[decimal128x],[floattypes_strtod_decimal128x],[strtodlike])

#--------------------------------------------------------------------------

# You can use ‘@GNU@’ to make GNU Make constructs unbothersome to
# Automake. (By the way, you often can use ‘$(eval ...)’ as well, but
# @GNU@ here may be better.)
AC_SUBST([GNU],[])

StM_REQUIRE_GNU_MAKE_IN_PATH
StM_CONFIG_MAKEFILES
#StM_CONFIG_MAKEFILES([tests/Makefile],[tests/GNUmakefile])

# We want common-macros.m4 to be where a mere POSIX m4 can find it.
AC_CONFIG_FILES([common-macros.m4])

AC_CONFIG_FILES([ats2-floattypes.pc])

AC_CONFIG_COMMANDS([floattypes/HATS/config.hats],[
  echo '/*' > floattypes/HATS/config.hats
  echo 'This file is generated by config.status;' >> floattypes/HATS/config.hats
  echo 'it can be read by both C and ATS2 compilers.' >> floattypes/HATS/config.hats
  echo '*/' >> floattypes/HATS/config.hats
  echo '' >> floattypes/HATS/config.hats
  m4_foreach_w([t],the_floattypes,[
    echo "${DEF_floattypes_[]t}" >> floattypes/HATS/config.hats
])
  m4_foreach_w([f],the_math_functions,
    [echo '' >> floattypes/HATS/config.hats
     m4_foreach_w([t],the_floattypes,[
        echo "${DEF_floattypes_[]f[]_[]t}" >> floattypes/HATS/config.hats
])])
],[
  m4_foreach_w([t],the_floattypes,[
    DEF_floattypes_[]t="@%:@define HAVE_floattypes_[]t ${HAVE_floattypes_[]t}"
])
  m4_foreach_w([f],the_math_functions,
    [m4_foreach_w([t],the_floattypes,[
      DEF_floattypes_[]f[]_[]t="@%:@define HAVE_floattypes_[]f[]_[]t ${HAVE_floattypes_[]f[]_[]t}"
])])
])

AC_OUTPUT

#--------------------------------------------------------------------------
# local variables:
# coding: utf-8
# end:
