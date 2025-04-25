;INCISO D

%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    mov dx, 10
ciclo:
    cmp dx, 1
    jb fin_ciclo
    call getche
    push eax
    dec dx
    jmp ciclo
fin_ciclo:

    mov al, 10
    call putchar
    mov edx, msg
    call puts

    mov al, 10
    call putchar

    mov dx, 10
    ciclo2:
    cmp dx, 1
    jb fin_ciclo2
    pop eax
    mov edx, eax
    call puts
    dec dx
    jmp ciclo2
fin_ciclo2:

    mov al, 10
    call putchar
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
 msg db 'Caracteres capturados: '