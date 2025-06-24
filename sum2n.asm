extern printf

section .data
    number dq 10
    message db "The sum up to %d = %d", 10, 0

section .text
    global main

main:
    xor rbx, rbx        ; sum = 0
    mov rcx, 1          ; counter = 1

.loop:
    mov rdx, [rel number]   ; rdx = number
    cmp rcx, rdx
    ja  .done

    add rbx, rcx        ; sum += counter
    inc rcx             ; counter++
    jmp .loop

.done:
    lea rdi, [rel message]
    mov rsi, rdx        ; first %d = 10
    mov rdx, rbx        ; second %d = sum
    xor rax, rax
    call printf

    mov rax, 60         ; exit syscall
    xor rdi, rdi
    syscall

