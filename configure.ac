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

AC_DEFUN([MY_CHECK_MATH_FUNC],
  [AC_CACHE_CHECK([for math function $1],
                  [AS_TR_SH([my_cv_math_func_$1])],
    [AC_COMPILE_IFELSE([
      AC_LANG_PROGRAM(
        [MY_MATH_HEADERS],
        [[
           void *p = $1;
        ]])],
        [AS_TR_SH([my_cv_math_func_$1])=yes],
        [AS_TR_SH([my_cv_math_func_$1])=no])])
    case x"${AS_TR_SH([my_cv_math_func_$1])}" in
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
          [MY_CHECK_MATH_FUNC([$1],[def1([$2])],[def0([$2])])])

m4_define([the_regular_math_functions],[
  nan
  ceil floor trunc
  round lround llround
  rint lrint llrint nearbyint
  fmin fmax
  fma fdim fmod
  pow
  sqrt hypot cbrt
  exp exp2 exp10 expm1
  log log2 log10 log1p
  ilogb logb
  frexp ldexp modf
  scalbn scalbln
  nextafter nexttoward
  copysign
  sin cos tan
  asin acos atan atan2
  sinh cosh tanh
  asinh acosh atanh
  erf erfc
  lgamma tgamma
  j0 j1 jn y0 y1 yn
])

m4_define([the_irregular_math_functions],[
  lgamma_r
  strfrom strto
])

m4_foreach_w([the_func],the_regular_math_functions,[
  check_math_func(the_func[f],[floattypes_]the_func[_float])
  check_math_func(the_func,[floattypes_]the_func[_double])
  check_math_func(the_func[l],[floattypes_]the_func[_ldouble])
  check_math_func(the_func[f32],[floattypes_]the_func[_float32])
  check_math_func(the_func[f64],[floattypes_]the_func[_float64])
  check_math_func(the_func[f128],[floattypes_]the_func[_float128])
  check_math_func(the_func[d32],[floattypes_]the_func[_decimal32])
  check_math_func(the_func[d64],[floattypes_]the_func[_decimal64])
  check_math_func(the_func[d128],[floattypes_]the_func[_decimal128])
  check_math_func(the_func[f32x],[floattypes_]the_func[_float32x])
  check_math_func(the_func[f64x],[floattypes_]the_func[_float64x])
  check_math_func(the_func[f128x],[floattypes_]the_func[_float128x])
  check_math_func(the_func[d64x],[floattypes_]the_func[_decimal64x])
  check_math_func(the_func[d128x],[floattypes_]the_func[_decimal128x])
])

check_math_func([lgammaf_r],[floattypes_lgamma_r_float])
check_math_func([lgamma_r],[floattypes_lgamma_r_double])
check_math_func([lgammal_r],[floattypes_lgamma_r_ldouble])
check_math_func([lgammaf32_r],[floattypes_lgamma_r_float32])
check_math_func([lgammaf64_r],[floattypes_lgamma_r_float64])
check_math_func([lgammaf128_r],[floattypes_lgamma_r_float128])
check_math_func([lgammad32_r],[floattypes_lgamma_r_decimal32])
check_math_func([lgammad64_r],[floattypes_lgamma_r_decimal64])
check_math_func([lgammad128_r],[floattypes_lgamma_r_decimal128])
check_math_func([lgammaf32x_r],[floattypes_lgamma_r_float32x])
check_math_func([lgammaf64x_r],[floattypes_lgamma_r_float64x])
check_math_func([lgammaf128x_r],[floattypes_lgamma_r_float128x])
check_math_func([lgammad64x_r],[floattypes_lgamma_r_decimal64x])
check_math_func([lgammad128x_r],[floattypes_lgamma_r_decimal128x])

check_math_func([strfromf],[floattypes_strfrom_float])
check_math_func([strfromd],[floattypes_strfrom_double])
check_math_func([strfroml],[floattypes_strfrom_ldouble])
check_math_func([strfromf32],[floattypes_strfrom_float32])
check_math_func([strfromf64],[floattypes_strfrom_float64])
check_math_func([strfromf128],[floattypes_strfrom_float128])
check_math_func([strfromd32],[floattypes_strfrom_decimal32])
check_math_func([strfromd64],[floattypes_strfrom_decimal64])
check_math_func([strfromd128],[floattypes_strfrom_decimal128])
check_math_func([strfromf32x],[floattypes_strfrom_float32x])
check_math_func([strfromf64x],[floattypes_strfrom_float64x])
check_math_func([strfromf128x],[floattypes_strfrom_float128x])
check_math_func([strfromd64x],[floattypes_strfrom_decimal64x])
check_math_func([strfromd128x],[floattypes_strfrom_decimal128x])

check_math_func([strtof],[floattypes_strto_float])
check_math_func([strtod],[floattypes_strto_double])
check_math_func([strtol],[floattypes_strto_ldouble])
check_math_func([strtof32],[floattypes_strto_float32])
check_math_func([strtof64],[floattypes_strto_float64])
check_math_func([strtof128],[floattypes_strto_float128])
check_math_func([strtod32],[floattypes_strto_decimal32])
check_math_func([strtod64],[floattypes_strto_decimal64])
check_math_func([strtod128],[floattypes_strto_decimal128])
check_math_func([strtof32x],[floattypes_strto_float32x])
check_math_func([strtof64x],[floattypes_strto_float64x])
check_math_func([strtof128x],[floattypes_strto_float128x])
check_math_func([strtod64x],[floattypes_strto_decimal64x])
check_math_func([strtod128x],[floattypes_strto_decimal128x])

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
  m4_foreach_w([f],the_regular_math_functions
                   the_irregular_math_functions,
    [echo '' >> floattypes/HATS/config.hats
     m4_foreach_w([t],the_floattypes,[
        echo "${DEF_floattypes_[]f[]_[]t}" >> floattypes/HATS/config.hats
])])
],[
  m4_foreach_w([t],the_floattypes,[
    DEF_floattypes_[]t="@%:@define floattypes_[]t ${HAVE_floattypes_[]t}"
])
  m4_foreach_w([f],the_regular_math_functions
                   the_irregular_math_functions,
    [m4_foreach_w([t],the_floattypes,[
      DEF_floattypes_[]f[]_[]t="@%:@define floattypes_[]f[]_[]t ${HAVE_floattypes_[]f[]_[]t}"
])])
])

AC_OUTPUT

#--------------------------------------------------------------------------
# local variables:
# coding: utf-8
# end:
