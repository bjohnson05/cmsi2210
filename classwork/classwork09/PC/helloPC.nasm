; helloPC.nasm
; writes "hello world" to the console
; uses "printf()" function from C library
;  this is because on 64-bit windows they no longer
;     support the DOS interrupts directly
; assemble with:  nasm -fwin32 helloPC.nasm
;     link with:  gcc -m32 helloPC.obj -o helloPC.exe
;      run with:  helloPC

    global  _main
    extern  _printf

    section .text
_main:
    push    ebx
    push    message
    call    _printf
    add     esp, 4
    pop     ebx
    ret
message:
    db  0x0A, 0x0A, 0x20, 0x20, 0x20, 'Hello, World', 0x0A, 0x0A, 0x00
