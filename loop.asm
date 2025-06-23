; goal of this program is to loop till the counter reaches 5
extern printf
section .data
    message db "Number : %d", 10,0
section .text
global main
main:
    mov rbx, 1  ; intial value of rbx register==1

.loop:
    cmp rbx, 5
    jge .done
    

    lea rdi , [rel message]
    mov rsi,  rbx
    xor rax, rax
    call printf
    inc  rbx
    jmp .loop

.done:
    mov rax,60
    xor rdi,rdi
    syscall
