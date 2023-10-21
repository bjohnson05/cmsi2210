	.file	"hello.c"
gcc2_compiled.:
___gnu_compiled_cplusplus:
	.def	___main;	.scl	2;	.type	32;	.endef
.text
LC0:
	.ascii "\12\12   Hello, World!\12\12\0"
	.align 4
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl %ebp
	movl %esp,%ebp
	subl $8,%esp
	call ___main
	addl $-12,%esp
	pushl $LC0
	call _printf
	addl $16,%esp
	xorl %eax,%eax
	jmp L2
	.p2align 4,,7
L2:
	leave
	ret
	.def	_printf;	.scl	3;	.type	32;	.endef
