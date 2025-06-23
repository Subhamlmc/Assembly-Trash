extern printf

section .data
    subham dq 10
    sulav  dq 10
    messageformat db "The sum is %d", 10, 0  ; \n and null terminator

section .text
global main
main:
    mov rax, [rel subham]
    add rax, [rel sulav]

    
    mov rsi, rax              
    lea rdi, [rel messageformat] 
    xor rax, rax              
    call printf

    
    mov rax, 60               
    xor rdi, rdi            
    syscall

