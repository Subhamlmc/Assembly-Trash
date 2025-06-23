; Goal: Move immediate values and print them
extern printf

section .data
    message db "The immediate value stored in the register is (rax-64bit) --%d--", 10, 0

section .text
global main
main:
    mov rdi, message     ;
    mov rsi, 69          ; 
    xor rax, rax         ;
    call printf

    mov rax, 60          ; syscall: exit
    xor rdi, rdi         ; return code 0
    syscall
