/ {
	images {
<<<<<<< HEAD
<<<<<<< HEAD
		fdt-ni169445 {
=======
		fdt@ni169445 {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
		fdt@ni169445 {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
			description = "NI 169445 device tree";
			data = /incbin/("boot/dts/ni/169445.dtb");
			type = "flat_dt";
			arch = "mips";
			compression = "none";
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
		conf-ni169445 {
			description = "NI 169445 Linux Kernel";
			kernel = "kernel";
			fdt = "fdt-ni169445";
=======
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
		conf@ni169445 {
			description = "NI 169445 Linux Kernel";
			kernel = "kernel@0";
			fdt = "fdt@ni169445";
<<<<<<< HEAD
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
		};
	};
};
