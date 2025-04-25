;INCISO C

%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
repite:
    mov cx, 5
    cmp cx, 0
    jb repite
    cmp cx, 40
    ja repite

ciclo:
    cmp cx, 1
    push cx
    jb fin
    mov edx, msg
    call puts
    pop cx
    dec cx
    jmp ciclo
    
fin:    
    mov al, 10
    call putchar
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
 msg db '*'
 