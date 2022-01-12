/* SPDX-License-Identifier: GPL-2.0 */
/dts-v1/;

/ {
	description = KERNEL_NAME;
	#address-cells = <ADDR_CELLS>;

	images {
<<<<<<< HEAD
<<<<<<< HEAD
		kernel {
=======
		kernel@0 {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
		kernel@0 {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
			description = KERNEL_NAME;
			data = /incbin/(VMLINUX_BINARY);
			type = "kernel";
			arch = "mips";
			os = "linux";
			compression = VMLINUX_COMPRESSION;
			load = /bits/ ADDR_BITS <VMLINUX_LOAD_ADDRESS>;
			entry = /bits/ ADDR_BITS <VMLINUX_ENTRY_ADDRESS>;
<<<<<<< HEAD
<<<<<<< HEAD
			hash {
=======
			hash@0 {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
			hash@0 {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
				algo = "sha1";
			};
		};
	};

	configurations {
<<<<<<< HEAD
<<<<<<< HEAD
		default = "conf-default";

		conf-default {
			description = "Generic Linux kernel";
			kernel = "kernel";
=======
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
		default = "conf@default";

		conf@default {
			description = "Generic Linux kernel";
			kernel = "kernel@0";
<<<<<<< HEAD
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
		};
	};
};
