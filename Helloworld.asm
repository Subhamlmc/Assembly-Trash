;Goal of this program is to print hello world in nasm x86_64 assembler
extern printf
section .data 
    message db "Hello world", 10,0 ; 0 is the null terminator and 10 = new line in ascii
section .text
global main 
main :
    lea rdi, [rel message]
    xor rax, rax   ; default print caller
    call printf

    mov rsi, 60
    xor rax, rax ; exit code 0 ------ In linux shell termianl do echo $? after the program executes , it shows 0 which means it worked !!
    syscall
