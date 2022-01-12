#ifndef __ASM_LINKAGE_H
#define __ASM_LINKAGE_H

#define __ALIGN		.align 2
#define __ALIGN_STR	".align 2"

<<<<<<< HEAD
/*
 * Annotate a function as position independent, i.e., safe to be called before
 * the kernel virtual mapping is activated.
 */
#define SYM_FUNC_START_PI(x)			\
		SYM_FUNC_START_ALIAS(__pi_##x);	\
		SYM_FUNC_START(x)

#define SYM_FUNC_START_WEAK_PI(x)		\
		SYM_FUNC_START_ALIAS(__pi_##x);	\
		SYM_FUNC_START_WEAK(x)

#define SYM_FUNC_START_WEAK_ALIAS_PI(x)		\
		SYM_FUNC_START_ALIAS(__pi_##x);	\
		SYM_START(x, SYM_L_WEAK, SYM_A_ALIGN)

#define SYM_FUNC_END_PI(x)			\
		SYM_FUNC_END(x);		\
		SYM_FUNC_END_ALIAS(__pi_##x)

#define SYM_FUNC_END_ALIAS_PI(x)		\
		SYM_FUNC_END_ALIAS(x);		\
		SYM_FUNC_END_ALIAS(__pi_##x)

=======
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
#endif
