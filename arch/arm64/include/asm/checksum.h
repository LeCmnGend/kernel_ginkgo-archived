/*
 * Copyright (C) 2016 ARM Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef __ASM_CHECKSUM_H
#define __ASM_CHECKSUM_H

<<<<<<< HEAD
#include <linux/in6.h>

#define _HAVE_ARCH_IPV6_CSUM
__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
			const struct in6_addr *daddr,
			__u32 len, __u8 proto, __wsum sum);
=======
#include <linux/types.h>
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388

static inline __sum16 csum_fold(__wsum csum)
{
	u32 sum = (__force u32)csum;
	sum += (sum >> 16) | (sum << 16);
	return ~(__force __sum16)(sum >> 16);
}
#define csum_fold csum_fold

static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
{
	__uint128_t tmp;
	u64 sum;
<<<<<<< HEAD
	int n = ihl; /* we want it signed */

	tmp = *(const __uint128_t *)iph;
	iph += 16;
	n -= 4;
=======

	tmp = *(const __uint128_t *)iph;
	iph += 16;
	ihl -= 4;
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
	tmp += ((tmp >> 64) | (tmp << 64));
	sum = tmp >> 64;
	do {
		sum += *(const u32 *)iph;
		iph += 4;
<<<<<<< HEAD
	} while (--n > 0);
=======
	} while (--ihl);
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388

	sum += ((sum >> 32) | (sum << 32));
	return csum_fold((__force u32)(sum >> 32));
}
#define ip_fast_csum ip_fast_csum

<<<<<<< HEAD
extern unsigned int do_csum(const unsigned char *buff, int len);
#define do_csum do_csum

=======
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
#include <asm-generic/checksum.h>

#endif	/* __ASM_CHECKSUM_H */
