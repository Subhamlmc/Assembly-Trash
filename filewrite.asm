section .data
    filename db "testfile", 0
    message db "Hello this file has been modified in such a way that it is readable !!",0
    message_length equ $ -message

section .text
    global main
    extern printf
main:
    mov rax, 257        ; openat syscall
    mov rdi, -100       ; AT_FDCWD = current directory
    lea rsi, [rel filename]
    mov rdx, 0x241      ; O_WRONLY | O_CREAT | O_TRUNC
    mov r10, 0777       ; permissions
    syscall
    
    mov rax,1
    mov rdi, r12
    lea rsi, [rel message]
    mov rdx, message_length
    syscall
   
    mov rax, 3
    mov rdi, r12
    syscall

    mov  rax, 60
    xor  rdi , rdi
    syscall
