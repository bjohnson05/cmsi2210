; ----------------------------------------------------------------------------------------
;  filename: findGCD.nasm
;  Authors: Maya Epps and Anacan Mangelsdorf
;     to assemble:         nasm -f macho64 findGCD.nasm
;     to link using gcc:   gcc findGCD.o -o findGCD
;     to run on macOS:     ./findGCD
;     thanks to https://stackoverflow.com/questions/8021772/assembly-language-how-to-do-modulo for modulo help
; ----------------------------------------------------------------------------------------

          global    _main
          extern    _scanf
          extern    _printf
          default   rel

          section   .text
_main:    ; go straight to input
input:    sub rsp, 8              ; align callstack to a 16 byte boundary

          lea rdi, [inputMessage] ; load input message to be printed out
          call _printf

                                  ; NOTE: addresses are used here so scanf can directly
                                  ; load integers from stdin into labels
          mov rdx, integer2       ; move the ADDRESS of integer 2 as third param
          mov rsi, integer1       ; address of integer 1 as second param
          lea rdi, [inputFmt]     ; load the format string for two integers into first param
          call _scanf             ; scanf("%d %d", &integer1, &integer2);

gcd:      cmp qword [integer1], 0 ; qword is 64 bit
          je  end                 ; if integer1 = 0, integer2 is result
                                  ; else, gcd(b % a, a);
mod:      mov rax, [integer2]     ; rax holds value of integer2 to be modded
          xor rdx, rdx            ; clear the destination for remainder

          cqo                     ; sign-extend into RDX, in this case = -1 = 0xFF...FF
                                  ; NOTE: i do not exactly understand why this is necessary.

          mov  rcx, [integer1]    ; divisor is integer1
          idiv rcx                ; Signed division of rax / rcx, i.e. integer2 / integer1
                                  ; remainder (not modulus) is stored now in rdx
          mov r12, [integer1]     ; temp(r12) = integer1
          mov [integer1], rdx     ; integer1 = result of modulus
          mov [integer2], r12     ; integer2 = temp
          jmp gcd                 ; recurse back to gcd

end:      mov rsi, [integer2]     ; going to print out value of integer2
          lea rdi, [outputFmt]    ; format string as first param
          call _printf            ; printf("GCD: %d\n", integer2);

          add rsp, 8              ; fix up callstack before leaving
          mov rax, 0              ; no error
          ret                     ; return from c library wrapper


          section   .data
inputMessage: db "Please input two numbers, separated by a space: ", 0
inputFmt:     db "%d %d", 0
outputFmt:    db "GCD: %d", 10, 0

          section   .bss
integer1:     resb 8 ; 64-bit integer = 8 bytes
integer2:     resb 8
