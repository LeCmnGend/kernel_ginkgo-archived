/ {
	images {
<<<<<<< HEAD
		fdt-ni169445 {
=======
		fdt@ni169445 {
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
			description = "NI 169445 device tree";
			data = /incbin/("boot/dts/ni/169445.dtb");
			type = "flat_dt";
			arch = "mips";
			compression = "none";
<<<<<<< HEAD
			hash {
=======
			hash@0 {
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
				algo = "sha1";
			};
		};
	};

	configurations {
<<<<<<< HEAD
		conf-ni169445 {
			description = "NI 169445 Linux Kernel";
			kernel = "kernel";
			fdt = "fdt-ni169445";
=======
		conf@ni169445 {
			description = "NI 169445 Linux Kernel";
			kernel = "kernel@0";
			fdt = "fdt@ni169445";
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
		};
	};
};
