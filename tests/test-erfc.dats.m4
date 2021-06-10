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
    macdef c = $UN.cast
    foreachq([t],[all_floattypes],      
      [[#if] HAVE_floattypes_erfc_[]t [#then]
       val _ = assertloc(erfc(c{t}(0.0)) = c{t}(1.0))
       val _ = assertloc(abs(erfc(c{t}(1.0)) - c{t}(0.157299207)) < c{t}(0.00001))
       val _ = assertloc(abs(erfc(c{t}(~1.0)) - c{t}(1.842700793)) < c{t}(0.00001))
       val _ = assertloc(abs(erfc(c{t}(3.0)) - c{t}(0.00002209)) < c{t}(0.00001))
       val _ = assertloc(abs(erfc(c{t}(~3.0)) - c{t}(1.99997791)) < c{t}(0.00001))
       [#endif]
      ])
  in
    0
  end
