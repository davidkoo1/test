;чтобы запустить нужно зайти в командную страку, желательно в линуксе



format ELF64
public _start

msg db "hello world",0xA, 0 ;0xA - \n
len = $-msg
;len equ 13 ;13 - byte

_start:
	mov rax, 4 ; 4 - write
	mov rbx, 1 ; 1 - stdout
	mov rcx, msg
	mov rdx, len
	int 0x80
	call exit

exit:
	mov rax, 1  ; 1 - exit
	mov rbx, 0  ; 0 - return
	int 0x80

;Результат: hello world ()



;fasm hello1.asm
;ld hello1.o -o main
;./main