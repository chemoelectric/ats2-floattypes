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
      [
       #if HAVE_floattypes_exp_[]t
         macdef f2f = $UN.cast{t}
         val _ = assertloc(abs(exp(f2f(0.5)) - f2f(1.64872127070013)) < f2f(0.00001))
       #endif
       #if HAVE_floattypes_exp2_[]t
         macdef f2f = $UN.cast{t}
         val _ = assertloc(abs(exp2(f2f(0.5)) - f2f(1.4142135623731)) < f2f(0.00001))
       #endif
       #if HAVE_floattypes_exp10_[]t
         macdef f2f = $UN.cast{t}
         val _ = assertloc(abs(exp10(f2f(0.5)) - f2f(3.16227766016838)) < f2f(0.00001))
       #endif
       #if HAVE_floattypes_expm1_[]t
         macdef f2f = $UN.cast{t}
         val _ = assertloc(abs(expm1(f2f(0.5)) - f2f(0.648721270700)) < f2f(0.00001))
       #endif
      ])
  in
    0
  end
