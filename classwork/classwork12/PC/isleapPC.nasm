;----------------------------------------------------------------------------
; isleap.nasm
;
; This is a Win32 console progam that determines if a year is a leap year or
;  not.  If it is, it outputs a yes message, and if not it outputs a no.
; For purposes of the in-class exercise, the year will be hard-coded as 1920.
; The program needs to be linked with a C library to use "printf()"
;     The process is mod by 4 == 0, then by 100 != 0;
;        if 1st is true and 2nd is not, then leap year
;        otherwise, mod by 400 == 0 and if true then leap year
;
;     return ((((y % 4 == 0) && (y % 100 != 0)) || Y % 400 == 0));
;
;  to assemble for windows:         nasm -f win32 isleap.nasm
;  to link for win32 under win64:   gcc -m32 isleap.obj -o isleap.exe
;  to link for gdb for win32:       gcc -gdb -m32 isleap.obj -o isleap.exe
;----------------------------------------------------------------------------

               global   _main
               extern   _printf

               section  .text

_main:
            push     ebx               ; we have to save this

begin:
            xor      eax, eax          ; zero out eax
            mov      eax, [year]       ; eax is the year to investigate
            and      eax, 0x0000FFFF   ; mask off upper two bytes of 32-bit

check4:
            and      eax, 0x00000003   ; remainder of div by 4 using AND
            cmp      eax, 0x0          ; check if divided evenly by 4
            jnz      printno           ;  if not, NOPE! if yes, check 100

check100:
            xor      eax, eax          ; zero out eax
            mov      eax, [year]       ; eax is the year to investigate
            and      eax, 0x0000FFFF   ; mask off upper two bytes of 32-bit
            mov      ecx, 0x00000064   ; to divide by 100
            xor      edx, edx          ; zero out edx where remainder goes
            div      dword ecx         ; divide by 100, remainder in edx
            cmp      edx, 0x0          ; check if divided evenly by 100
            jnz      printyes          ; if not, LEAPYEAR!  if yes, check 400

check400:
            xor      eax, eax          ; zero out eax
            mov      eax, [year]       ; eax is the year to investigate
            and      eax, 0x0000FFFF   ; mask off upper two bytes of 32-bit
            mov      ecx, 0x00000190   ; to divide by 400
            xor      edx, edx          ; zero out edx where remainder goes
            div      dword ecx         ; divide by 400, remainder in edx
            cmp      edx, 0x0          ; check if divided evenly by 400
            jz       printyes          ; YEP!

printno:
            xor      eax, eax          ; zero out eax
            mov      eax, [year]       ; eax is the year to investigate
            and      eax, 0x0000FFFF   ; mask off upper two bytes of 32-bit
            push     eax
            push     noout
            call     _printf
            add      esp, 4
            jmp      quit

printyes:
            xor      eax, eax          ; zero out eax
            mov      eax, [year]       ; eax is the year to investigate
            and      eax, 0x0000FFFF   ; mask off upper two bytes of 32-bit
            push     eax
            push     yesout
            call     _printf
            add      esp, 4

quit:
            pop      ebx
            ret

               segment  .data
year:       dw       1900
yesout:     db       0x0A, '   %d IS a leap year', 0x0A, 0
yeslen      equ      $-yesout
noout:      db       0x0A, '   %d is NOT a leap year', 0x0A, 0
nolen       equ      $-noout

