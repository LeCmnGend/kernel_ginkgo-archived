# SPDX-License-Identifier: GPL-2.0
#
# Makefile for the Linux unix domain socket layer.
#

obj-$(CONFIG_UNIX)	+= unix.o

unix-y			:= af_unix.o garbage.o
unix-$(CONFIG_SYSCTL)	+= sysctl_net_unix.o

obj-$(CONFIG_UNIX_DIAG)	+= unix_diag.o
unix_diag-y		:= diag.o
<<<<<<< HEAD

obj-$(CONFIG_UNIX_SCM)	+= scm.o
=======
>>>>>>> 89a4cb10f32fdd42680f4e95820adf5690e66388
