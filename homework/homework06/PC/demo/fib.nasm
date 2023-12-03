; ----------------------------------------------------------------------------
; fib.nasm
;
; This is a Win32 console program that writes the first 10 Fibonacci numbers.
;  The numbers are each output on a separate line, in a 10-space wide field.
; It needs to be linked with a C library.
;
;  to assemble for windows:         nasm -f win32 fib.nasm
;  to link for win32 under win64:   gcc -m32 fib.obj -o fib.exe
; ----------------------------------------------------------------------------

         global      _main
         extern      _printf

         section     .text
_main:
         push        ebx         ; we have to save this since we use it

         mov         ecx, 10     ; ecx will countdown from 10 to 0
         xor         eax, eax    ; eax will hold the current number
         xor         ebx, ebx    ; ebx will hold the next number
         inc         ebx         ; ebx is originally 1

   ; We need to call printf, but we are using eax, ebx, and ecx.  printf
   ; may destroy eax and ecx so we will save these before the call and
   ; restore them afterwards.
print:   push        eax
         push        ecx

         push        eax
         push        format
         call        _printf
         add         esp, 8

         push        eax
         push        newline
         call        _printf
         add         esp, 8

         pop         ecx
         pop         eax

         mov         edx, eax    ; save the current number
         mov         eax, ebx    ; next number is now current
         add         ebx, edx    ; get the new next number
         dec         ecx         ; count down
         jnz         print       ; if not done counting, do some more

         pop         ebx         ; restore ebx before returning
         ret

format:  db '%10d', 0
newline: db 10, 0
