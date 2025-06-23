;sum of numbers
section .data
    subham dq 5
    sulav dq 19
section .text
global main
main:
    mov rsi,[rel subham]
    add rsi,[rel sulav]
    mov rdi, rsi
    mov rax, 60
    syscall
