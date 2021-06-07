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
`#define' ATS_EXTERN_PREFIX "floattypes_"

`#define ATS_DYNLOADFLAG 0'

staload "prelude/basics_sta.sats"
staload "prelude/SATS/float.sats"
staload "floattypes/SATS/floattypes.sats"

divert(-1)

include(`common-macros.m4')

define(`implement_float',`implement g0float_$1<$2`'_kind> = g0float_$1_$2
')

divert`'

foreach(`t',(extra_floattypes),`implement_float(`neg',t)')
foreach(`t',(extra_floattypes),`implement_float(`abs',t)')
foreach(`t',(extra_floattypes),`implement_float(`succ',t)')
foreach(`t',(extra_floattypes),`implement_float(`pred',t)')
dnl
foreach(`t',(extra_floattypes),`implement_float(`add',t)')
foreach(`t',(extra_floattypes),`implement_float(`sub',t)')
foreach(`t',(extra_floattypes),`implement_float(`mul',t)')
foreach(`t',(extra_floattypes),`implement_float(`div',t)')
foreach(`t',(extra_floattypes),`implement_float(`mod',t)')
dnl
foreach(`t',(extra_floattypes),`implement_float(`lt',t)')
foreach(`t',(extra_floattypes),`implement_float(`lte',t)')
foreach(`t',(extra_floattypes),`implement_float(`gt',t)')
foreach(`t',(extra_floattypes),`implement_float(`gte',t)')
foreach(`t',(extra_floattypes),`implement_float(`eq',t)')
foreach(`t',(extra_floattypes),`implement_float(`neq',t)')
dnl
foreach(`t',(extra_floattypes),`implement_float(`compare',t)')
dnl
foreach(`t',(extra_floattypes),`implement_float(`max',t)')
foreach(`t',(extra_floattypes),`implement_float(`min',t)')
