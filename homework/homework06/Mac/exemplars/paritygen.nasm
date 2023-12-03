; ----------------------------------------------------------
; Anacan Mangelsdorf and Maya Epps
; Homework 6, problem 3
; run for mac:  nasm -f macho64 paritygen.nasm
;               gcc paritygen.o -o paritygen
;               ./paritygen
; thanks to https://stackoverflow.com/questions/49116747/assembly-check-if-number-is-even/49116885
; ----------------------------------------------------------

            global       _main

            extern       _printf
            default      rel

             section     .data
number:      dq          0b00001111        ; should result in a 1
format:      db          "Parity bit: %d", 10, 0

             section     .text
_main:       sub         rsp, 8            ; align stack pointer to 16 bytes
             mov         rax, 1            ; load the bitmask
             mov         rcx, 0            ; number of 1s seen so far

countOnes:
             mov         rbx, [number]     ; load the number
             and         rbx, rax          ; put the the current bit in rbx
             jz          bitZero           ; add 1 to the ones count if it's not a 0
             inc         rcx
bitZero:     cmp         rax, 0x80         ; check if we're at the end of the byte
             je          result
             shl         rax, 1            ; otherwise shift the bitmask left
             jmp         countOnes         ; and go again!

result:      test        rcx, 1            ; tests whether the last bit of rcx is even or odd & sets flag
             jz          even              ; flag indicates it's even
             jnz         odd               ; flag indicates it's odd

even:         mov         rsi, 1           ; prepare to print 1 since there are an odd # of 1s
             jmp         print

odd:        mov         rsi, 0             ; prepare to print 0 since there are an even nnumber of 1s
             jmp         print

print:       lea         rdi, [format]     ; print the correct parity bit
             call        _printf
             jmp         end

end:         mov         rax, 0x02000001   ; system call for exit
             xor         rdi, rdi          ; exit code 0
             add         rsp, 8            ; fixing up the stack pointer from earlier
             syscall