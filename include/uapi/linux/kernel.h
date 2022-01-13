/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
#ifndef _UAPI_LINUX_KERNEL_H
#define _UAPI_LINUX_KERNEL_H

#include <linux/sysinfo.h>
<<<<<<< HEAD
#include <linux/const.h>
=======

/*
 * 'kernel.h' contains some often-used function prototypes etc
 */
#define __ALIGN_KERNEL(x, a)		__ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
#define __ALIGN_KERNEL_MASK(x, mask)	(((x) + (mask)) & ~(mask))

#define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388

#endif /* _UAPI_LINUX_KERNEL_H */
