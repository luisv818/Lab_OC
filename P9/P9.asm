section .data

section .bss

section .text
    global _start 
_start:

    

suma:
    push ebp
    mov ebp, esp
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 8], esi
    mov eax, dword ptr [ebp - 4]
    add eax, dword ptr [ebp - 8]
    pop ebp
    ret

strlen:
    push ebp
    mov ebp, esp

    pop ebp
    ret