; ----------------------------------------------------------------------------
; findGCD.nasm
;
; This is a Win32 console program that uses Euclid's algorithm to find the GCD
;  of two numbers and print it out.  The two numbers are 3113041662 and 11570925
;  which are read from the keyboard.  The output goes to the console display.
;
; Algorithm:  return (b == 0) ? a : (gcd( b, a % b ))
;
;  eax will be the "a" value and ecx will be the "b" value
;
;  to assemble for windows:   nasm -f win32 findGCD.nasm
;  to link for win32:         gcc -m32 findGCD.obj -o findGCD.exe
; ----------------------------------------------------------------------------

         global      _main
         extern      _printf
         extern      _scanf

         section     .text
_main:
         push        ebx               ; we have to save this since we use it

getone:
         push        message1          ; message to get first number
         call        _printf
         add         esp,  4           ; remove parameters from stack

         push        number1           ; address of first number "a"
         push        formatin          ; input format string to scanf()
         call        _scanf            ; value returned in location "number1"
         add         esp,  8           ; remove parameters from stack

gettwo:
         push        message2          ; message to get first number
         call        _printf
         add         esp,  4           ; remove parameters from stack

         push        number2           ; address of second number "b"
         push        formatin          ; input format string to scanf()
         call        _scanf            ; value returne in location "number2"
         add         esp,  8           ; remove parameters from stack

calc:
         xor         eax,  eax         ; zero out eax
         xor         ecx,  ecx         ;  this one, too...
         mov         eax,  [number1]   ; get first number "a"
         mov         ecx,  [number2]   ; get second number "b"
         cmp         eax,  ecx         ; check if 'a' == 'b'
         je          end               ;  if it is, nothing to do
         jb          swap              ; if ebx > eax swap 'em
         jmp         top               ; all good, skip next part
swap:
         xchg        eax,  ecx         ; swap 'em
top:
         xor         edx,  edx         ; set up edx for remainders
         idiv        ecx               ; eax now eax/ebx, rmndr in edx
         test        edx,  edx         ; if rmndr==0, we're done
         je          end
         mov         eax,  ecx         ; else, put dividend 'b' in divisor 'a'
         mov         ecx,  edx         ;  then rmndr becomes divisor 'b'
         jmp         top               ;  and go again

end:
         mov         eax,  ecx         ; put GCD into eax
         push        eax               ; load value of "a"
         push        formatout         ; load format for output
         call        _printf           ; print it out
         add         esp,  8           ; remove parameters from stack
         ret

         section     .data
message1:   db    "   Enter the first number: ", 0
message2:   db    "   Enter the second number: ", 0
formatin:   db    "%d", 0
formatout:  db    0x0A, 0x0A, "   GCD is: %10d", 0x0A, 0x0A, 0

number1:    dd    0
number2:    dd    0
