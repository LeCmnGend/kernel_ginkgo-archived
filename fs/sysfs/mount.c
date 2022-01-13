/*
 * fs/sysfs/symlink.c - operations for initializing and mounting sysfs
 *
 * Copyright (c) 2001-3 Patrick Mochel
 * Copyright (c) 2007 SUSE Linux Products GmbH
 * Copyright (c) 2007 Tejun Heo <teheo@suse.de>
 *
 * This file is released under the GPLv2.
 *
 * Please see Documentation/filesystems/sysfs.txt for more information.
 */

#define DEBUG

#include <linux/fs.h>
#include <linux/magic.h>
#include <linux/mount.h>
#include <linux/init.h>
#include <linux/user_namespace.h>

#include "sysfs.h"

static struct kernfs_root *sysfs_root;
struct kernfs_node *sysfs_root_kn;

static struct dentry *sysfs_mount(struct file_system_type *fs_type,
	int flags, const char *dev_name, void *data)
{
	struct dentry *root;
	void *ns;
<<<<<<< HEAD
	bool new_sb = false;
=======
	bool new_sb;
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388

	if (!(flags & MS_KERNMOUNT)) {
		if (!kobj_ns_current_may_mount(KOBJ_NS_TYPE_NET))
			return ERR_PTR(-EPERM);
	}

	ns = kobj_ns_grab_current(KOBJ_NS_TYPE_NET);
	root = kernfs_mount_ns(fs_type, flags, sysfs_root,
				SYSFS_MAGIC, &new_sb, ns);
<<<<<<< HEAD
	if (!new_sb)
		kobj_ns_drop(KOBJ_NS_TYPE_NET, ns);
	else if (!IS_ERR(root))
=======
	if (IS_ERR(root) || !new_sb)
		kobj_ns_drop(KOBJ_NS_TYPE_NET, ns);
	else if (new_sb)
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
		root->d_sb->s_iflags |= SB_I_USERNS_VISIBLE;

	return root;
}

static void sysfs_kill_sb(struct super_block *sb)
{
	void *ns = (void *)kernfs_super_ns(sb);

	kernfs_kill_sb(sb);
	kobj_ns_drop(KOBJ_NS_TYPE_NET, ns);
}

static struct file_system_type sysfs_fs_type = {
	.name		= "sysfs",
	.mount		= sysfs_mount,
	.kill_sb	= sysfs_kill_sb,
	.fs_flags	= FS_USERNS_MOUNT,
};

int __init sysfs_init(void)
{
	int err;

	sysfs_root = kernfs_create_root(NULL, KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK,
					NULL);
	if (IS_ERR(sysfs_root))
		return PTR_ERR(sysfs_root);

	sysfs_root_kn = sysfs_root->kn;

	err = register_filesystem(&sysfs_fs_type);
	if (err) {
		kernfs_destroy_root(sysfs_root);
		return err;
	}

	return 0;
}
