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


#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "floattypes/HATS/floattypes.hats"

staload UN = "prelude/SATS/unsafe.sats"

implement
main() =
  let
    m4_foreachq([t],[all_floattypes],
      [#if HAVE_floattypes_[]t
         macdef c = $UN.cast
         macdef f2f = $UN.cast{t}
         val _ = assertloc(g0uint2float(123U) = f2f(123.0))
         val _ = assertloc(g0uint2float(123UL) = f2f(123.0))
         val _ = assertloc(g0uint2float(123ULL) = f2f(123.0))
         val _ = assertloc(g0uint2float(i2sz 123) = f2f(123.0))
         val _ = assertloc(g0uint2float(c{usint}123) = f2f(123.0))
         val _ = assertloc(g0uint2float(c{uint8}123) = f2f(123.0))
         val _ = assertloc(g0uint2float(c{uint16}123) = f2f(123.0))
         val _ = assertloc(g0uint2float(c{uint32}123) = f2f(123.0))
         val _ = assertloc(g0uint2float(c{uint64}123) = f2f(123.0))
       #endif
      ])
  in
    0
  end
