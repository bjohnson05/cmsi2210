; ------------------------------------------------------
;  filename: twos.nasm
;     to assemble:         nasm -f macho64 twos.nasm
;     to link using gcc:   gcc twos.o -o twos
;     to run on macOS:     ./twos
; ------------------------------------------------------
          global    _main
          extern    _printf
          section   .text
_main: mov        r12, 1              ; pow
       mov        r14, 1000000        ; limit
write: push       rbx                 ; Call stack must be aligned
       mov        rsi, r12            ; second arg is the integer to be output
       lea        rdi, [rel fmtd]     ; First argument is the format string
       call       _printf             ; puts(“%d\n”, r12);
       pop        rbx                 ; fix up stack before returning
       add        r12, r12            ; adding r12 to itself makes the next power
       cmp        r12, r14
       jl         write
       ret                            ; return from c library wrapper to nasm code

          section   .data
fmtd:  db "%d", 0xA, 0
