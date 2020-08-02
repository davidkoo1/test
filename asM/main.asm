
format ELF64
public _start
new_line equ 0xA

msg db "Hello, world!",new_line, 0 ;0xA - \n
len = $-msg
;len equ 13 ;13 - byte

_start:
	mov rax, msg
	call print_string ; Hello, world!
	;call print_string ; Hello, world!
	;call print_string ; Hello, world!
	;call print_string ; Hello, world!
;Типо void ()
	call exit

; | input:
; rax = string
print_string:
push rax
push rbx
push rcx
push rdx
mov rcx, rax
call length_string
mov rdx, rax
mov rax, 4
mov rbx, 1
int 0x80
pop rdx
pop rcx
pop rbx
pop rax
	ret
; | input:
;rax = string
; | output:
; rax = length
length_string:
push rdx
	xor rdx, rdx ; mov rdx, 0
	.next_iter:
		cmp [rax+rdx], byte 0
		je .close ;if
		inc rdx
		 jmp .next_iter ; jmp = go to (.C)
		.close:
		mov rax, rdx 
		pop rdx
	   ret



exit:
	mov rax, 1  ; 1 - exit
	mov rbx, 0  ; 0 - return
	int 0x80