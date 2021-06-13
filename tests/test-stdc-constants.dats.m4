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

         macdef f2f = $UN.cast{t}

         val _ = assertloc(abs(M_E_[]t - f2f(2.7182818)) < f2f(0.00001))
         val _ = assertloc(abs(M_LOG2E_[]t - f2f(1.44269504)) < f2f(0.00001))
         val _ = assertloc(abs(M_LOG10E_[]t - f2f(0.43429448)) < f2f(0.00001))
         val _ = assertloc(abs(M_LN2_[]t - f2f(0.69314718)) < f2f(0.00001))
         val _ = assertloc(abs(M_LN10_[]t - f2f(2.30258509)) < f2f(0.00001))
         val _ = assertloc(abs(M_PI_[]t - f2f(3.14159265)) < f2f(0.00001))
         val _ = assertloc(abs(M_PI_2_[]t - f2f(1.5707963)) < f2f(0.00001))
         val _ = assertloc(abs(M_PI_4_[]t - f2f(0.785398163)) < f2f(0.00001))
         val _ = assertloc(abs(M_1_PI_[]t - f2f(0.318309886)) < f2f(0.00001))
         val _ = assertloc(abs(M_2_PI_[]t - f2f(0.636619772)) < f2f(0.00001))
         val _ = assertloc(abs(M_2_SQRTPI_[]t - f2f(1.128379167)) < f2f(0.00001))
         val _ = assertloc(abs(M_SQRT2_[]t - f2f(1.41421356)) < f2f(0.00001))
         val _ = assertloc(abs(M_SQRT1_2_[]t - f2f(0.70710678)) < f2f(0.00001))

       #endif
      ])
  in
    0
  end
