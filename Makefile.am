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

.DELETE_ON_ERROR:

EXTRA_DIST =
BUILT_SOURCES =
TESTS =

MOSTLYCLEANFILES =
CLEANFILES =
DISTCLEANFILES =

ACLOCAL_AMFLAGS = -I m4 --install

AUTOMAKE_OPTIONS =
AUTOMAKE_OPTIONS += foreign
AUTOMAKE_OPTIONS += subdir-objects
AUTOMAKE_OPTIONS += -Wno-portability

@GNU@ include $(srcdir)/silent-rules.mk
EXTRA_DIST += $(srcdir)/silent-rules.mk

EXTRA_DIST += README
EXTRA_DIST += AUTHORS

DISTCLEANFILES += Makefile
DISTCLEANFILES += floattypes/HATS/config.hats

######################################################################

lib_LTLIBRARIES = libats2-floattypes.la
libats2_floattypes_la_SOURCES =
libats2_floattypes_la_SOURCES += floattypes/SATS/floattypes_sats.c
libats2_floattypes_la_SOURCES += floattypes/DATS/floattypes_dats.c

nobase_nodist_pkginclude_HEADERS =
nobase_nodist_pkginclude_HEADERS += floattypes/CATS/floattypes.cats
nobase_nodist_pkginclude_HEADERS += floattypes/SATS/floattypes.sats
nobase_nodist_pkginclude_HEADERS += floattypes/DATS/floattypes.dats

nobase_dist_pkginclude_HEADERS =
nobase_dist_pkginclude_HEADERS += floattypes/HATS/floattypes.hats

pkghostincludedir = $(pkgincludedir)/$(host_triplet)
nobase_nodist_pkghostinclude_HEADERS =
nobase_nodist_pkghostinclude_HEADERS += floattypes/HATS/config.hats
nobase_nodist_pkghostinclude_HEADERS += floattypes/CATS/constants.cats

pkgconfigdir = ${libdir}/pkgconfig
nodist_pkgconfig_DATA = ats2-floattypes.pc

EXTRA_DIST += floattypes/CATS/floattypes.cats.m4
EXTRA_DIST += floattypes/CATS/constants.cats.m4
EXTRA_DIST += floattypes/SATS/floattypes.sats.m4
EXTRA_DIST += floattypes/DATS/floattypes.dats.m4

BUILT_SOURCES += floattypes/CATS/floattypes.cats
BUILT_SOURCES += floattypes/CATS/constants.cats
BUILT_SOURCES += floattypes/SATS/floattypes.sats
BUILT_SOURCES += floattypes/SATS/floattypes_sats.c
BUILT_SOURCES += floattypes/DATS/floattypes.dats
BUILT_SOURCES += floattypes/DATS/floattypes_dats.c

CLEANFILES += $(BUILT_SOURCES)

floattypes/SATS/floattype_sats.c: floattypes/SATS/floattypes.sats
floattypes/SATS/floattype_sats.c: floattypes/CATS/floattypes.cats
floattypes/SATS/floattype_sats.c: floattypes/CATS/constants.cats

floattypes/DATS/floattype_dats.c: floattypes/DATS/floattypes.dats
floattypes/DATS/floattype_dats.c: floattypes/SATS/floattypes.sats
floattypes/DATS/floattype_dats.c: floattypes/CATS/floattypes.cats
floattypes/DATS/floattype_dats.c: floattypes/CATS/constants.cats

######################################################################

AM_DEFAULT_SOURCE_EXT = _dats.c

TESTS += $(check_PROGRAMS)

check_PROGRAMS =

check_PROGRAMS += tests/test-M_E
check_PROGRAMS += tests/test-M_LOG2E
check_PROGRAMS += tests/test-M_LOG10E
check_PROGRAMS += tests/test-M_SQRT2
check_PROGRAMS += tests/test-M_SQRT1_2
check_PROGRAMS += tests/test-M_SQRT3
check_PROGRAMS += tests/test-M_PI
check_PROGRAMS += tests/test-M_PI_2
check_PROGRAMS += tests/test-M_PI_4
check_PROGRAMS += tests/test-M_SQRTPI
check_PROGRAMS += tests/test-M_2_SQRTPI
check_PROGRAMS += tests/test-M_1_PI
check_PROGRAMS += tests/test-M_2_PI
check_PROGRAMS += tests/test-M_LN10
check_PROGRAMS += tests/test-M_LN2
check_PROGRAMS += tests/test-M_LNPI
check_PROGRAMS += tests/test-M_EULER

check_PROGRAMS += tests/test-int-to-float
check_PROGRAMS += tests/test-uint-to-float

check_PROGRAMS += tests/test-binary-arith
check_PROGRAMS += tests/test-neg
check_PROGRAMS += tests/test-fdim
check_PROGRAMS += tests/test-fma
check_PROGRAMS += tests/test-fmod
check_PROGRAMS += tests/test-mod
check_PROGRAMS += tests/test-remainder
check_PROGRAMS += tests/test-remquo
check_PROGRAMS += tests/test-ldexp
check_PROGRAMS += tests/test-scalbn
check_PROGRAMS += tests/test-scalbln

check_PROGRAMS += tests/test-succ
check_PROGRAMS += tests/test-pred

check_PROGRAMS += tests/test-abs
check_PROGRAMS += tests/test-fabs
check_PROGRAMS += tests/test-copysign

check_PROGRAMS += tests/test-comparison-ops
check_PROGRAMS += tests/test-compare

check_PROGRAMS += tests/test-ceil
check_PROGRAMS += tests/test-floor
check_PROGRAMS += tests/test-trunc
check_PROGRAMS += tests/test-nearbyint
check_PROGRAMS += tests/test-rint
check_PROGRAMS += tests/test-lrint
check_PROGRAMS += tests/test-llrint
check_PROGRAMS += tests/test-round
check_PROGRAMS += tests/test-lround
check_PROGRAMS += tests/test-llround

check_PROGRAMS += tests/test-nextafter
check_PROGRAMS += tests/test-nexttoward

check_PROGRAMS += tests/test-min
check_PROGRAMS += tests/test-max
check_PROGRAMS += tests/test-fmin
check_PROGRAMS += tests/test-fmax

check_PROGRAMS += tests/test-sqrt
check_PROGRAMS += tests/test-cbrt
check_PROGRAMS += tests/test-hypot
check_PROGRAMS += tests/test-pow
check_PROGRAMS += tests/test-exponentials
check_PROGRAMS += tests/test-logarithms

check_PROGRAMS += tests/test-sin
check_PROGRAMS += tests/test-cos
check_PROGRAMS += tests/test-tan
check_PROGRAMS += tests/test-asin
check_PROGRAMS += tests/test-acos
check_PROGRAMS += tests/test-atan
check_PROGRAMS += tests/test-atan2

check_PROGRAMS += tests/test-sinh
check_PROGRAMS += tests/test-cosh
check_PROGRAMS += tests/test-tanh
check_PROGRAMS += tests/test-asinh
check_PROGRAMS += tests/test-acosh
check_PROGRAMS += tests/test-atanh

check_PROGRAMS += tests/test-erf
check_PROGRAMS += tests/test-erfc

check_PROGRAMS += tests/test-lgamma
check_PROGRAMS += tests/test-lgamma_r
check_PROGRAMS += tests/test-tgamma

check_PROGRAMS += tests/test-j0
check_PROGRAMS += tests/test-j1
check_PROGRAMS += tests/test-jn
check_PROGRAMS += tests/test-y0
check_PROGRAMS += tests/test-y1
check_PROGRAMS += tests/test-yn

check_PROGRAMS += tests/test-modf
check_PROGRAMS += tests/test-frexp
check_PROGRAMS += tests/test-logb
check_PROGRAMS += tests/test-ilogb

check_PROGRAMS += tests/test-nan
check_PROGRAMS += tests/test-__builtin_nans
check_PROGRAMS += tests/test-__builtin_huge_val
check_PROGRAMS += tests/test-__builtin_inf

check_PROGRAMS += tests/test-strtod
check_PROGRAMS += tests/test-strfromd_unsafe

EXTRA_DIST += $(check_PROGRAMS:%=%.dats.m4)

BUILT_SOURCES += $(check_PROGRAMS:%=%.dats)
BUILT_SOURCES += $(check_PROGRAMS:%=%_dats.c)

$(check_PROGRAMS): floattypes/HATS/floattypes.hats \
					$(lib_LTLIBRARIES)

clean-local:
	-rm -f tests/*{.dats,_dats.{c,$(OBJEXT)}}

######################################################################

AM_CPPFLAGS =
# It is assumed here that you have PATSHOME set in your environment.
AM_CPPFLAGS += -I$(builddir)
AM_CPPFLAGS += -I$(srcdir)
AM_CPPFLAGS += -I$(PATSHOME)
AM_CPPFLAGS += -I$(PATSHOME)/ccomp/runtime/

AM_CFLAGS =
AM_CFLAGS += -g -O2

AM_M4FLAGS =

AM_PATSOPTFLAGS =
AM_PATSOPTFLAGS += -IATS $(builddir)
AM_PATSOPTFLAGS += -IATS $(srcdir)

######################################################################

TOTAL_M4FLAGS =
TOTAL_M4FLAGS += $(AM_M4FLAGS)
TOTAL_M4FLAGS += $(M4FLAGS)
TOTAL_M4FLAGS += $(XM4FLAGS)

M4_DEPS =
M4_DEPS += common-definitions.m4
M4_DEPS += common-macros.m4

%: %.m4 $(M4_DEPS)
	@$(MKDIR_P) $(@D)
	$(call v,M4)$(M4) $(TOTAL_M4FLAGS) $(<) > $(@)

TOTAL_PATSOPTFLAGS =
TOTAL_PATSOPTFLAGS += $(AM_PATSOPTFLAGS)
TOTAL_PATSOPTFLAGS += $(PATSOPTFLAGS)
TOTAL_PATSOPTFLAGS += $(XPATSOPTFLAGS)

PATSOPT_DEPS =
PATSOPT_DEPS += floattypes/CATS/floattypes.cats
PATSOPT_DEPS += floattypes/CATS/constants.cats
PATSOPT_DEPS += floattypes/HATS/config.hats

%_sats.c: %.sats $(PATSOPT_DEPS)
	@$(MKDIR_P) $(@D)
	$(call v,PATSOPT)$(PATSOPT) -o $(@) $(TOTAL_PATSOPTFLAGS) -s $(<)

%_dats.c: %.dats $(PATSOPT_DEPS)
	@$(MKDIR_P) $(@D)
	$(call v,PATSOPT)$(PATSOPT) -o $(@) $(TOTAL_PATSOPTFLAGS) -d $(<)

######################################################################
