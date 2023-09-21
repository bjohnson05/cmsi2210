

    global  _main
    extern  _printf

    section .text
_main:
    push    message
    call    _printf
    add     esp, 4
    ret
message:
    db  0x0A, 0x0A, 0x20, 0x20, 0x20, 'Hello, World', 0x0A, 0x0A, 0x00
