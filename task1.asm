extern printf

section .data
    subham dq 45
    message db "The digit is %d", 10, 0   ; format string with newline and null terminator

section .text
global main

main:
    mov rdi, message          ; 1st arg: format string pointer
    mov rsi, [rel subham]     ; 2nd arg: integer to print (45)
    xor rax, rax              ; rax=0 for variadic function call

    call printf               ; call C printf function

    mov rax, 60               ; syscall: exit
    mov rdi, 42               ; exit code 42
    syscall
