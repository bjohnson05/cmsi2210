
            global   _main
            extern   _printf

; Code goes in the text section
            section  .text

_main:
            push     ebx                  ; save this one

begin:
            push     whoami               ; output startup message
            call     _printf
            add      esp,  8              ; pop the stack
            mov      eax,  1

            mov      eax,  1              ; load a one to start
            mov      ebx,  eax            ; save it for later

top:
            mov      eax,  ebx
            push     eax                  ; save value to print
            push     format
            call     _printf
            add      esp,  8              ; pop the stack

            add      ebx,  ebx
            cmp      ebx,  [rel maxcount] ; check if we're done
            jle      top                  ; we're not! go again

; Terminate program
            pop      ebx                  ; restore this one
            ret

; Define variables in the data section
            section  .data
maxcount:   dd       1000000
whoami:     db       0xA, 'Powers of two less than 1,000,000:', 0XA, 0XA, 0
format:     db       "   %d", 0x0A, 0

