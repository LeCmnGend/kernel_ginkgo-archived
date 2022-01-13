// SPDX-License-Identifier: GPL-2.0
#include <linux/cpu.h>
#include <linux/cpumask.h>
#include <linux/init.h>
#include <linux/node.h>
#include <linux/nodemask.h>
#include <linux/percpu.h>

static DEFINE_PER_CPU(struct cpu, cpu_devices);

static int __init topology_init(void)
{
	int i, ret;

#ifdef CONFIG_NUMA
	for_each_online_node(i)
		register_one_node(i);
#endif /* CONFIG_NUMA */

	for_each_present_cpu(i) {
		struct cpu *c = &per_cpu(cpu_devices, i);

<<<<<<< HEAD
		c->hotpluggable = !!i;
=======
		c->hotpluggable = 1;
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
		ret = register_cpu(c, i);
		if (ret)
			printk(KERN_WARNING "topology_init: register_cpu %d "
			       "failed (%d)\n", i, ret);
	}

	return 0;
}

subsys_initcall(topology_init);
