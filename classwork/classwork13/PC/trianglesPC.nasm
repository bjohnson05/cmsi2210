   ; ----------------------------------------------------------------------------------------
   ; This is a Mac OSX console program that writes a little triangle of asterisks to
   ;     standard output. THIS RUNS ON MACOS ONLY.  Windows version is TBD.
   ;
   ;  to assemble:   nasm -fmacho64 trianglesMac.nasm
   ;  to link:       ld -macosx_version_min 10.6 -no_pie trianglesMac.o -o triangles
   ;  to run:        ./triangles
   ; ----------------------------------------------------------------------------------------

             global    start

             section   .text
   start:    mov       rdx, output        ; rdx holds address of next byte to write
             mov       r8, 1              ; initial line length
             mov       r9, 0              ; number of stars written on line so far
   line:     mov       byte [rdx], '*'    ; write single star
             inc       rdx                ; advance pointer to next cell to write
             inc       r9                 ; "count" number so far on line
             cmp       r9, r8             ; did we reach the number of stars for this line?
             jne       line               ; not yet, keep writing on this line
   lineDone: mov       byte [rdx], 10     ; write a new line char
             inc       rdx                ; and move pointer to where next char goes
             inc       r8                 ; next line will be one char longer
             mov       r9, 0              ; reset count of stars written on this line
             cmp       r8, maxlines       ; wait, did we already finish the last line?
             jng       line               ; if not, begin writing this line
   done:     mov       rax, 0x02000004    ; system call for write
             mov       rdi, 1             ; file handle 1 is stdout
             mov       rsi, output        ; address of string to output
             mov       rdx, dataSize      ; number of bytes
             syscall                      ; invoke operating system to do the write
             mov       rax, 0x02000001    ; system call for exit
             xor       rdi, rdi           ; exit code 0
             syscall                      ; invoke operating system to exit

             section   .bss
   maxlines  equ       8                  ; maximum number of lines
   dataSize  equ       44                 ; size of the data
   output:   resb      dataSize           ; define an area of 'dataSize' bytes
