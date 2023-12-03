; ----------------------------------------------------------
; Anacan Mangelsdorf and Maya Epps
; Homework 6, problem 6
; run for mac:  nasm -f macho64 makeNBO.nasm
;               gcc makeNBOC.c -c -o makeNBOC.o
;               gcc makeNBO.o makeNBOC.o -o makeNBO
;               ./makeNBO
; ----------------------------------------------------------

             global      _main

             extern      _makeNBO, _printf, _printU32
             default     rel

             section     .text
_main:       mov         r12,  0            ; number of elements converted so far
             mov         r13,  arr          ; r13 will point to current value     

             sub         rsp, 8             ; align callstack
             lea         rdi, [startFmt]    ; print newline at start
             call        _printf

iter:        cmp         r12, 6             ; if we've computed all six values, we're done
             je          end
             mov         rdi, [r13]         ; load current value into first param 
             call        _makeNBO           ; call makeNBO and put result in eax

             mov         rsi, 0             ; clear the rsi register so the bottom 32 bits (esi) can be loaded in
             mov         esi, eax           ; load result of makeNBO into second param
             mov         rdi, [r13]         ; load unconverted value to first param for printing
             call        _printU32
             ; housekeeping
             inc         r12                ; finished one more value
             add         r13, 8             ; move r13 to point at next value, need to move by eight bytes
             jmp         iter

end:         mov         rax, 0x02000001         ; system call for exit
             add         rsp, 8                  ; fixing up the stack pointer from earlier
             xor         rdi, rdi                ; exit code 0
             syscall
             
             section   .data
startFmt:     db "", 10, 0

arr:
              dq 0x12345678
              dq 0x87654321 
              dq 0x78563412
              dq 0x21111111
              dq 0xFF000011
              dq 0xABCDEF21