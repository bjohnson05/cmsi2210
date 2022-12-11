; ----------------------------------------------------------------------------
; gcdFinder.nasm
;
; This is a macOS console program that uses Euclid's algorithm to find the GCD
;  of two numbers and return it to the caller.  The two numbers are passed as
;  arguments.
;
; Algorithm:  return (b == 0) ? a : (gcd( b, a % b ))
;
;  rax will be the "a" value and rcx will be the "b" value
;
;  to assemble for windows:   nasm -f win32 findGCD.nasm
;  to link for win32:         gcc -m32 findGCD.obj -o findGCD.exe
; ----------------------------------------------------------------------------

         global    _gcdFinder
         default   rel

         section   .text

_gcdFinder:
         mov [integer1], rdi     ; 1st param in rdi from calling c function
         mov [integer2], rsi     ; 2nd param in rsi from calling c function

gcd:
         cmp qword [integer1], 0 ; qword is 64 bit
         je  end                 ; if integer1 = 0, integer2 is result
                                 ;  else, gcdFinder( b % a, a );
mod:
         mov rax, [integer2]     ; rax holds value of integer2 to be modded
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

end:
         mov rax, [integer2]     ; load value of integer2 into rax to be returned
         ret                     ; return to calling c


         section   .bss

integer1:   resb 8               ; 64-bit integer = 8 bytes
integer2:   resb 8
