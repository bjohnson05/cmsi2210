; ----------------------------------------------------------
; fib64Mac.nasm
;
; This is a 64-bit Mac terminal program that writes the first
;  10 Fibonacci numbers.  The numbers are each output on a
;  separate line, in a 10-space wide field.
; It needs to be linked with a C library.
;
;  Assemble for Mac:    nasm -f macho64 fib64.nasm
;  Link for Mac O/S:    gcc  fib6Mac.o -o fib64Mac
; ----------------------------------------------------------

            global      _main
            extern      _printf
            default     rel

            section     .text
_main:
         push        rbx         ; must save rbx since we use it

         mov         rcx, 10     ; rcx will countdown from 10 to 0
         xor         rax, rax    ; rax will hold the current number
         xor         rbx, rbx    ; rbx will hold the next number
         inc         rbx         ; rbx is originally 1

   ; We need to call printf, but we are using eax, ebx, and ecx.
   ; 'printf' may destroy eax and ecx so we will save these
   ; before the call and restore them afterwards.
print1:
         push        rax         ; save rax
         push        rcx         ; save rcx

print2:
         lea         rdi, [rel format]
         mov         rsi,  rax   ; this is the number we output
         call        _printf     ; GIT 'ER DUNNE

print3:
         pop         rcx         ; restore rcx value [for loop]
         pop         rax         ; restore rax value [for next #]

   ; This section calculates the next Fibonacci number and loops
   ;  if we're not to the end of all ten numbers.
next:
         mov         rdx, rax    ; save the current number
         mov         rax, rbx    ; next number is now current
         add         rbx, rdx    ; get the new next number
         dec         rcx         ; count down
         jnz         print1      ; if not done, do some more

         pop         rbx         ; restore ebx before returning
         ret

            section .data
format:  db '%10d', 0x0A, 0x00

