;
; filename: powersPC.nasm
; purpose: demostrate assembly code on windows
; author: Dr. Johnson
; date: 2024-10-20
;
; in this program, eax will be the output value
;     ebx will be current value
;     'maxcount' will hold 1,000,000
;     we use 'printf()' from the "C" library for output
;
;  assemble with: nasm -fwin32 powersPC.nasm -o powersPC.obj
;  link with: gcc -m32 powersPC.obj -o powersPC.exe
;

            global   _main
            extern   _printf
            default  rel

            section .text
_main:
            push  ebx                  ; save base pointer for return

init:
            mov   eax,  1              ; load a one to start
            mov   ebx,  eax            ; save it for later
top:
            mov   eax,  ebx
            push  eax                  ; save value to print
            push  format
            call  _printf
            add   esp,  8              ; pop the stack

            add   ebx,  ebx
            cmp   ebx,  [rel maxcount] ; check if we're done
            jle   top                  ; we're not! go again

quit:
            pop   ebx                  ; restore base pointer for return
            ret

         section .data
format:     db       "%9d", 0x0A, 0x00
maxcount:   dd       0x000F4240        ; hex for 1,000,000
