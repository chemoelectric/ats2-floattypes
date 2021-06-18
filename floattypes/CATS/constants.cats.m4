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

divert(-1)
m4_define([math_constant],
[m4_if(defn([m4_]$3[_suffix]),[(type not supported)],[],
[#define floattypes_$1_[]$3 $2[]defn([m4_]$3[_suffix])
])])
divert[]dnl

#ifndef FLOATTYPES_CATS_CONSTANTS_HEADER_GUARD__
#define FLOATTYPES_CATS_CONSTANTS_HEADER_GUARD__

#include "floattypes/HATS/config.hats"
#include "floattypes/CATS/defines.cats"

/* e */
m4_foreachq([t],[all_floattypes],
[math_constant([M_E],[2.718281828459045235360287471352662498],t)])

/* log_2 e */
m4_foreachq([t],[all_floattypes],
[math_constant([M_LOG2E],[1.442695040888963407359924681001892137],t)])

/* log_10 e */
m4_foreachq([t],[all_floattypes],
[math_constant([M_LOG10E],[0.434294481903251827651128918916605082],t)])

/* log_e 2 */
m4_foreachq([t],[all_floattypes],
[math_constant([M_LN2],[0.693147180559945309417232121458176568],t)])

/* log_e 10 */
m4_foreachq([t],[all_floattypes],
[math_constant([M_LN10],[2.302585092994045684017991454684364208],t)])

/* log_e(pi) */
m4_foreachq([t],[all_floattypes],
[math_constant([M_LNPI],[1.1447298858494001741434273513530587116472948129153115715136230714721377698848],t)])

/* pi */
m4_foreachq([t],[all_floattypes],
[math_constant([M_PI],[3.141592653589793238462643383279502884],t)])

/* pi/2 */
m4_foreachq([t],[all_floattypes],
[math_constant([M_PI_2],[1.570796326794896619231321691639751442],t)])

/* pi/4 */
m4_foreachq([t],[all_floattypes],
[math_constant([M_PI_4],[0.785398163397448309615660845819875721],t)])

/* 1/pi */
m4_foreachq([t],[all_floattypes],
[math_constant([M_1_PI],[0.318309886183790671537767526745028724],t)])

/* 2/pi */
m4_foreachq([t],[all_floattypes],
[math_constant([M_2_PI],[0.636619772367581343075535053490057448],t)])

/* 2/sqrt(pi) */
m4_foreachq([t],[all_floattypes],
[math_constant([M_2_SQRTPI],[1.128379167095512573896158903121545172],t)])

/* sqrt(pi) */
m4_foreachq([t],[all_floattypes],
[math_constant([M_SQRTPI],[1.77245385090551602729816748334114518279754945612238712821380778985291128459103218],t)])

/* sqrt(2) */
m4_foreachq([t],[all_floattypes],
[math_constant([M_SQRT2],[1.414213562373095048801688724209698079],t)])

/* 1/sqrt(2) */
m4_foreachq([t],[all_floattypes],
[math_constant([M_SQRT1_2],[0.707106781186547524400844362104849039],t)])

/* sqrt(3) */
m4_foreachq([t],[all_floattypes],
[math_constant([M_SQRT3],[1.7320508075688772935274463415058723669428052538103806280558069794519330169088],t)])

/* Euler-Mascheroni constant */
m4_foreachq([t],[all_floattypes],
[math_constant([M_EULER],[0.57721566490153286060651209008240243104215933593992359880576723488486772677766467],t)])

#endif /* FLOATTYPES_CATS_CONSTANTS_HEADER_GUARD__ */
