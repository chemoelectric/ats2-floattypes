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

`#include' "floattypes/HATS/config.hats"
staload "prelude/basics_sta.sats"
staload "prelude/SATS/float.sats"
dnl
divert(-1)

include(`floattypes/common-macros.m4')

define(`declare_kind',dnl
`dnl
tkindef $1_kind = "floattypes_$1"
typedef $1 = g0float($1_kind)
')

define(`declare_uop',`fun g0float_$1_`'$2 : g0float_uop_type($2`'_kind) = "mac#%"
')

define(`declare_aop',`fun g0float_$1_`'$2 : g0float_aop_type($2`'_kind) = "mac#%"
')

define(`declare_cmp',`fun g0float_$1_`'$2 : g0float_cmp_type($2`'_kind) = "mac#%"
')

define(`declare_compare',`fun g0float_$1_`'$2 : g0float_compare_type($2`'_kind) = "mac#%"
')

divert`'dnl

foreach(`t',(extra_floattypes),`declare_kind(t)')

foreach(`t',(extra_floattypes),`declare_uop(`neg',`t')')
foreach(`t',(extra_floattypes),`declare_uop(`abs',`t')')
foreach(`t',(extra_floattypes),`declare_uop(`succ',`t')')
foreach(`t',(extra_floattypes),`declare_uop(`pred',`t')')
dnl
foreach(`t',(extra_floattypes),`declare_aop(`add',`t')')
foreach(`t',(extra_floattypes),`declare_aop(`sub',`t')')
foreach(`t',(extra_floattypes),`declare_aop(`mul',`t')')
foreach(`t',(extra_floattypes),`declare_aop(`div',`t')')
foreach(`t',(extra_floattypes),`declare_aop(`mod',`t')')
dnl
foreach(`t',(extra_floattypes),`declare_cmp(`lt',`t')')
foreach(`t',(extra_floattypes),`declare_cmp(`lte',`t')')
foreach(`t',(extra_floattypes),`declare_cmp(`gt',`t')')
foreach(`t',(extra_floattypes),`declare_cmp(`gte',`t')')
foreach(`t',(extra_floattypes),`declare_cmp(`eq',`t')')
foreach(`t',(extra_floattypes),`declare_cmp(`neq',`t')')
dnl
foreach(`t',(extra_floattypes),`declare_compare(`compare',`t')')
dnl
foreach(`t',(extra_floattypes),`declare_aop(`max',`t')')
foreach(`t',(extra_floattypes),`declare_aop(`min',`t')')
