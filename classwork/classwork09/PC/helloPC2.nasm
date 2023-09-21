; hello world program using DOS interrupt 21h
; used to be int 80h but discovered that is Linux
; uses interrupt 21h function 09h
; assemble with:  nasm -fwin32 helloPC2.nasm
;     link with:  gcc -m32 helloPC.obj -o helloPC.exe
;      run with:  helloPC

; Define variables in the data section
; Code goes in the text section
            section  .text
            global   _main

;_main:
;            mov      ah,   0x09
;            lea      dx,   hello
_main:      mov      eax,  0x00000900   ; 'write string' system call
            mov      ebx,  1            ; file descriptor 1 = STDOUT
            mov      ecx,  hello        ; string to write
            mov      edx,  helloLen     ; length of string to write
            int      21h                ; call the BIOS interrupt

; Terminate program
            mov      eax,  1            ; 'exit' system call
            mov      ebx,  0            ; exit with error cod
            int      80h                ; call the BIOS interrupt

            section  .data
;hello:      db       0x0A, 0x0A, 0x20, 0x20, 0x20, 'Hello, World', 0x0A, 0x0A, 0x00
hello:      db     '   Hello, world!', 0x0D, 0x0A, '$'
helloLen:   equ      $-hello
