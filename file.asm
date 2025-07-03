section .data
    filename db "testfile", 0          ; Null-terminated file name
    buffer   times 100 db 0             ; 100-byte buffer

section .text
global main

main:
    ; --- open("input.txt", O_RDONLY, 0) ---
    mov     rax, 2                      ; syscall: open
    lea     rdi, [rel filename]         ; filename pointer
    xor     rsi, rsi                    ; flags: O_RDONLY = 0
    xor     rdx, rdx                    ; mode: not used here
    syscall
    mov     r12, rax                    ; save file descriptor

    ; --- read(fd, buffer, 100) ---
    mov     rdi, rax                    ; fd from open()
    lea     rsi, [rel buffer]           ; buffer pointer
    mov     rdx, 100                    ; number of bytes to read
    mov     rax, 0                      ; syscall: read
    syscall
    mov     r13, rax                    ; save number of bytes read

    ; --- write(1, buffer, r13) ---
    mov     rax, 1                      ; syscall: write
    mov     rdi, 1                      ; stdout (fd = 1)
    lea     rsi, [rel buffer]           ; buffer to print
    mov     rdx, r13                    ; number of bytes to write
    syscall

    ; --- close(fd) ---
    mov     rax, 3                      ; syscall: close
    mov     rdi, r12                    ; file descriptor
    syscall

    ; --- exit(0) ---
    mov     rax, 60                     ; syscall: exit
    xor     rdi, rdi                    ; status = 0
    syscall
