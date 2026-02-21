	.file	"calc-task.s"
	.text
	.globl	calcTask
	.type	calcTask, @function
calcTask:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	add %r8, %r9
	addl	$1, -4(%rbp)
.L2:
	cmpl	$999, -4(%rbp)
	jle	.L3
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	calcTask, .-calcTask
	.ident	"GCC: (GNU) 14.3.0"
	.section	.note.GNU-stack,"",@progbits
