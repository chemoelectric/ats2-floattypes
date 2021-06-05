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

m4_define([add_def],[AC_SUBST(DEF_[]m4_toupper($1),['define HAVE_[]m4_toupper($1) 1'])])
m4_define([add_undef],[AC_SUBST(DEF_[]m4_toupper($1),['undef HAVE_[]m4_toupper($1)'])])

m4_define([check_type],[AC_CHECK_TYPE([$1],[add_def([$1])],[add_undef([$1])])])

check_type([_Float32])
check_type([_Float64])
check_type([_Float128])

check_type([_Decimal32])
check_type([_Decimal64])
check_type([_Decimal128])

check_type([_Float32x])
check_type([_Float64x])
check_type([_Float128x])

check_type([_Decimal64x])
check_type([_Decimal128x])

#--------------------------------------------------------------------------
#
# Checks for library functions.

#--------------------------------------------------------------------------

# You can use ‘@GNU@’ to make GNU Make constructs unbothersome to
# Automake. (By the way, you often can use ‘$(eval ...)’ as well, but
# @GNU@ here may be better.)
AC_SUBST([GNU],[])

StM_REQUIRE_GNU_MAKE_IN_PATH
StM_CONFIG_MAKEFILES
#StM_CONFIG_MAKEFILES([tests/Makefile],[tests/GNUmakefile])

# We want common-macros.m4 to be where a mere POSIX m4 can find it.
AC_CONFIG_FILES([floattypes/common-macros.m4])

AC_CONFIG_FILES([floattypes/HATS/config.hats])
AC_CONFIG_FILES([ats2-floattypes.pc])

AC_OUTPUT

#--------------------------------------------------------------------------
# local variables:
# coding: utf-8
# end:
