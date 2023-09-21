; ----------------------------------------------------------------------------------------
; This is a Windows console program that writes a little triangle of asterisks to
;     standard output. THIS RUNS ON WINDOWS ONLY.
;
;  to assemble:   nasm -fwin32 starsPC.nasm
;  to link:       gcc -m32 starsPC.obj -o starsPC.exe
;  to run:        starsPC
; ----------------------------------------------------------------------------------------

            global    _main
            extern    _puts
            default   rel

            section   .text
_main:
         push     EBX
         mov      EDX, output       ; rdx holds address of next byte to write
         mov      EAX, 1            ; initial line length
         mov      ECX, 0            ; number of stars written on line so far

line:
         mov      byte [EDX], '*'   ; load a single star
         inc      EDX               ; advance pointer to next cell to write
         inc      ECX               ; "count" number so far on line
         cmp      EAX,  ECX         ; did we reach the number of stars for this line?
         jne      line              ; not yet, keep writing on this line

lineDone:
         mov      byte [EDX], 10    ; write a newline char
         inc      EDX               ; and move pointer to where next char goes
         inc      EAX               ; next line will be one char longer
         mov      ECX,  0           ; reset count of stars written on this line
         cmp      EAX,  maxlines    ; wait, did we already finish the last line?
         jng      line              ; if not, begin go do the next line

done:
         push     output
         call     _puts             ; invoke operating system to do the write

quit:
         pop      EBX
         ret

               section   .bss
maxlines:   equ       8             ; maximum number of lines
dataSize:   equ       44            ; size of the data
output:     resb      dataSize      ; define an area of 'dataSize' bytes
