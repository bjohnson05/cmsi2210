;----------------------------------------------------------------------------
; isleapMac.nasm
;
; This is a MacOS console progam that determines if a year is a leap year or
;  not.  If it is, it outputs a yes message, and if not it outputs a no.
; For purposes of the in-class exercise, the year will be hard-coded as 1920.
; The program needs to be linked with a C library to use "printf()"
; The process is mod by 4, then by 100, then by 400
;     return ((((y % 4 == 0) && (y % 100 != 0)) || Y % 400 == 0));
;
;  to assemble for Mac: nasm -f macho64 isleapMac.nasm
;  to link for Mac:     gcc  isleapMac.o -o isleapMac
;  to link for lldb:    gcc -g isleapMac.o -o isleapMac
;----------------------------------------------------------------------------

               global   _main
               extern   _printf
               default  rel

_main:
            push     rbx               ; save this for returning later

begin:
            xor      rax, rax          ; zero out rax
            mov      rax, [year]       ; r12 is the year to investigate
            and      rax, 0x0000FFFF

byfour:
            and      rax, 0x00000003   ; remainder of div by 4 using AND
            cmp      rax, 0x00
            jnz      printno           ; NOPE!

by100:
            xor      rax, rax          ; zero out rax
            mov      rax, [year]       ; r12 is the year to investigate
            and      rax, 0x0000FFFF   ; mask off upper bytes
            cqo                        ; sign extend needed [not sure why]
            mov      rcx, 0x00000064   ; dividing rax by rcx
            xor      rdx, rdx          ; zero out edx where remainder goes
            div      rcx               ; divide by 100, remainder in edx
            cmp      rdx, 0x00         ; check if divided evenly by 100
            jnz      printyes          ; YEP!

by400:
            xor      rax, rax          ; zero out rax
            mov      rax, [year]       ; r12 is the year to investigate
            and      rax, 0x0000FFFF   ; mask off upper bytes
            cqo                        ; sign extend needed [not sure why]
            mov      rcx, 0x00000190   ; to divide by 100
            xor      rdx, rdx          ; zero out edx where remainder goes
            div      rcx               ; divide by 100, remainder in edx
            cmp      rdx, 0x00         ; check if divided evenly by 100
            jnz      printno           ; NOPE!
            jmp      printyes          ; YEP!

printno:
            xor      rax, rax          ; zero out rax
            mov      rax, [year]       ; rax is the year to investigate
            and      rax, 0x0000FFFF   ; mask off upper bytes
            mov      rsi, rax          ; load the year for output
            lea      rdi, [noout]      ; load the "NO" message format
            call     _printf           ; print it out
            jmp      done              ; GIT OUTTA DODGE!

printyes:
            xor      rax, rax          ; zero out rax
            mov      rax, [year]       ; r12 is the year to investigate
            and      rax, 0x0000FFFF   ; mask off upper bytes
            mov      rsi, rax          ; load the year for output
            lea      rdi, [yesout]     ; load the "NO" message format
            call     _printf           ; print it out

done:
            pop      rbx               ; restore rbp before returning
            ret                        ; WE'RE DUNNE


               segment  .data
year:       dw       1920
yesout:     db       0x0A, '   %d IS a leap year', 0x0A, 0x0A, 0x00
yeslen      equ      $-yesout
noout:      db       0x0A, '   %d is NOT a leap year', 0x0A, 0x0A, 0x00
nolen       equ      $-noout
