; ----------------------------------------------------------------------------
; paritygen.nasm
;
; This is a MacOS console program that counts the bits in a 32-bit value and
;  prints a "1" if a parity bit should be set to maintain "odd" parity, and
;  will print a "0" otherwise.  The number value will be allowed to be
;  hard-coded into the program for this exercise.
;
;  to assemble for MacOS:  nasm -f macho64 paritygen.nasm
;  to link for MacOS:      gcc paritygen.o -o paritygen
; ----------------------------------------------------------------------------

         global      _main
         extern      _printf
         default     rel

         section     .text

_main:
         sub         rsp, 8               ; align stack pointer to 16 bytes

top1:
         mov         rax,   [number]      ; load number into rax
         mov         rbx,   0x00000001    ; load mask into rbx
         mov         rcx,   0x00000020    ; load countdown value
         xor         rdx,   rdx           ; clear rdx
         and         rax,   rbx           ; check LSB
         cmp         rax,   0x00000000    ; check if there's a '1'
         jne         count

top2:
         mov         rax,   [number]      ; reload number
         shl         rbx,   1             ; move mask one bit left
         and         rax,   rbx           ; check next
         cmp         rax,   0x00000000    ; check if there's a '1'
         jne         count                ; increment bit counter
         dec         rcx                  ; one less position
         cmp         rcx,   0x00000000    ; done yet?
         jne         top2                 ; NOPE, go again
         jmp         result

count:
         inc         rdx                  ; counted a bit
         dec         rcx                  ; one less position
         cmp         rcx,   0x00000000    ; done yet?
         jne         top2                 ; NOPE, go again

result:
         and         rdx,   0x00000001
         cmp         rdx,   0x00000001    ; check if odd or even
         jne         print1

print0:
         mov        rsi,   [number]       ; for displaying the number
         lea        rdi,   [format0]
         call       _printf
         add        rsp,  8               ; restore the stack
         ret                              ; done

print1:
         mov        rsi,   [number]       ; for displaying the number
         lea        rdi,   [format1]      ; print the correct parity bit
         call       _printf               ; display a '1'
         add        rsp,  8               ; restore the stack
         ret                              ; done

         section    .data
counter: db         32                    ; for 32 bits
number:  dw         2468                  ; '1234' should produce a '0'
                                          ; '1235' should produce a '1'
                                          ; '2468' should produce a '0'
                                          ; '12345' should produce a '1'
format0: db         0xA, 0xA, '  Parity bit: 0 for number %x.', 0xA, 0xA, 0x00
format1: db         0xA, 0xA, '  Parity bit: 1 for number %x.', 0xA, 0xA, 0x00

