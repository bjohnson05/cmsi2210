; ----------------------------------------------------------------------------
; paritygen.nasm
;
; This is a Win32 console program that counts the bits in a 32-bit value and
;  prints a "1" if a parity bit would be set to indicate "odd" parity, and
;  will print a "0" otherwise.  The number value will be allowed to be
;  hard-coded into the program for this exercise.
;
;  to assemble for win32:  nasm -f win32 paritygen.nasm
;  to link for win32:      gcc -m32 paritygen.obj -o paritygen.exe
; ----------------------------------------------------------------------------

         global      _main
         extern      _printf

         section     .text

_main:
         push        ebx                  ; we have to save this since we use it

top1:
         mov         eax,  [number]       ; load the number
         mov         ebx,  0x00000001     ; mask starts at 1
         mov         ecx,  0x00000020     ; load count down for 32 bits
         xor         edx,  edx            ; clear register where we keep count
         and         eax,  ebx            ; and with mask
         cmp         eax,  0x00000000     ; see if it's not set
         jne         count                ; YEP!  count it

top2:
         mov         eax,  [number]       ; re-load eax with number
         shl         ebx,  1              ; shift the mask over 1 bit
         and         eax,  ebx            ; and with mask again
         cmp         eax,  0x00000000     ; see if it's not set
         jne         count                ; YEP!  count it
         dec         ecx                  ; NOPE! just move the counter down
         cmp         ecx,  0x00000000     ; are we done?
         jne         top2                 ; nope, go again
         jmp         result               ;  [don't count and go again]

count:   inc         edx                  ; add one more bit
         dec         ecx                  ; knock one bit off the loop count
         cmp         ecx,  0x00000000     ; are we done?
         jne         top2                 ; nope, go again

result:
         and         edx,  0x00000001     ; mask off the LSB to see
         cmp         edx,  0x00000001     ;  the value is even or odd
         jne         print1               ; if even, print a '1'

print0:
         push        format0              ; format for printing '0'
         call        _printf              ; do it
         ret                              ; done
print1:
         push        format1              ; format for printing '0'
         call        _printf              ; do it
         ret                              ; done

         section     .data
counter: db          32                   ; for 32 bits
number:  dw          1235                 ; '1234' should produce a '0'
                                          ; '1235' should produce a '1'
format0: db          0xA, 0xA, '  Parity bit: 0', 0xA, 0xA, 0
format1: db          0xA, 0xA, '  Parity bit: 1', 0xA, 0xA, 0

