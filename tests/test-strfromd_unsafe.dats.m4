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
      [#if HAVE_floattypes_strfromd_[]t #then

       macdef f2f = $UN.cast{t}
       
       var buf = @[[char]][[100]]('\0')
       val graphic_char_count =
         strfromd_unsafe($UN.cast{charptr1} buf, i2sz 99, "%.1f", f2f 123.0)
       val _ = assertloc(graphic_char_count = 5)
       val _ = assertloc($extfcall(int, "strcmp", buf, "123.0") = 0)

       #endif
      ])
  in
    0
  end
