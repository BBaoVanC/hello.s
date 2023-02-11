global _start

section .text
_start:
    push 1
    pop rax
    mov edi, eax
    push 13
    pop rdx ; less bytes than mov edx, 13
    mov esi, hello
    syscall
    push 60
    pop rax
    xor edi, edi
    syscall
hello: db "Hello world!", 0xa
