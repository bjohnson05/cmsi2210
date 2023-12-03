; ----------------------------------------------------------------------------
; paritygen.nasm
;
; This is a Win32 console program that counts the bits in a 32-bit value and
;  prints a "1" if a parity bit should be set to maintain "odd" parity, and
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
         mov         eax,   [number]
         mov         ebx,   0x00000001
         mov         ecx,   [counter]
         xor         edx,   edx
         and         eax,   ebx
         cmp         eax,   0x00000000
         jne         count

top2:
         mov         eax,   [number]
         shl         ebx,   1
         and         eax,   ebx
         cmp         eax,   0x00000000
         jne         count
         dec         ecx
         cmp         ecx,   0x00000000
         jne         top2
         jmp         result

count:
         inc         edx
         dec         ecx
         cmp         ecx,   0x00000000
         jne         top2

result:
         and         edx,   0x00000001
         cmp         edx,   0x00000001
         jne         print1

print0:
         push        format0
         call        _printf
         pop         ebx
         ret                              ; done
print1:
         push        format1
         call        _printf
         pop         ebx
         ret                              ; done

         section     .data
counter: db          32                   ; for 32 bits
number:  dd          12345678                 ; '1234' should produce a '0'
                                          ; '1235' should produce a '1'
format0: db          0xA, 0xA, '  Parity bit: 0', 0xA, 0xA, 0
format1: db          0xA, 0xA, '  Parity bit: 1', 0xA, 0xA, 0

