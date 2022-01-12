# SPDX-License-Identifier: GPL-2.0
#
<<<<<<< HEAD
# Makefile for the linux kernel.
#

CPPFLAGS_vmlinux.lds	:= -DTEXT_OFFSET=$(TEXT_OFFSET)
AFLAGS_head.o		:= -DTEXT_OFFSET=$(TEXT_OFFSET)
CFLAGS_armv8_deprecated.o := -I$(src)

CFLAGS_REMOVE_ftrace.o = -pg
CFLAGS_REMOVE_insn.o = -pg
CFLAGS_REMOVE_return_address.o = -pg

CFLAGS_setup.o = -DUTS_MACHINE='"$(UTS_MACHINE)"'

# Object file lists.
arm64-obj-y		:= debug-monitors.o entry.o irq.o fpsimd.o		\
			   entry-fpsimd.o process.o ptrace.o setup.o signal.o	\
			   sys.o stacktrace.o time.o traps.o io.o vdso.o	\
			   hyp-stub.o psci.o cpu_ops.o insn.o module.o		\
			   return_address.o cpuinfo.o cpu_errata.o		\
			   cpufeature.o alternative.o cacheinfo.o		\
			   smp.o smp_spin_table.o topology.o smccc-call.o

extra-$(CONFIG_EFI)			:= efi-entry.o

OBJCOPYFLAGS := --prefix-symbols=__efistub_
$(obj)/%.stub.o: $(obj)/%.o FORCE
	$(call if_changed,objcopy)

arm64-obj-$(CONFIG_COMPAT)		+= sys32.o signal32.o	\
					   sys_compat.o entry32.o
ifneq ($(CONFIG_VDSO32),y)
arm64-obj-$(CONFIG_COMPAT)		+= sigreturn32.o
endif
arm64-obj-$(CONFIG_KUSER_HELPERS)	+= kuser32.o
arm64-obj-$(CONFIG_FUNCTION_TRACER)	+= ftrace.o entry-ftrace.o
arm64-obj-$(CONFIG_MODULES)		+= arm64ksyms.o
arm64-obj-$(CONFIG_ARM64_MODULE_PLTS)	+= module-plts.o
arm64-obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o perf_callchain.o
arm64-obj-$(CONFIG_HW_PERF_EVENTS)	+= perf_event.o

ifeq ($(CONFIG_TRACING),y)
arm64-obj-$(CONFIG_HW_PERF_EVENTS)	+= perf_trace_counters.o perf_trace_user.o
endif

arm64-obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
arm64-obj-$(CONFIG_CPU_PM)		+= sleep.o suspend.o
arm64-obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
arm64-obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
arm64-obj-$(CONFIG_KGDB)		+= kgdb.o
arm64-obj-$(CONFIG_EFI)			+= efi.o efi-entry.stub.o
arm64-obj-$(CONFIG_PCI)			+= pci.o
arm64-obj-$(CONFIG_ARMV8_DEPRECATED)	+= armv8_deprecated.o
arm64-obj-$(CONFIG_ACPI)		+= acpi.o
arm64-obj-$(CONFIG_ACPI_NUMA)		+= acpi_numa.o
arm64-obj-$(CONFIG_ARM64_ACPI_PARKING_PROTOCOL)	+= acpi_parking_protocol.o
arm64-obj-$(CONFIG_PARAVIRT)		+= paravirt.o
arm64-obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr.o
arm64-obj-$(CONFIG_HIBERNATION)		+= hibernate.o hibernate-asm.o
arm64-obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o	\
					   cpu-reset.o
arm64-obj-$(CONFIG_ARM64_RELOC_TEST)	+= arm64-reloc-test.o
arm64-reloc-test-y := reloc_test_core.o reloc_test_syms.o
arm64-obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
arm64-obj-$(CONFIG_ARM64_SSBD)		+= ssbd.o
arm64-obj-$(CONFIG_SHADOW_CALL_STACK)	+= scs.o

ifeq ($(CONFIG_KVM),y)
arm64-obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR)	+= bpi.o
endif
arm64-obj-$(CONFIG_ARM64_SSBD)		+= ssbd.o

obj-y					+= $(arm64-obj-y) vdso/ probes/
obj-$(CONFIG_VDSO32)			+= vdso32/
obj-m					+= $(arm64-obj-m)
head-y					:= head.o
extra-y					+= $(head-y) vmlinux.lds

ifeq ($(CONFIG_DEBUG_EFI),y)
AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)/vmlinux)\""
endif
=======
# Building a vDSO image for AArch64.
#
# Author: Will Deacon <will.deacon@arm.com>
# Heavily based on the vDSO Makefiles for other archs.
#

obj-vdso := gettimeofday.o note.o sigreturn.o

# Build rules
targets := $(obj-vdso) vdso.so vdso.so.dbg
obj-vdso := $(addprefix $(obj)/, $(obj-vdso))

ldflags-y := -shared -nostdlib -soname=linux-vdso.so.1  --hash-style=sysv \
		--build-id -n -T
ccflags-y += $(DISABLE_LTO)

CFLAGS_REMOVE_vgettimeofday.o += $(CC_FLAGS_SCS)

# Disable gcov profiling for VDSO code
GCOV_PROFILE := n

obj-y += vdso.o
extra-y += vdso.lds
CPPFLAGS_vdso.lds += -P -C -U$(ARCH)

# Force dependency (incbin is bad)
$(obj)/vdso.o : $(obj)/vdso.so

# Link rule for the .so file, .lds has to be first
$(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso)
	$(call if_changed,ld)

# Strip rule for the .so file
$(obj)/%.so: OBJCOPYFLAGS := -S
$(obj)/%.so: $(obj)/%.so.dbg FORCE
	$(call if_changed,objcopy)

# Generate VDSO offsets using helper script
gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
quiet_cmd_vdsosym = VDSOSYM $@
define cmd_vdsosym
	$(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
endef

include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
	$(call if_changed,vdsosym)

# Assembly rules for the .S files
$(obj-vdso): %.o: %.S FORCE
	$(call if_changed_dep,vdsoas)

# Actual build commands
quiet_cmd_vdsoas = VDSOA   $@
      cmd_vdsoas = $(CC) $(a_flags) -c -o $@ $<

# Install commands for the unstripped file
quiet_cmd_vdso_install = INSTALL $@
      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@

vdso.so: $(obj)/vdso.so.dbg
	@mkdir -p $(MODLIB)/vdso
	$(call cmd,vdso_install)

vdso_install: vdso.so
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
