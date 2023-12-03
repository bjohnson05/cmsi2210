; ----------------------------------------------------------------------------
; makeNBO.nasm
;
; This is a Mac 64-bit console program that calls a "C" function to swap the
;   bytes in a number by calling an external function.  The function is called
;   with a value passed to it, then the returned value is printed using a call
;   to the "C" function "printf".
;
;  to assemble for mac:   nasm -f macho64 makeNBO.nasm
;  to link for mac:       gcc makeNBO.o makeNBOC.o -o makeNBO
; ----------------------------------------------------------------------------
         global _main
         extern _printf
         extern _makeBigEndian64
         default rel


         section .text

_main:
         push    rbp

test1:
         mov     rsi, 0x1234567898765432
         lea     rdi, [original]
         call    _printf
         xor     rdi, rdi
         mov     rdi, 0x1234567898765432
         call    _makeBigEndian64
         mov     rsi, rax
         lea     rdi, [format]
         call    _printf

test2:
         mov     rsi, 0xABCDEF01ABCDEF98
         lea     rdi, [original]
         call    _printf
         xor     rdi, rdi
         mov     rdi, 0xABCDEF01ABCDEF98
         call    _makeBigEndian64
         mov     rsi, rax
         lea     rdi, [format]
         call    _printf

test3:
         mov     rsi, 0x1011121314151617
         lea     rdi, [original]
         call    _printf
         xor     rdi, rdi
         mov     rdi, 0x1011121314151617
         call    _makeBigEndian64
         mov     rsi, rax
         lea     rdi, [format]
         call    _printf

test4:
         mov     rsi, 0x01122334455667788
         lea     rdi, [original]
         call    _printf
         xor     rdi, rdi
         mov     rdi, 0x01122334455667788
         call    _makeBigEndian64
         mov     rsi, rax
         lea     rdi, [format]
         call    _printf

test5:
         mov     rsi, 0x8070605040302010
         lea     rdi, [original]
         call    _printf
         xor     rdi, rdi
         mov     rdi, 0x8070605040302010
         call    _makeBigEndian64
         mov     rsi, rax
         lea     rdi, [format]
         call    _printf

         lea     rdi, [newline]
         call    _printf

         pop     rbp
         ret

section .data

format:
         db 0X0A, "   Converted value is: 0x%llx", 0X0A, 0x00
original:
         db 0x0A, "   Original number is: 0x%llx", 0x00
newline:
         db 0X0A, 0x00
