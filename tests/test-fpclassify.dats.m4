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
      [#if HAVE_floattypes_fpclassify_[]t #then
        macdef f2f = $UN.cast{t}
        val _ = assertloc(fpclassify(f2f(0.0)) = FP_ZERO)
        val _ = assertloc(fpclassify(f2f(1.0)) = FP_NORMAL)
        val _ = assertloc(fpclassify(f2f(1.0) / f2f(0.0)) = FP_INFINITE)
        val _ = assertloc(fpclassify(nan(""):t) = FP_NAN)
        /* FIXME: Add a test for FP_SUBNORMAL */
      #endif
      ])
  in
    0
  end
