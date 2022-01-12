/* SPDX-License-Identifier: GPL-2.0 */
#ifndef BTRFS_EXPORT_H
#define BTRFS_EXPORT_H

#include <linux/exportfs.h>

extern const struct export_operations btrfs_export_ops;

struct btrfs_fid {
	u64 objectid;
	u64 root_objectid;
	u32 gen;

	u64 parent_objectid;
	u32 parent_gen;

	u64 parent_root_objectid;
} __attribute__ ((packed));

<<<<<<< HEAD
<<<<<<< HEAD
struct dentry *btrfs_get_dentry(struct super_block *sb, u64 objectid,
				u64 root_objectid, u32 generation,
				int check_generation);
struct dentry *btrfs_get_parent(struct dentry *child);

=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
#endif
