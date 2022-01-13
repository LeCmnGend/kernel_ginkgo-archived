debugfs-objs	:= inode.o file.o

<<<<<<< HEAD
ifeq ($(CONFIG_DEBUG_KMEMLEAK),y)
ccflags-y	:= -DCONFIG_DEBUG_FS
endif

obj-y		+= debugfs.o
=======
obj-$(CONFIG_DEBUG_FS)	+= debugfs.o

>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
