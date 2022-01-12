/*
 * Copyright (C) 2012 ARM Ltd.
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

#include <linux/linkage.h>
#include <linux/const.h>
#include <asm/assembler.h>
#include <asm/page.h>

/*
 * Clear page @dest
 *
 * Parameters:
 *	x0 - dest
 */
<<<<<<< HEAD
<<<<<<< HEAD
SYM_FUNC_START_PI(clear_page)
=======
ENTRY(clear_page)
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
ENTRY(clear_page)
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
	mrs	x1, dczid_el0
	and	w1, w1, #0xf
	mov	x2, #4
	lsl	x1, x2, x1

1:	dc	zva, x0
	add	x0, x0, x1
	tst	x0, #(PAGE_SIZE - 1)
	b.ne	1b
	ret
<<<<<<< HEAD
<<<<<<< HEAD
SYM_FUNC_END_PI(clear_page)
=======
ENDPROC(clear_page)
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
ENDPROC(clear_page)
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
