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

#include "floattypes/HATS/config.hats"

m4_foreachq([t],[extra_floattypes],
[#if HAVE_floattypes_strfromd_[]t

atsvoid_t0ype
floattypes_fprint_[]t (atstype_ref r, floattypes_[]t x)
{
  const int buf_size = 100;
  char buf[[buf_size]]; /* C99 array. */
  buf[[buf_size - 1]] = '\0';
  int size = floattypes_strfromd_[]t (buf, buf_size - 1, "%f", x);
  if (size <= buf_size - 1)
    (void) fputs (buf, (FILE *) r);
  else
    {
      char *buf1 = malloc ((size + 1) * sizeof (char));
      if (buf1 != NULL)
        {
          int size1 =
            floattypes_strfromd_[]t (buf1, size + 1, "%f", x);
          if (size1 == size)
            (void) fputs (buf1, (FILE *) r);
          free (buf1);
        }
    }
}

atsvoid_t0ype
floattypes_print_[]t (floattypes_[]t x)
{
  floattypes_fprint_[]t (stdout, x);
}

atsvoid_t0ype
floattypes_prerr_[]t (floattypes_[]t x)
{
  floattypes_fprint_[]t (stderr, x);
}

#endif

])
