section .data
    message db "3 x %d = %d", 10, 0

section .text
    global main
    extern printf

main:
    mov rcx, 1            ; counter from 1 to 10

.loop:
    cmp rcx, 11           ; loop until rcx == 11
    jge .exitcode

    mov eax, 3
    imul eax, ecx         ; eax = 3 * rcx

    lea rdi, [rel message]
    mov esi, ecx          ; first %d (1 to 10)
    mov edx, eax          ; second %d (result)
    xor eax, eax
    call printf

    inc rcx
    jmp .loop

.exitcode:
    mov rax, 60
    xor rdi, rdi
    syscall

