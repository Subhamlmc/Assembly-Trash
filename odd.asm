;Goal of this program is to print odd numbers upto 10
extern printf
section .data
    message db "---- %d----- ",10,0
section .text
global main
main:
    mov rbx, 1

.loop:
    cmp rbx, 10
    jge .done

    lea rdi, [rel message]
    mov rsi, rbx
    xor rax, rax
    call printf
  
    inc rbx
    inc rbx
    jmp .loop

.done:
    mov rax,60
    xor rdi,rdi
    syscall
