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
      [#if HAVE_floattypes_HUGE_VAL_[]t #then
       macdef f2f = $UN.cast{t}
       val hv1 : t = huge_val()
       val _ = assertloc(f2f(1e20) < hv1)
       val _ = assertloc(f2f(1e20) < HUGE_VAL_[]t)
       val _ = assertloc(f2f(1e20) < m4_if(t,[float],[HUGE_VALF],
                                           t,[double],[HUGE_VAL],
                                           t,[ldouble],[HUGE_VALL],
                                           t,[float32],[HUGE_VAL_F32],
                                           t,[float64],[HUGE_VAL_F64],
                                           t,[float128],[HUGE_VAL_F128],
                                           t,[decimal32],[HUGE_VAL_D32],
                                           t,[decimal64],[HUGE_VAL_D64],
                                           t,[decimal128],[HUGE_VAL_D128],
                                           t,[float32x],[HUGE_VAL_F32X],
                                           t,[float64x],[HUGE_VAL_F64X],
                                           t,[float128x],[HUGE_VAL_F128X],
                                           t,[decimal64x],[HUGE_VAL_D64X],
                                           t,[decimal128x],[HUGE_VAL_D128X]))
       #endif
      ])
  in
    0
  end
