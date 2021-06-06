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

`%{#
#include "floattypes/CATS/floattypes.cats"
%}'

`#define' ATS_PACKNAME "ATS2_FLOATTYPES.floattypes"
`#define' ATS_EXTERN_PREFIX "floattypes__"

staload "prelude/basics_sta.sats"
staload "prelude/SATS/float.sats"
staload "floattypes/SATS/floattypes.sats"

divert(-1)

include(`floattypes/common-macros.m4')

divert`'
