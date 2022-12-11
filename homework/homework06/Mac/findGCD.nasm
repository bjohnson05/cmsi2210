; ----------------------------------------------------------------------------
; findGCD.nasm
;
; This is a MacOS console program that uses Euclid's algorithm to find the GCD
;  of two numbers and print it out.  The two numbers are obtained from the user
;  read from the keyboard.  The output goes to the console display.
;
; Algorithm:  return (b == 0) ? a : (gcd( b, a % b ))
;
;  rax will be the "a" value and rcx will be the "b" value
;     rdx is the remainder of the division
;
;  to assemble for mac:    nasm -f macho64 findGCD.nasm
;  to link for mac:        gcc findGCD.o -o findGCD
; ----------------------------------------------------------------------------


         global    _main
         extern    _scanf
         extern    _printf
         default   rel

         section   .text
_main:
         sub   rsp, 8                 ; align callstack to a 8 byte boundary

getone:
         lea   rdi,  [message1]       ; load input message to be printed out
         call  _printf

         mov   rsi,  number1          ; address of integer 1 as second param
         lea   rdi,  [formatin]       ; load the format string for two integers into first param
         call  _scanf                 ; scanf("%d %d", &integer1, &integer2);

gettwo:
         lea   rdi,  [message2]       ; load input message to be printed out
         call  _printf

         mov   rsi,  number2         ; move the ADDRESS of integer 2 as third param
         lea   rdi,  [formatin]      ; load the format string for two integers into first param
         call  _scanf                ; scanf("%d %d", &integer1, &integer2);

orderchk:
         xor   rax,  rax            ; zero out rax
         xor   rcx,  rcx            ;   this one, too...
         mov   rax,  [number1]      ; get first number "a"
         mov   rcx,  [number2]      ; get second number "b"
         cmp   rax,  rcx            ; check if 'a' == 'b'
         je    end                  ;  if it is, nothing to do
         jb    swap                 ; if rcx > rax swap 'em
         jmp   top                  ; all good, skip next part

swap:
         xchg  rax,  rcx            ; swap 'em

top:
         xor   rdx,  rdx            ; set up edx for remainders
         idiv  rcx                  ; rax now rax/ebx, rmndr in edx
         test  rdx,  rdx            ; if rmndr==0, we're done
         je    end
         mov   rax,  rcx            ; else, put dividend 'b' in divisor 'a'
         mov   rcx,  rdx            ;  then rmndr becomes divisor 'b'
         jmp   top                  ;  and go again

end:
         mov rsi, rcx               ; going to print out value of number2
         lea rdi, [formatout]       ; format string as first param
         call _printf               ; printf("GCD: %d\n", number2);

         add rsp, 8                 ; fix up callstack before leaving
         mov rax, 0                 ; no error
         ret                        ; return from c library wrapper

         section     .data
message1:   db    0x0A, "   Enter the first number: ", 0
message2:   db    0x0A, "   Enter the second number: ", 0
formatin:   db    "%d", 0
formatout:  db    0x0A, 0x0A, "   GCD is: %10d", 0x0A, 0x0A, 0

         section     .bss
number1:    resb    8
number2:    resb    8
