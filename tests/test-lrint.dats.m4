changequote([,])dnl
[(*

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

*)]

divert(-1)
include([common-macros.m4])
divert

[#include "share/atspre_define.hats"]
[#include "share/atspre_staload.hats"]
[#include "floattypes/HATS/floattypes.hats"]

staload UN = "prelude/SATS/unsafe.sats"

val FE_TONEAREST = $extval(int, "FE_TONEAREST")
val FE_UPWARD = $extval(int, "FE_UPWARD")
val FE_DOWNWARD = $extval(int, "FE_DOWNWARD")
val FE_TOWARDZERO = $extval(int, "FE_TOWARDZERO")

implement
main() =
  let
    foreachq([t],[all_floattypes],      
      [[#if] HAVE_floattypes_lrint_[]t [#then]
       macdef f2f = $UN.cast{t}
       val _ = $extfcall(int, "fesetround", FE_TONEAREST)
       val _ = assertloc(lrint(f2f(~4.8)) = ~5L)
       val _ = assertloc(lrint(f2f(~4.2)) = ~4L)
       val _ = assertloc(lrint(f2f(4.2)) = 4L)
       val _ = assertloc(lrint(f2f(4.8)) = 5L)
       val _ = $extfcall(int, "fesetround", FE_UPWARD)
       val _ = assertloc(lrint(f2f(~4.8)) = ~4L)
       val _ = assertloc(lrint(f2f(~4.2)) = ~4L)
       val _ = assertloc(lrint(f2f(4.2)) = 5L)
       val _ = assertloc(lrint(f2f(4.8)) = 5L)
       val _ = $extfcall(int, "fesetround", FE_DOWNWARD)
       val _ = assertloc(lrint(f2f(~4.8)) = ~5L)
       val _ = assertloc(lrint(f2f(~4.2)) = ~5L)
       val _ = assertloc(lrint(f2f(4.2)) = 4L)
       val _ = assertloc(lrint(f2f(4.8)) = 4L)
       val _ = $extfcall(int, "fesetround", FE_TOWARDZERO)
       val _ = assertloc(lrint(f2f(~4.8)) = ~4L)
       val _ = assertloc(lrint(f2f(~4.2)) = ~4L)
       val _ = assertloc(lrint(f2f(4.2)) = 4L)
       val _ = assertloc(lrint(f2f(4.8)) = 4L)
       [#endif]
      ])
  in
    0
  end
