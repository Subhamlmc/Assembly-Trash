; Goal of this program is to swap values in registers during runtime
extern printf
section .data
    message1 db "The value hold by 1st register used in this program is %d", 10,0
    message2 db "The value hold by 2nd register used in this program is %d", 10,0
    message3 db "The value exchanged by 1st register used in this program is %d", 10,0
    message4 db "The value exchanged  by 2nd register used in this program is %d", 10,0
section .text
global main
main:
    mov r14, 10
    mov r15, 20

    mov rdi, message1
    mov rsi, r14
    xor rax,rax
    call printf

    mov rdi, message2
    mov rsi, r15
    xor rax,rax
    call printf

    xchg rbx,rcx

    mov rdi, message3
    mov rsi, r14
    xor rax,rax
    call printf  

    mov rdi, message4
    mov rsi, r15
    xor rax,rax
    call printf

    mov rax, 60 
    xor rdi,rdi
    syscall
