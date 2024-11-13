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
         push        EBX            ; we have to save this since we use it

         mov         ECX, 0x14      ; ecx will countdown from 20 to 0
         xor         EAX, EAX       ; eax will hold the current number
         xor         EBX, EBX       ; ebx will hold the next number
         inc         EBX            ; ebx is originally 1

   ; We need to call printf, but we are using eax, ebx, and ecx.  printf
   ; may destroy eax and ecx so we will save these before the call and
   ; restore them afterwards.
print:   push        EAX            ; save EAX
         push        ECX            ; save ECX

         push        EAX            ; push EAX for the call to printf()
         push        format         ; don't forget the format statement!
         call        _printf        ; call the function from "C"
         add         ESP, 8         ; restore the stack pointer

print2:  push        EAX            ; save EAX because we're calling printf again
         push        newline        ; this is what we're actually printing
         call        _printf
         add         ESP, 8

pop1:    pop         ECX            ; restore the value we saved earlier
         pop         EAX            ; oh yeah, this one, too...

         mov         EDX, EAX       ; save the current number
         mov         EAX, EBX       ; next number is now current
         add         EBX, EDX       ; get the new next number
         dec         ECX            ; count down
jumper:  jnz         print          ; if not done counting, do some more

         pop         EBX            ; restore ebx before returning
         ret

format:  db '%10d', 0x00
newline: db 0x0A, 0x00
