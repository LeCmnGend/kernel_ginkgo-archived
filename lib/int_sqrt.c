// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2013 Davidlohr Bueso <davidlohr.bueso@hp.com>
 *
 *  Based on the shift-and-subtract algorithm for computing integer
 *  square root from Guy L. Steele.
 */

#include <linux/kernel.h>
#include <linux/export.h>
#include <linux/bitops.h>

/**
<<<<<<< HEAD
 * int_sqrt - computes the integer square root
 * @x: integer of which to calculate the sqrt
 *
 * Computes: floor(sqrt(x))
 */
inline unsigned long int_sqrt(unsigned long x)
{
	register unsigned long tmp;
	register unsigned long place;
	register unsigned long root = 0;
=======
 * int_sqrt - rough approximation to sqrt
 * @x: integer of which to calculate the sqrt
 *
 * A very rough approximation to the sqrt() function.
 */
unsigned long int_sqrt(unsigned long x)
{
	unsigned long b, m, y = 0;
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4

	if (x <= 1)
		return x;

<<<<<<< HEAD
	place = 1UL << (BITS_PER_LONG - 2);

	do{
		place >>= 2;
	}while(place > x);

	do {
		tmp = root + place;
		root >>= 1;

		if (x >= tmp)
		{
			x -= tmp;
			root += place;
		}
		place >>= 2;
	}while (place != 0);

	return root;
}
EXPORT_SYMBOL(int_sqrt);

#if BITS_PER_LONG < 64
/**
 * int_sqrt64 - strongly typed int_sqrt function when minimum 64 bit input
 * is expected.
 * @x: 64bit integer of which to calculate the sqrt
 */
u32 int_sqrt64(u64 x)
{
	u64 b, m, y = 0;

	if (x <= ULONG_MAX)
		return int_sqrt((unsigned long) x);

	m = 1ULL << ((fls64(x) - 1) & ~1ULL);
=======
	m = 1UL << (__fls(x) & ~1UL);
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
	while (m != 0) {
		b = y + m;
		y >>= 1;

		if (x >= b) {
			x -= b;
			y += m;
		}
		m >>= 2;
	}

	return y;
}
<<<<<<< HEAD
EXPORT_SYMBOL(int_sqrt64);
#endif
=======
EXPORT_SYMBOL(int_sqrt);
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
