/*
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file "COPYING" in the main directory of this archive
 * for more details.
 *
 * Copyright (C) 1999, 2000, 06 Ralf Baechle (ralf@linux-mips.org)
 * Copyright (C) 1999, 2000 Silicon Graphics, Inc.
 */
#ifndef _ASM_SPINLOCK_H
#define _ASM_SPINLOCK_H

#include <asm/processor.h>
#include <asm/qrwlock.h>
#include <asm/qspinlock.h>

<<<<<<< HEAD
=======
#define arch_read_lock_flags(lock, flags) arch_read_lock(lock)
#define arch_write_lock_flags(lock, flags) arch_write_lock(lock)

#define arch_spin_relax(lock)	cpu_relax()
#define arch_read_relax(lock)	cpu_relax()
#define arch_write_relax(lock)	cpu_relax()

>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
#endif /* _ASM_SPINLOCK_H */
