/ {
	images {
<<<<<<< HEAD
<<<<<<< HEAD
		fdt-boston {
=======
		fdt@boston {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
		fdt@boston {
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
			description = "img,boston Device Tree";
			data = /incbin/("boot/dts/img/boston.dtb");
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
		conf-boston {
			description = "Boston Linux kernel";
			kernel = "kernel";
			fdt = "fdt-boston";
=======
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
		conf@boston {
			description = "Boston Linux kernel";
			kernel = "kernel@0";
			fdt = "fdt@boston";
<<<<<<< HEAD
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
		};
	};
};
