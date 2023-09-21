	.file	"isleapC.c"
	.text
	.globl	_checkYear
	.def	_checkYear;	.scl	2;	.type	32;	.endef
_checkYear:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	L2
	movl	8(%ebp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	testl	%eax, %eax
	jne	L3
L2:
	movl	8(%ebp), %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$7, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$400, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	testl	%eax, %eax
	jne	L4
L3:
	movl	$1, %eax
	jmp	L5
L4:
	movl	$0, %eax
L5:
	andl	$1, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "\12\12   Checking %d to see if it's a leap year: \0"
LC1:
	.ascii "Yes!\12\0"
LC2:
	.ascii "Nope...\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$1900, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L8
	movl	$LC1, %eax
	jmp	L9
L8:
	movl	$LC2, %eax
L9:
	movl	%eax, (%esp)
	call	_printf
	movl	$1920, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L10
	movl	$LC1, %eax
	jmp	L11
L10:
	movl	$LC2, %eax
L11:
	movl	%eax, (%esp)
	call	_printf
	movl	$1922, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L12
	movl	$LC1, %eax
	jmp	L13
L12:
	movl	$LC2, %eax
L13:
	movl	%eax, (%esp)
	call	_printf
	movl	$2000, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L14
	movl	$LC1, %eax
	jmp	L15
L14:
	movl	$LC2, %eax
L15:
	movl	%eax, (%esp)
	call	_printf
	movl	$2020, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L16
	movl	$LC1, %eax
	jmp	L17
L16:
	movl	$LC2, %eax
L17:
	movl	%eax, (%esp)
	call	_printf
	movl	$2021, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L18
	movl	$LC1, %eax
	jmp	L19
L18:
	movl	$LC2, %eax
L19:
	movl	%eax, (%esp)
	call	_printf
	movl	$1600, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L20
	movl	$LC1, %eax
	jmp	L21
L20:
	movl	$LC2, %eax
L21:
	movl	%eax, (%esp)
	call	_printf
	movl	$1800, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L22
	movl	$LC1, %eax
	jmp	L23
L22:
	movl	$LC2, %eax
L23:
	movl	%eax, (%esp)
	call	_printf
	movl	$1802, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L24
	movl	$LC1, %eax
	jmp	L25
L24:
	movl	$LC2, %eax
L25:
	movl	%eax, (%esp)
	call	_printf
	movl	$1804, 28(%esp)
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	_checkYear
	testb	%al, %al
	je	L26
	movl	$LC1, %eax
	jmp	L27
L26:
	movl	$LC2, %eax
L27:
	movl	%eax, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
