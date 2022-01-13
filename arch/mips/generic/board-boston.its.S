/ {
	images {
<<<<<<< HEAD
		fdt-boston {
=======
		fdt@boston {
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
			description = "img,boston Device Tree";
			data = /incbin/("boot/dts/img/boston.dtb");
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
		conf-boston {
			description = "Boston Linux kernel";
			kernel = "kernel";
			fdt = "fdt-boston";
=======
		conf@boston {
			description = "Boston Linux kernel";
			kernel = "kernel@0";
			fdt = "fdt@boston";
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
		};
	};
};
