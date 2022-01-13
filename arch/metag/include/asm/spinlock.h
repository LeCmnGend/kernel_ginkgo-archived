/* SPDX-License-Identifier: GPL-2.0 */
#ifndef __ASM_SPINLOCK_H
#define __ASM_SPINLOCK_H

#include <asm/barrier.h>
#include <asm/processor.h>

#ifdef CONFIG_METAG_ATOMICITY_LOCK1
#include <asm/spinlock_lock1.h>
#else
#include <asm/spinlock_lnkget.h>
#endif

/*
 * both lock1 and lnkget are test-and-set spinlocks with 0 unlocked and 1
 * locked.
 */

<<<<<<< HEAD
=======
#define arch_spin_lock_flags(lock, flags) arch_spin_lock(lock)

#define	arch_read_lock_flags(lock, flags) arch_read_lock(lock)
#define	arch_write_lock_flags(lock, flags) arch_write_lock(lock)

#define arch_spin_relax(lock)	cpu_relax()
#define arch_read_relax(lock)	cpu_relax()
#define arch_write_relax(lock)	cpu_relax()

>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
#endif /* __ASM_SPINLOCK_H */
