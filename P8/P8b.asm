
;INCISO B

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

    mov edx, [i]
    mov al, [ebx + edx]
    call pHex_b

    mov al, 10
    call putchar

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
 msg db 'Valor en hex: ', 0
 N db 5
 i db 0
    section .bss
buffer resb 10;