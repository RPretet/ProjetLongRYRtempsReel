	.file	"load-task.c"
	.text
	.globl	loadTask
	.type	loadTask, @function
loadTask:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
#APP
# 5 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 6 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 7 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 8 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 9 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 11 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 12 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 13 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 14 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
# 15 "load-task.c" 1
	mov (%rsp), %r8
# 0 "" 2
#NO_APP
	addl	$1, -4(%rbp)
.L2:
	cmpl	$999, -4(%rbp)
	jle	.L3
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	xorl	%edi, %edi
	ret
	.cfi_endproc
.LFE6:
	.size	loadTask, .-loadTask
	.ident	"GCC: (GNU) 14.3.0"
	.section	.note.GNU-stack,"",@progbits
