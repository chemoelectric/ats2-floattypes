`(*

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

*)'

divert(-1)
include(`common-macros.m4')
divert

`#include "share/atspre_define.hats"'
`#include "share/atspre_staload.hats"'

staload UN = "prelude/SATS/unsafe.sats"

staload "floattypes/SATS/floattypes.sats"
staload _ = "floattypes/DATS/floattypes.dats"

`#include "floattypes/HATS/config.hats"'

implement
main() =
  let
    foreach(`t',(all_floattypes),
      ``#ifdef' HAVE_floattypes_`'t `#then'
        val _ = assertloc(neg ($UN.cast{t}(~1.0)) = $UN.cast{t}(1.0))
        val _ = assertloc(neg ($UN.cast{t}(~0.0)) = $UN.cast{t}(0.0))
        val _ = assertloc(neg ($UN.cast{t}(1234.567)) = $UN.cast{t}(~1234.567))
      `#endif'
    ')
  in
    0
  end

