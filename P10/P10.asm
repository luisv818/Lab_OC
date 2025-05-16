%include "../LIB/pc_iox.inc"

section .text
    global print_bin8
    global print_bin16
    global print_bin32
    global print_bin64

print_bin8:
    push ebp
    mov ebp, esp
    movzx eax, byte[ebp + 8]
    mov edx, eax
    mov bl, 7

ciclo:
    cmp bl, 255
    je fin
    mov cl, bl
    shr eax, cl
    and eax, 1
    add al, "0"
    call putchar
    mov eax, edx
    dec bl
    jmp ciclo

fin:
    mov al, 10
    call putchar
    pop ebp
    ret

print_bin16:
    push ebp
    mov ebp, esp
    movzx eax, word [ebp + 8]   
    movzx ecx, ah               ; Obtiene los 8 bits altos
    push ecx
    call print_bin8             ; Imprime los 8 bits altos
    add esp, 4

    movzx ecx, al               ; Obtiene los 8 bits bajos
    push ecx
    call print_bin8             ; Imprime los 8 bits bajos
    add esp, 4

    pop ebp
    ret

print_bin32:
    push ebp
    mov ebp, esp

    movzx eax, word [ebp + 8]   
    movzx ecx, ax               ; Obtiene los 8 bits bajos
    push ecx
    call print_bin16             ; Imprime los 8 bits bajos
    add esp, 4

    pop ebp
    ret