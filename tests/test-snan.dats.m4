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
      [#if HAVE_floattypes_SNAN_[]t #then
       macdef f2f = $UN.cast{t}
       val sn1 : t = snan()
       val _ = assertloc($extfcall(bool, "isnan", sn1))
       val _ = assertloc($extfcall(bool, "isnan", SNAN_[]t))
       val _ = assertloc($extfcall(bool, "isnan",
                                   m4_if(t,[float],[SNANF],
                                         t,[double],[SNAN],
                                         t,[ldouble],[SNANL],
                                         t,[float32],[SNANF32],
                                         t,[float64],[SNANF64],
                                         t,[float128],[SNANF128],
                                         t,[decimal32],[SNAND32],
                                         t,[decimal64],[SNAND64],
                                         t,[decimal128],[SNAND128],
                                         t,[float32x],[SNANF32X],
                                         t,[float64x],[SNANF64X],
                                         t,[float128x],[SNANF128X],
                                         t,[decimal64x],[SNAND64X],
                                         t,[decimal128x],[SNAND128X])))
        #endif
      ])
  in
    0
  end
