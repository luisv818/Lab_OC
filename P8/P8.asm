
;INCISO A

%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    lea ebx, [buffer]
    mov ecx, [N]
    cmp ecx, 10
    ja fin
    cmp ecx, 0
    jna fin

ciclo:
    mov al, 10
    call putchar
    mov edx, msg
    call puts
    call getch
    call putchar
    sub al, 30h
    cmp al, 9
    ja ciclo
    mov edx, [i]
    mov[ebx + edx], al
    add al, 30h
    add byte [i], 1
    sub ecx, 1
    cmp ecx, 0
    jna fin
    jmp ciclo
    

fin:    
    mov al, 10
    call putchar
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
 msg db 'Ingresa un numero del 0 al 9: ', 0
 N db 5
 i db 0
    section .bss
buffer resb 10;