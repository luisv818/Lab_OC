;INCISO B

%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

    call getche
    cmp al, '0'
jb sigue
    cmp al, '9'
ja sigue
    mov al, 10
    call putchar
    mov edx, msg
    call puts
jmp fin

sigue:
    cmp al, 'A'
jb fin
    cmp al, 'Z'
ja fin
    mov al, 10
    call putchar
    mov edx, msg2
    call puts

fin:    
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
 msg db 'El caracter es un numero', 0xa, 0
 msg2 db 'El caracter es una letra mayuscula', 0xa, 0