%include "../LIB/pc_iox.inc"

section	.text

	global _start       ;must be declared for using gcc

_start:                     ;tell linker entry point

	mov ebx, 0x5C4B2A60
    add ebx, 0x2201213
    push bx
    mov ax, 8
    mul bl
    mov cx, [N]
    mov cx, ax
    inc cx
    mov ax, bx
    mov dx, 0xFF
    div dx
    call pHex_w
    mov ax, dx
    call pHex_w

    mov al, 10
    call putchar

    push bx
	mov eax, 1	;system call number (sys_exit) -- fin del programa
	int 0x80        ;call kernel

    section .data
    N dw 0