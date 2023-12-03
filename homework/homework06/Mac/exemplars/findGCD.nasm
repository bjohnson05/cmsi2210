; ----------------------------------------------------------------------------------------
;  filename: findGCD.nasm
;  Authors: Maya Epps and Anacan Mangelsdorf
;     to assemble:         nasm -f macho64 findGCD.nasm
;     thanks to https://stackoverflow.com/questions/8021772/assembly-language-how-to-do-modulo for modulo help
; ----------------------------------------------------------------------------------------

          global    _findGCD
          default   rel

          section   .text
_findGCD: mov [integer1], rdi     ; first param in rdi from calling c function
          mov [integer2], rsi     ; second param in rsi from calling c function

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

end:      mov rax, [integer2]     ; load value of integer2 into rax to be returned
          ret                     ; return to calling c
          

          section   .bss
integer1:     resb 8 ; 64-bit integer = 8 bytes
integer2:     resb 8