	.file	"nopTask.s"
	.text
	.globl	nopTask
	.type	nopTask, @function
nopTask:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
#APP
# 3 "noploop.c" 1
	nop
# 0 "" 2
# 4 "noploop.c" 1
	nop
# 0 "" 2
# 5 "noploop.c" 1
	nop
# 0 "" 2
# 6 "noploop.c" 1
	nop
# 0 "" 2
# 7 "noploop.c" 1
	nop
# 0 "" 2
# 8 "noploop.c" 1
	nop
# 0 "" 2
# 9 "noploop.c" 1
	nop
# 0 "" 2
# 10 "noploop.c" 1
	nop
# 0 "" 2
# 11 "noploop.c" 1
	nop
# 0 "" 2
# 12 "noploop.c" 1
	nop
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
	ret
	.cfi_endproc
.LFE0:
	.size	nopTask, .-nopTask
	.ident	"GCC: (GNU) 14.3.0"
	.section	.note.GNU-stack,"",@progbits
