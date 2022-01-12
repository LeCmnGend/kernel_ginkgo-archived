/* SPDX-License-Identifier: GPL-2.0 */
#ifndef _LIB_KSTRTOX_H
#define _LIB_KSTRTOX_H

#define KSTRTOX_OVERFLOW	(1U << 31)
const char *_parse_integer_fixup_radix(const char *s, unsigned int *base);
<<<<<<< HEAD
<<<<<<< HEAD
unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *res,
				  size_t max_chars);
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
unsigned int _parse_integer(const char *s, unsigned int base, unsigned long long *res);

#endif
