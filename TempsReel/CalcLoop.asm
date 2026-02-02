.section .bss
	fd_out resb 1
	fd_in  resb 1
	count resb 1

.section .data
	file_name db 'NOPdata.txt'
	msg db 'Start NOP loop'
	len equ  $-msg

	msg_done db 'Written to file', 0xa
	len_done equ $-msg_done
	count db 0

.section .text
global CalcLoop
CalcLoop:
	mov  eax, 8
	mov  ebx, file_name
	mov  ecx, 0777        ;read, write and execute by all
	int  0x80             ;call kernel
	mov [fd_out], eax

tag_loop:
	mov edx, 0

nop_loop:
	inc edx

	mov eax, 4
    mov ebx, 3
    mov ecx, 6
    mul ebx
    div ecx



	cmp edx, 10
	jne nop_loop

; write into the file
	mov	edx,len          ;number of bytes
	mov	ecx, msg         ;message to write
	mov	ebx, [fd_out]    ;file descriptor 
	mov	eax,4            ;system call number (sys_write)
	int	0x80             ;call kernel

	add  BYTE PTR [count], 1
    cmp BYTE PTR [count], 100
	jne tag_loop


; close the file
   	mov eax, 6
   	mov ebx, [fd_out]
    
; write the message indicating end of file write
   	mov eax, 4
   	mov ebx, 1
   	mov ecx, msg_done
   	mov edx, len_done
   	int  0x80

	;end prog
   	mov eax, 1
   	mov ebx, 0
   	int  0x80