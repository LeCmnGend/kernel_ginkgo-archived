<<<<<<< HEAD
<<<<<<< HEAD
/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (c) 2013-2021, Arm Limited.
 *
 * Adapted from the original at:
 * https://github.com/ARM-software/optimized-routines/blob/e823e3abf5f89ecb/string/aarch64/memcmp.S
=======
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
/*
 * Copyright (C) 2013 ARM Ltd.
 * Copyright (C) 2013 Linaro.
 *
 * This code is based on glibc cortex strings work originally authored by Linaro
 * and re-licensed under GPLv2 for the Linux kernel. The original code can
 * be found @
 *
 * http://bazaar.launchpad.net/~linaro-toolchain-dev/cortex-strings/trunk/
 * files/head:/src/aarch64/
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
<<<<<<< HEAD
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
 */

#include <linux/linkage.h>
#include <asm/assembler.h>

<<<<<<< HEAD
<<<<<<< HEAD
/* Assumptions:
 *
 * ARMv8-a, AArch64, unaligned accesses.
 */

#define L(label) .L ## label

/* Parameters and result.  */
#define src1		x0
#define src2		x1
#define limit		x2
#define result		w0

/* Internal variables.  */
#define data1		x3
#define data1w		w3
#define data1h		x4
#define data2		x5
#define data2w		w5
#define data2h		x6
#define tmp1		x7
#define tmp2		x8

SYM_FUNC_START_WEAK_PI(memcmp)
	subs	limit, limit, 8
	b.lo	L(less8)

	ldr	data1, [src1], 8
	ldr	data2, [src2], 8
	cmp	data1, data2
	b.ne	L(return)

	subs	limit, limit, 8
	b.gt	L(more16)

	ldr	data1, [src1, limit]
	ldr	data2, [src2, limit]
	b	L(return)

L(more16):
	ldr	data1, [src1], 8
	ldr	data2, [src2], 8
	cmp	data1, data2
	bne	L(return)

	/* Jump directly to comparing the last 16 bytes for 32 byte (or less)
	   strings.  */
	subs	limit, limit, 16
	b.ls	L(last_bytes)

	/* We overlap loads between 0-32 bytes at either side of SRC1 when we
	   try to align, so limit it only to strings larger than 128 bytes.  */
	cmp	limit, 96
	b.ls	L(loop16)

	/* Align src1 and adjust src2 with bytes not yet done.  */
	and	tmp1, src1, 15
	add	limit, limit, tmp1
	sub	src1, src1, tmp1
	sub	src2, src2, tmp1

	/* Loop performing 16 bytes per iteration using aligned src1.
	   Limit is pre-decremented by 16 and must be larger than zero.
	   Exit if <= 16 bytes left to do or if the data is not equal.  */
	.p2align 4
L(loop16):
	ldp	data1, data1h, [src1], 16
	ldp	data2, data2h, [src2], 16
	subs	limit, limit, 16
	ccmp	data1, data2, 0, hi
	ccmp	data1h, data2h, 0, eq
	b.eq	L(loop16)

	cmp	data1, data2
	bne	L(return)
	mov	data1, data1h
	mov	data2, data2h
	cmp	data1, data2
	bne	L(return)

	/* Compare last 1-16 bytes using unaligned access.  */
L(last_bytes):
	add	src1, src1, limit
	add	src2, src2, limit
	ldp	data1, data1h, [src1]
	ldp	data2, data2h, [src2]
	cmp	data1, data2
	bne	L(return)
	mov	data1, data1h
	mov	data2, data2h
	cmp	data1, data2

	/* Compare data bytes and set return value to 0, -1 or 1.  */
L(return):
#ifndef __AARCH64EB__
	rev	data1, data1
	rev	data2, data2
#endif
	cmp	data1, data2
L(ret_eq):
	cset	result, ne
	cneg	result, result, lo
	ret

	.p2align 4
	/* Compare up to 8 bytes.  Limit is [-8..-1].  */
L(less8):
	adds	limit, limit, 4
	b.lo	L(less4)
	ldr	data1w, [src1], 4
	ldr	data2w, [src2], 4
	cmp	data1w, data2w
	b.ne	L(return)
	sub	limit, limit, 4
L(less4):
	adds	limit, limit, 4
	beq	L(ret_eq)
L(byte_loop):
	ldrb	data1w, [src1], 1
	ldrb	data2w, [src2], 1
	subs	limit, limit, 1
	ccmp	data1w, data2w, 0, ne	/* NZCV = 0b0000.  */
	b.eq	L(byte_loop)
	sub	result, data1w, data2w
	ret

SYM_FUNC_END_PI(memcmp)
=======
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
/*
* compare memory areas(when two memory areas' offset are different,
* alignment handled by the hardware)
*
* Parameters:
*  x0 - const memory area 1 pointer
*  x1 - const memory area 2 pointer
*  x2 - the maximal compare byte length
* Returns:
*  x0 - a compare result, maybe less than, equal to, or greater than ZERO
*/

/* Parameters and result.  */
src1		.req	x0
src2		.req	x1
limit		.req	x2
result		.req	x0

/* Internal variables.  */
data1		.req	x3
data1w		.req	w3
data2		.req	x4
data2w		.req	w4
has_nul		.req	x5
diff		.req	x6
endloop		.req	x7
tmp1		.req	x8
tmp2		.req	x9
tmp3		.req	x10
pos		.req	x11
limit_wd	.req	x12
mask		.req	x13

WEAK(memcmp)
	cbz	limit, .Lret0
	eor	tmp1, src1, src2
	tst	tmp1, #7
	b.ne	.Lmisaligned8
	ands	tmp1, src1, #7
	b.ne	.Lmutual_align
	sub	limit_wd, limit, #1 /* limit != 0, so no underflow.  */
	lsr	limit_wd, limit_wd, #3 /* Convert to Dwords.  */
	/*
	* The input source addresses are at alignment boundary.
	* Directly compare eight bytes each time.
	*/
.Lloop_aligned:
	ldr	data1, [src1], #8
	ldr	data2, [src2], #8
.Lstart_realigned:
	subs	limit_wd, limit_wd, #1
	eor	diff, data1, data2	/* Non-zero if differences found.  */
	csinv	endloop, diff, xzr, cs	/* Last Dword or differences.  */
	cbz	endloop, .Lloop_aligned

	/* Not reached the limit, must have found a diff.  */
	tbz	limit_wd, #63, .Lnot_limit

	/* Limit % 8 == 0 => the diff is in the last 8 bytes. */
	ands	limit, limit, #7
	b.eq	.Lnot_limit
	/*
	* The remained bytes less than 8. It is needed to extract valid data
	* from last eight bytes of the intended memory range.
	*/
	lsl	limit, limit, #3	/* bytes-> bits.  */
	mov	mask, #~0
CPU_BE( lsr	mask, mask, limit )
CPU_LE( lsl	mask, mask, limit )
	bic	data1, data1, mask
	bic	data2, data2, mask

	orr	diff, diff, mask
	b	.Lnot_limit

.Lmutual_align:
	/*
	* Sources are mutually aligned, but are not currently at an
	* alignment boundary. Round down the addresses and then mask off
	* the bytes that precede the start point.
	*/
	bic	src1, src1, #7
	bic	src2, src2, #7
	ldr	data1, [src1], #8
	ldr	data2, [src2], #8
	/*
	* We can not add limit with alignment offset(tmp1) here. Since the
	* addition probably make the limit overflown.
	*/
	sub	limit_wd, limit, #1/*limit != 0, so no underflow.*/
	and	tmp3, limit_wd, #7
	lsr	limit_wd, limit_wd, #3
	add	tmp3, tmp3, tmp1
	add	limit_wd, limit_wd, tmp3, lsr #3
	add	limit, limit, tmp1/* Adjust the limit for the extra.  */

	lsl	tmp1, tmp1, #3/* Bytes beyond alignment -> bits.*/
	neg	tmp1, tmp1/* Bits to alignment -64.  */
	mov	tmp2, #~0
	/*mask off the non-intended bytes before the start address.*/
CPU_BE( lsl	tmp2, tmp2, tmp1 )/*Big-endian.Early bytes are at MSB*/
	/* Little-endian.  Early bytes are at LSB.  */
CPU_LE( lsr	tmp2, tmp2, tmp1 )

	orr	data1, data1, tmp2
	orr	data2, data2, tmp2
	b	.Lstart_realigned

	/*src1 and src2 have different alignment offset.*/
.Lmisaligned8:
	cmp	limit, #8
	b.lo	.Ltiny8proc /*limit < 8: compare byte by byte*/

	and	tmp1, src1, #7
	neg	tmp1, tmp1
	add	tmp1, tmp1, #8/*valid length in the first 8 bytes of src1*/
	and	tmp2, src2, #7
	neg	tmp2, tmp2
	add	tmp2, tmp2, #8/*valid length in the first 8 bytes of src2*/
	subs	tmp3, tmp1, tmp2
	csel	pos, tmp1, tmp2, hi /*Choose the maximum.*/

	sub	limit, limit, pos
	/*compare the proceeding bytes in the first 8 byte segment.*/
.Ltinycmp:
	ldrb	data1w, [src1], #1
	ldrb	data2w, [src2], #1
	subs	pos, pos, #1
	ccmp	data1w, data2w, #0, ne  /* NZCV = 0b0000.  */
	b.eq	.Ltinycmp
	cbnz	pos, 1f /*diff occurred before the last byte.*/
	cmp	data1w, data2w
	b.eq	.Lstart_align
1:
	sub	result, data1, data2
	ret

.Lstart_align:
	lsr	limit_wd, limit, #3
	cbz	limit_wd, .Lremain8

	ands	xzr, src1, #7
	b.eq	.Lrecal_offset
	/*process more leading bytes to make src1 aligned...*/
	add	src1, src1, tmp3 /*backwards src1 to alignment boundary*/
	add	src2, src2, tmp3
	sub	limit, limit, tmp3
	lsr	limit_wd, limit, #3
	cbz	limit_wd, .Lremain8
	/*load 8 bytes from aligned SRC1..*/
	ldr	data1, [src1], #8
	ldr	data2, [src2], #8

	subs	limit_wd, limit_wd, #1
	eor	diff, data1, data2  /*Non-zero if differences found.*/
	csinv	endloop, diff, xzr, ne
	cbnz	endloop, .Lunequal_proc
	/*How far is the current SRC2 from the alignment boundary...*/
	and	tmp3, tmp3, #7

.Lrecal_offset:/*src1 is aligned now..*/
	neg	pos, tmp3
.Lloopcmp_proc:
	/*
	* Divide the eight bytes into two parts. First,backwards the src2
	* to an alignment boundary,load eight bytes and compare from
	* the SRC2 alignment boundary. If all 8 bytes are equal,then start
	* the second part's comparison. Otherwise finish the comparison.
	* This special handle can garantee all the accesses are in the
	* thread/task space in avoid to overrange access.
	*/
	ldr	data1, [src1,pos]
	ldr	data2, [src2,pos]
	eor	diff, data1, data2  /* Non-zero if differences found.  */
	cbnz	diff, .Lnot_limit

	/*The second part process*/
	ldr	data1, [src1], #8
	ldr	data2, [src2], #8
	eor	diff, data1, data2  /* Non-zero if differences found.  */
	subs	limit_wd, limit_wd, #1
	csinv	endloop, diff, xzr, ne/*if limit_wd is 0,will finish the cmp*/
	cbz	endloop, .Lloopcmp_proc
.Lunequal_proc:
	cbz	diff, .Lremain8

/* There is difference occurred in the latest comparison. */
.Lnot_limit:
/*
* For little endian,reverse the low significant equal bits into MSB,then
* following CLZ can find how many equal bits exist.
*/
CPU_LE( rev	diff, diff )
CPU_LE( rev	data1, data1 )
CPU_LE( rev	data2, data2 )

	/*
	* The MS-non-zero bit of DIFF marks either the first bit
	* that is different, or the end of the significant data.
	* Shifting left now will bring the critical information into the
	* top bits.
	*/
	clz	pos, diff
	lsl	data1, data1, pos
	lsl	data2, data2, pos
	/*
	* We need to zero-extend (char is unsigned) the value and then
	* perform a signed subtraction.
	*/
	lsr	data1, data1, #56
	sub	result, data1, data2, lsr #56
	ret

.Lremain8:
	/* Limit % 8 == 0 =>. all data are equal.*/
	ands	limit, limit, #7
	b.eq	.Lret0

.Ltiny8proc:
	ldrb	data1w, [src1], #1
	ldrb	data2w, [src2], #1
	subs	limit, limit, #1

	ccmp	data1w, data2w, #0, ne  /* NZCV = 0b0000. */
	b.eq	.Ltiny8proc
	sub	result, data1, data2
	ret
.Lret0:
	mov	result, #0
	ret
ENDPIPROC(memcmp)
<<<<<<< HEAD
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
