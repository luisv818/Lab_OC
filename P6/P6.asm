%include "../LIB/pc_iox.inc"
%include "../LIB/pBin.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point
    ;aqui inicia el inciso a
    mov eax, 0x22446688
    ror eax, 4 
    call pHex_dw

    mov al, 10
    call putchar

    ;aqui inicia el inciso b
    mov cx, 0x3F48
    call pBin_dw

	mov al, 10
    call putchar

	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
