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

DISTCLEANFILES += Makefile

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

pkgconfigdir = ${libdir}/pkgconfig
nodist_pkgconfig_DATA = ats2-floattypes.pc

EXTRA_DIST += floattypes/CATS/floattypes.cats.m4
EXTRA_DIST += floattypes/SATS/floattypes.sats.m4
EXTRA_DIST += floattypes/DATS/floattypes.dats.m4

BUILT_SOURCES += floattypes/CATS/floattypes.cats
BUILT_SOURCES += floattypes/SATS/floattypes.sats
BUILT_SOURCES += floattypes/SATS/floattypes_sats.c
BUILT_SOURCES += floattypes/DATS/floattypes.dats
BUILT_SOURCES += floattypes/DATS/floattypes_dats.c

CLEANFILES += $(BUILT_SOURCES)

floattypes/SATS/floattype_sats.c: floattypes/SATS/floattypes.sats
floattypes/SATS/floattype_sats.c: floattypes/CATS/floattypes.cats

floattypes/DATS/floattype_dats.c: floattypes/DATS/floattypes.dats
floattypes/DATS/floattype_dats.c: floattypes/SATS/floattypes.sats
floattypes/DATS/floattype_dats.c: floattypes/CATS/floattypes.cats

######################################################################

AM_DEFAULT_SOURCE_EXT = _dats.c

TESTS += $(check_PROGRAMS)

check_PROGRAMS =
check_PROGRAMS += tests/test-neg
check_PROGRAMS += tests/test-abs
check_PROGRAMS += tests/test-succ
check_PROGRAMS += tests/test-pred

EXTRA_DIST += $(check_PROGRAMS:%=%.dats.m4)

BUILT_SOURCES += $(check_PROGRAMS:%=%.dats)
BUILT_SOURCES += $(check_PROGRAMS:%=%_dats.c)

$(check_PROGRAMS): floattypes/HATS/floattypes.hats

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
PATSOPT_DEPS += floattypes/HATS/config.hats

%_sats.c: %.sats $(PATSOPT_DEPS)
	@$(MKDIR_P) $(@D)
	$(call v,PATSOPT)$(PATSOPT) -o $(@) $(TOTAL_PATSOPTFLAGS) -s $(<)

%_dats.c: %.dats $(PATSOPT_DEPS)
	@$(MKDIR_P) $(@D)
	$(call v,PATSOPT)$(PATSOPT) -o $(@) $(TOTAL_PATSOPTFLAGS) -d $(<)

######################################################################
