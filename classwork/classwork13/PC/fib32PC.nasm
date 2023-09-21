; ----------------------------------------------------------
; fib.nasm
;
; This is a Win32 console program that writes the first 10
;  Fibonacci numbers.  The numbers are each output on a
;  separate line, in a 10-space wide field.
; It needs to be linked with a C library.
;
;  Assemble for windows:         nasm -f win32 fib.nasm
;  Link for win32 under win64:   gcc -m32 fib.obj -o fib.exe
; ----------------------------------------------------------

            global      _main
            extern      _printf

            section     .text
_main:
         push        ebx         ; must save ebx since we use it

begin:
         mov         ecx, 10     ; ecx will countdown from 10 to 0
         xor         eax, eax    ; eax will hold the current number
         xor         ebx, ebx    ; ebx will hold the next number
         inc         ebx         ; ebx is originally 1

   ; We need to call printf, but we are using eax, ebx, and ecx.
   ; 'printf' may destroy eax and ecx so we will save these
   ; before the call and restore them afterwards.
print:
         push        eax         ; save eax
         push        ecx         ; save ecx

         push        eax         ; this is the number we output
         push        format      ;  using this format specifier
         call        _printf     ; GIT 'ER DUNNE
         add         esp, 8      ; restore the stack pointer

   ; This section outputs a "\n" to make sure each number is on
   ;  its own line of the display
crlf:
         push        eax         ; save current value again
         push        newline     ; new format, just '\n'
         call        _printf     ; GIT 'ER DUNNE
         add         esp, 8      ; restore the stack pointer

         pop         ecx         ; restore ecx value (for loop)
         pop         eax         ; restore eax value {for next #)

   ; This section calculates the next Fibonacci number and loops
   ;  if we're not to the end of all ten numbers.
next:
         mov         edx, eax    ; save the current number
         mov         eax, ebx    ; next number is now current
         add         ebx, edx    ; get the new next number
         dec         ecx         ; count down
         jnz         print       ; if not done, do some more

done:
         pop         ebx         ; restore ebx before returning
         ret

            section .data
format:  db    '%10d', 0X00
newline: db    0x0A, 0x00
