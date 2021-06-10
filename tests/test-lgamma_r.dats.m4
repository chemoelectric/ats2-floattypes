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

implement
main() =
  let
    foreachq([t],[all_floattypes],
      [[#if] HAVE_floattypes_lgamma_r_[]t [#then]
        macdef f2f = $UN.cast{t}
        var sign : int
        val _ = sign := 99
        val _ = assertloc(abs(lgamma_r(f2f(0.5), sign) - f2f(0.5723649429247)) < f2f(0.00001))
        val _ = assertloc(sign = 1)
        val _ = sign := 99
        val _ = assertloc(abs(lgamma_r(f2f(1.0), sign) - f2f(0.0)) < f2f(0.00001))
        val _ = assertloc(sign = 1)
        val _ = sign := 99
        val _ = assertloc(abs(lgamma_r(f2f(5.0), sign) - f2f(3.17805383034795)) < f2f(0.00001))
        val _ = assertloc(sign = 1)
      [#endif]
      ])
  in
    0
  end
