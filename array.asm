; Goal: Display array values using a loop

section .data
    array dq 10,20,30,40,50       ; 5 elements
    length equ 5
    printer db "--%d--", 10, 0    ; format with newline

section .text
    global main
    extern printf

main:
    xor rbx, rbx                  ; rbx = 0 (index)

.loop:
    cmp rbx, length
    je .done

    lea rdi, [rel printer]        ; first argument to printf
    mov rsi, [array + rbx*8]      ; rsi = array[rbx]
    xor rax, rax                  ; rax = 0 for printf (variadic)
    call printf

    inc rbx
    jmp .loop

.done:
    mov rax, 60                   ; syscall: exit
    xor rdi, rdi
    syscall
