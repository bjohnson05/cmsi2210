; ------------------------------------------------------------------
;  filename: powersMac.nasm
;     to assemble:         nasm -f macho64 powersMac.nasm
;     to link using gcc:   gcc powersMac.o -o powersMac
;     to run on macOS:     ./powersMac [some Macs just 'powersMac']
; ------------------------------------------------------------------
         global      _main
         extern      _printf
         section     .text
         default     rel

_main:   mov        r14, 1              ; pow
         mov        r15, 1000000        ; limit
         push       rbx                 ; save this for returning later

output:  mov        rsi, r14            ; second arg is the integer to be output
         lea        rdi, [format]       ; first argument is the format string
         call       _printf             ; puts(“%d\n”, r12);
         add        r14, r14            ; adding r12 to itself makes the next power
         cmp        r14, r15
         jl         output

         pop        rbx                 ; fix up stack before returning
         ret                            ; return from c library wrapper to nasm code

          section   .data
format:  db    "%10d", 0xA, 0
