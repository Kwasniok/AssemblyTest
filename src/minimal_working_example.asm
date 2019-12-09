; target: MAC OS 10.7 or higher, MACH-O (32 bit)
; description: smallest working programm which simply exits via sys_exit

section .text
global start
start:
    push    dword 0                 ; push exit status
    sub     esp, 12                 ; align stack (to 16 bytes)
    mov     eax, 1                  ; store opcode for sys_exit
    int     0x80                    ; perform system call
