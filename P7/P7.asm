;INCISO A

%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

no_valido:
    call getche
    cmp al, '0'
jb no_valido
    cmp al, '9'
ja no_valido

    cmp al, '5'
jae fin
    mov al, 10
    call putchar
    mov edx, msg
    call puts
    mov al, 10
    call putchar
fin:    
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
 msg db 'El numero es menor que 5', 0xa, 0