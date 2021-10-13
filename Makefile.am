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
LDADD =

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
nobase_nodist_pkginclude_HEADERS += floattypes/CATS/printing.cats
nobase_nodist_pkginclude_HEADERS += floattypes/CATS/defines.cats
nobase_nodist_pkginclude_HEADERS += floattypes/CATS/floattypes.cats
nobase_nodist_pkginclude_HEADERS += floattypes/SATS/floattypes.sats
nobase_nodist_pkginclude_HEADERS += floattypes/DATS/floattypes.dats

nobase_dist_pkginclude_HEADERS =
nobase_dist_pkginclude_HEADERS += floattypes/HATS/floattypes.hats

pkghostincludedir = $(pkgincludedir)/$(host_triplet)
nobase_nodist_pkghostinclude_HEADERS =
nobase_nodist_pkghostinclude_HEADERS += floattypes/HATS/config.hats
nobase_nodist_pkghostinclude_HEADERS += floattypes/CATS/constants.cats

nodist_pkgconfig_DATA = ats2-floattypes.pc

EXTRA_DIST += floattypes/CATS/printing.cats.m4
EXTRA_DIST += floattypes/CATS/defines.cats.m4
EXTRA_DIST += floattypes/CATS/floattypes.cats.m4
EXTRA_DIST += floattypes/CATS/constants.cats.m4
EXTRA_DIST += floattypes/SATS/floattypes.sats.m4
EXTRA_DIST += floattypes/DATS/floattypes.dats.m4

BUILT_SOURCES += floattypes/CATS/printing.cats
BUILT_SOURCES += floattypes/CATS/defines.cats
BUILT_SOURCES += floattypes/CATS/floattypes.cats
BUILT_SOURCES += floattypes/CATS/constants.cats
BUILT_SOURCES += floattypes/SATS/floattypes.sats
BUILT_SOURCES += floattypes/SATS/floattypes_sats.c
BUILT_SOURCES += floattypes/DATS/floattypes.dats
BUILT_SOURCES += floattypes/DATS/floattypes_dats.c

CLEANFILES += $(BUILT_SOURCES)

floattypes/SATS/floattype_sats.c: floattypes/SATS/floattypes.sats
floattypes/SATS/floattype_sats.c: floattypes/CATS/floattypes.cats
floattypes/SATS/floattype_sats.c: floattypes/CATS/defines.cats
floattypes/SATS/floattype_sats.c: floattypes/CATS/constants.cats

floattypes/DATS/floattype_dats.c: floattypes/DATS/floattypes.dats
floattypes/DATS/floattype_dats.c: floattypes/SATS/floattypes.sats
floattypes/DATS/floattype_dats.c: floattypes/CATS/floattypes.cats
floattypes/DATS/floattype_dats.c: floattypes/CATS/defines.cats
floattypes/DATS/floattype_dats.c: floattypes/CATS/constants.cats
floattypes/DATS/floattype_dats.c: floattypes/CATS/printing.cats

######################################################################

AM_DEFAULT_SOURCE_EXT = _dats.c

TESTS += $(check_PROGRAMS)

LDADD += $(lib_LTLIBRARIES)

UNIT_TESTS =
check_PROGRAMS =

UNIT_TESTS += tests/test-M_E
UNIT_TESTS += tests/test-M_LOG2E
UNIT_TESTS += tests/test-M_LOG10E
UNIT_TESTS += tests/test-M_SQRT2
UNIT_TESTS += tests/test-M_SQRT1_2
UNIT_TESTS += tests/test-M_SQRT3
UNIT_TESTS += tests/test-M_PI
UNIT_TESTS += tests/test-M_PI_2
UNIT_TESTS += tests/test-M_PI_4
UNIT_TESTS += tests/test-M_SQRTPI
UNIT_TESTS += tests/test-M_2_SQRTPI
UNIT_TESTS += tests/test-M_1_PI
UNIT_TESTS += tests/test-M_2_PI
UNIT_TESTS += tests/test-M_LN10
UNIT_TESTS += tests/test-M_LN2
UNIT_TESTS += tests/test-M_LNPI
UNIT_TESTS += tests/test-M_EULER

UNIT_TESTS += tests/test-int-to-float
UNIT_TESTS += tests/test-uint-to-float
UNIT_TESTS += tests/test-float-to-int
UNIT_TESTS += tests/test-float-to-uint
UNIT_TESTS += tests/test-float-to-float

UNIT_TESTS += tests/test-binary-arith
UNIT_TESTS += tests/test-neg
UNIT_TESTS += tests/test-fdim
UNIT_TESTS += tests/test-fma
UNIT_TESTS += tests/test-__builtin_fma
UNIT_TESTS += tests/test-fmod
UNIT_TESTS += tests/test-mod
UNIT_TESTS += tests/test-remainder
UNIT_TESTS += tests/test-remquo
UNIT_TESTS += tests/test-ldexp
UNIT_TESTS += tests/test-scalbn
UNIT_TESTS += tests/test-scalbln

UNIT_TESTS += tests/test-succ
UNIT_TESTS += tests/test-pred

UNIT_TESTS += tests/test-abs
UNIT_TESTS += tests/test-fabs
UNIT_TESTS += tests/test-copysign

UNIT_TESTS += tests/test-comparison-ops
UNIT_TESTS += tests/test-compare

UNIT_TESTS += tests/test-ceil
UNIT_TESTS += tests/test-floor
UNIT_TESTS += tests/test-trunc
UNIT_TESTS += tests/test-nearbyint
UNIT_TESTS += tests/test-rint
UNIT_TESTS += tests/test-lrint
UNIT_TESTS += tests/test-llrint
UNIT_TESTS += tests/test-round
UNIT_TESTS += tests/test-lround
UNIT_TESTS += tests/test-llround

UNIT_TESTS += tests/test-nextafter
UNIT_TESTS += tests/test-nexttoward

UNIT_TESTS += tests/test-min
UNIT_TESTS += tests/test-max
UNIT_TESTS += tests/test-fmin
UNIT_TESTS += tests/test-fmax

UNIT_TESTS += tests/test-sqrt
UNIT_TESTS += tests/test-cbrt
UNIT_TESTS += tests/test-hypot
UNIT_TESTS += tests/test-pow
UNIT_TESTS += tests/test-exponentials
UNIT_TESTS += tests/test-logarithms

UNIT_TESTS += tests/test-sin
UNIT_TESTS += tests/test-cos
UNIT_TESTS += tests/test-tan
UNIT_TESTS += tests/test-asin
UNIT_TESTS += tests/test-acos
UNIT_TESTS += tests/test-atan
UNIT_TESTS += tests/test-atan2

UNIT_TESTS += tests/test-sinh
UNIT_TESTS += tests/test-cosh
UNIT_TESTS += tests/test-tanh
UNIT_TESTS += tests/test-asinh
UNIT_TESTS += tests/test-acosh
UNIT_TESTS += tests/test-atanh

UNIT_TESTS += tests/test-erf
UNIT_TESTS += tests/test-erfc

UNIT_TESTS += tests/test-lgamma
UNIT_TESTS += tests/test-lgamma_r
UNIT_TESTS += tests/test-tgamma

UNIT_TESTS += tests/test-j0
UNIT_TESTS += tests/test-j1
UNIT_TESTS += tests/test-jn
UNIT_TESTS += tests/test-y0
UNIT_TESTS += tests/test-y1
UNIT_TESTS += tests/test-yn

UNIT_TESTS += tests/test-modf
UNIT_TESTS += tests/test-frexp
UNIT_TESTS += tests/test-logb
UNIT_TESTS += tests/test-ilogb

UNIT_TESTS += tests/test-nan
UNIT_TESTS += tests/test-snan
UNIT_TESTS += tests/test-huge_val
UNIT_TESTS += tests/test-__builtin_nans
UNIT_TESTS += tests/test-__builtin_huge_val
UNIT_TESTS += tests/test-__builtin_inf

UNIT_TESTS += tests/test-fpclassify
UNIT_TESTS += tests/test-isfinite
UNIT_TESTS += tests/test-isinf
UNIT_TESTS += tests/test-isnan
UNIT_TESTS += tests/test-isnormal
UNIT_TESTS += tests/test-signbit
UNIT_TESTS += tests/test-isgreaterlike

UNIT_TESTS += tests/test-strtod
UNIT_TESTS += tests/test-strfromd_unsafe

check_PROGRAMS += $(UNIT_TESTS)

FLOAT128_EXAMPLE_PROGS =
FLOAT128_EXAMPLE_PROGS += tests/tred2-example1
FLOAT128_EXAMPLE_PROGS += tests/tred2-example2
FLOAT128_EXAMPLE_PROGS += tests/tred2-example3
FLOAT128_EXAMPLE_PROGS += tests/tred2-example4
FLOAT128_EXAMPLE_PROGS += tests/tql2-example1
FLOAT128_EXAMPLE_PROGS += tests/tql2-example2
FLOAT128_EXAMPLE_PROGS += tests/tql2-example3
FLOAT128_EXAMPLE_PROGS += tests/tql2-example4

DECIMAL64_EXAMPLE_PROGS =
DECIMAL64_EXAMPLE_PROGS += tests/decimal-example1

if HAVE_FLOAT128

check_PROGRAMS += $(FLOAT128_EXAMPLE_PROGS:tests/%=examples/%)

nodist_tests_tred2_example1_SOURCES =
nodist_tests_tred2_example1_SOURCES += tests/tred2-example1_dats.c
nodist_tests_tred2_example1_SOURCES += tests/tred2_dats.c
nodist_tests_tred2_example1_SOURCES += tests/tred2_sats.c
nodist_tests_tred2_example1_SOURCES += tests/arr2_dats.c
nodist_tests_tred2_example1_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tred2_example1_SOURCES)

nodist_tests_tred2_example2_SOURCES =
nodist_tests_tred2_example2_SOURCES += tests/tred2-example2_dats.c
nodist_tests_tred2_example2_SOURCES += tests/tred2_dats.c
nodist_tests_tred2_example2_SOURCES += tests/tred2_sats.c
nodist_tests_tred2_example2_SOURCES += tests/arr2_dats.c
nodist_tests_tred2_example2_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tred2_example2_SOURCES)

nodist_tests_tred2_example3_SOURCES =
nodist_tests_tred2_example3_SOURCES += tests/tred2-example3_dats.c
nodist_tests_tred2_example3_SOURCES += tests/tred2_dats.c
nodist_tests_tred2_example3_SOURCES += tests/tred2_sats.c
nodist_tests_tred2_example3_SOURCES += tests/arr2_dats.c
nodist_tests_tred2_example3_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tred2_example3_SOURCES)

nodist_tests_tred2_example4_SOURCES =
nodist_tests_tred2_example4_SOURCES += tests/tred2-example4_dats.c
nodist_tests_tred2_example4_SOURCES += tests/tred2_dats.c
nodist_tests_tred2_example4_SOURCES += tests/tred2_sats.c
nodist_tests_tred2_example4_SOURCES += tests/arr2_dats.c
nodist_tests_tred2_example4_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tred2_example4_SOURCES)

nodist_tests_tql2_example1_SOURCES =
nodist_tests_tql2_example1_SOURCES += tests/tql2-example1_dats.c
nodist_tests_tql2_example1_SOURCES += tests/tql2_dats.c
nodist_tests_tql2_example1_SOURCES += tests/tql2_sats.c
nodist_tests_tql2_example1_SOURCES += tests/tred2_dats.c
nodist_tests_tql2_example1_SOURCES += tests/tred2_sats.c
nodist_tests_tql2_example1_SOURCES += tests/arr2_dats.c
nodist_tests_tql2_example1_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tql2_example1_SOURCES)

nodist_tests_tql2_example2_SOURCES =
nodist_tests_tql2_example2_SOURCES += tests/tql2-example2_dats.c
nodist_tests_tql2_example2_SOURCES += tests/tql2_dats.c
nodist_tests_tql2_example2_SOURCES += tests/tql2_sats.c
nodist_tests_tql2_example2_SOURCES += tests/tred2_dats.c
nodist_tests_tql2_example2_SOURCES += tests/tred2_sats.c
nodist_tests_tql2_example2_SOURCES += tests/arr2_dats.c
nodist_tests_tql2_example2_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tql2_example2_SOURCES)

nodist_tests_tql2_example3_SOURCES =
nodist_tests_tql2_example3_SOURCES += tests/tql2-example3_dats.c
nodist_tests_tql2_example3_SOURCES += tests/tql2_dats.c
nodist_tests_tql2_example3_SOURCES += tests/tql2_sats.c
nodist_tests_tql2_example3_SOURCES += tests/tred2_dats.c
nodist_tests_tql2_example3_SOURCES += tests/tred2_sats.c
nodist_tests_tql2_example3_SOURCES += tests/arr2_dats.c
nodist_tests_tql2_example3_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tql2_example3_SOURCES)

nodist_tests_tql2_example4_SOURCES =
nodist_tests_tql2_example4_SOURCES += tests/tql2-example4_dats.c
nodist_tests_tql2_example4_SOURCES += tests/tql2_dats.c
nodist_tests_tql2_example4_SOURCES += tests/tql2_sats.c
nodist_tests_tql2_example4_SOURCES += tests/tred2_dats.c
nodist_tests_tql2_example4_SOURCES += tests/tred2_sats.c
nodist_tests_tql2_example4_SOURCES += tests/arr2_dats.c
nodist_tests_tql2_example4_SOURCES += tests/arr2_sats.c
BUILT_SOURCES += $(nodist_tests_tql2_example4_SOURCES)

endif HAVE_FLOAT128

if HAVE_DECIMAL64

check_PROGRAMS += $(DECIMAL64_EXAMPLE_PROGS:tests/%=examples/%)

nodist_tests_decimal_example1_SOURCES =
nodist_tests_decimal_example1_SOURCES += tests/decimal-example1_dats.c
BUILT_SOURCES += $(nodist_tests_decimal_example1_SOURCES)

endif HAVE_DECIMAL64

EXTRA_DIST += $(UNIT_TESTS:%=%.dats.m4)

BUILT_SOURCES += $(UNIT_TESTS:%=%.dats)
BUILT_SOURCES += $(check_PROGRAMS:%=%_dats.c)

$(check_PROGRAMS): floattypes/HATS/floattypes.hats \
					$(lib_LTLIBRARIES)

clean-local:
	-rm -f tests/*{.dats,_dats.{c,$(OBJEXT)}}

######################################################################

nobase_nodist_doc_DATA =
nobase_nodist_doc_DATA += $(EXAMPLES_SRC)

EXAMPLES_SRC =
EXAMPLES_SRC += examples/README
EXAMPLES_SRC += examples/GNUmakefile
EXAMPLES_SRC += $(FLOAT128_EXAMPLE_PROGS:tests/%=examples/%.dats)
EXAMPLES_SRC += $(DECIMAL64_EXAMPLE_PROGS:tests/%=examples/%.dats)
EXAMPLES_SRC += examples/tql2.sats
EXAMPLES_SRC += examples/tql2.dats
EXAMPLES_SRC += examples/tred2.sats
EXAMPLES_SRC += examples/tred2.dats
EXAMPLES_SRC += examples/arr2.sats
EXAMPLES_SRC += examples/arr2.dats

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
AM_PATSOPTFLAGS += -IATS $(builddir)/tests
AM_PATSOPTFLAGS += -IATS $(srcdir)/tests

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
