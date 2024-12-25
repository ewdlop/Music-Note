section .data
    msg db 'hey honey', 0xA  ; Message to print with newline character
    len equ $ - msg          ; Length of the message

section .text
    global _start

_start:
    ; Write the message to stdout
    mov eax, 4                ; sys_write system call number
    mov ebx, 1                ; file descriptor 1 (stdout)
    mov ecx, msg              ; pointer to the message
    mov edx, len              ; length of the message
    int 0x80                  ; call kernel

    ; Exit the program
    mov eax, 1                ; sys_exit system call number
    xor ebx, ebx              ; exit code 0
    int 0x80                  ; call kernel
