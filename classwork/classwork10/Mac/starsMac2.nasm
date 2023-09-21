; ----------------------------------------------------------------------------------------
; This is a Mac OSX console program that writes a little triangle of asterisks to
;     standard output. THIS RUNS ON MACOS ONLY.
;  Note that this version uses the "C" library "printf()" method so we use "gcc".
;
;  to assemble:   nasm -fmacho64 starsMac2.nasm
;  to link:       gcc starsMac2.o -o starsMac2
;  to run:        ./starsMac2
; ----------------------------------------------------------------------------------------

          global    _main
          extern    _printf
          default   rel

          section   .text

_main:
          push      rbx
          mov       rdx, output        ; rdx holds address of next byte to write
          mov       r8, 1              ; initial line length
          mov       r9, 0              ; number of stars written on line so far

line:
           mov       byte [rdx], '*'    ; load a single star
          inc       rdx                ; advance pointer to next cell to write
          inc       r9                 ; "count" number so far on line
          cmp       r9, r8             ; did we reach the number of stars for this line?
          jne       line               ; not yet, keep writing on this line

lineDone:
          mov       byte [rdx], 10     ; write a new line char
          inc       rdx                ; and move pointer to where next char goes
          inc       r8                 ; next line will be one char longer
          mov       r9, 0              ; reset count of stars written on this line
          cmp       r8, maxlines       ; wait, did we already finish the last line?
          jng       line               ; if not, begin writing this line

done:
          mov      rsi, output         ; load the output string of stars
          lea      rdi, [format]       ; load the "NO" message format
          call     _printf             ; print it out

quit:
          pop      rbx                 ; restore rbp before returning
          ret                          ; WE'RE DUNNE

          section   .data
format:   db        0x0A, '%s', 0x0A, 0x0A, 0x00

          section   .bss
maxlines  equ       8                  ; maximum number of lines
dataSize  equ       44                 ; size of the data
output:   resb      dataSize           ; define an area of 'dataSize' bytes
