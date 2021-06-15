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

    dnl
    dnl  This is broken into two m4_foreachq loops, so as
    dnl  not to exceed the limits of some m4 implementations.
    dnl

    m4_foreachq([t],[all_floattypes],
      [#if HAVE_floattypes_signbit_[]t #then
        macdef f2f = $UN.cast{t}

        val _ = assertloc(not(isgreater(f2f(~1.0), f2f(1.0))))
        val _ = assertloc(not(isgreater(f2f(1.0), f2f(1.0))))
        val _ = assertloc(isgreater(f2f(1.0), f2f(~1.0)))

        val _ = assertloc(not(isgreaterequal(f2f(~1.0), f2f(1.0))))
        val _ = assertloc(isgreaterequal(f2f(1.0), f2f(1.0)))
        val _ = assertloc(isgreaterequal(f2f(1.0), f2f(~1.0)))

        val _ = assertloc(isless(f2f(~1.0), f2f(1.0)))
        val _ = assertloc(not(isless(f2f(1.0), f2f(1.0))))
        val _ = assertloc(not(isless(f2f(1.0), f2f(~1.0))))
      #endif
      ])

    m4_foreachq([t],[all_floattypes],
      [#if HAVE_floattypes_signbit_[]t #then
        macdef f2f = $UN.cast{t}

        val _ = assertloc(islessequal(f2f(~1.0), f2f(1.0)))
        val _ = assertloc(islessequal(f2f(1.0), f2f(1.0)))
        val _ = assertloc(not(islessequal(f2f(1.0), f2f(~1.0))))

        val _ = assertloc(islessgreater(f2f(~1.0), f2f(1.0)))
        val _ = assertloc(not(islessgreater(f2f(1.0), f2f(1.0))))
        val _ = assertloc(islessgreater(f2f(1.0), f2f(~1.0)))

        val _ = assertloc(not(isunordered(f2f(~1.0), f2f(1.0))))
        val _ = assertloc(not(isunordered(f2f(1.0), f2f(1.0))))
        val _ = assertloc(not(isunordered(f2f(1.0), f2f(~1.0))))
        val _ = assertloc(isunordered(nan(""):t, f2f(1.0)))
        val _ = assertloc(isunordered(f2f(~1.0), nan(""):t))
        val _ = assertloc(isunordered(nan(""):t, nan(""):t))
      #endif
      ])
  in
    0
  end
