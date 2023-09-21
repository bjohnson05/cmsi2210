;----------------------------------------------------------------------------
; registers.nasm
;
; This is a Win32 console progam that simply prints out the values of the
;  different registers so that you can see their ordering on the display.
; Because it is a Win32 program, only the EAX, EBX, ECX, EDX and ESI, and EDI
;  registers are used.
; The program needs to be linked with a C library to use "printf()"
; The program is ALSO a demonstrator for using the GDB utility to view values
;  of the registers as each line is executed.  To do this the program must be
;  linked using the "-g" option of gcc.
;
;  to assemble for windows:         nasm -f win32 registers.nasm
;  to link for win32 under win64:   gcc -mwin32 registers.obj -o registers.exe
;  to link for win32 using gdb:     gcc -ggdb -mwin32 registers.obj -o registers.exe
;----------------------------------------------------------------------------

            global   _main
            extern   _printf

            section  .text

_main:
            push     ebx               ; we have to save this

final:      mov      eax, 0x01         ; We're putting them in order as listed
            mov      ebx, 0x02         ;     in the comments above
            mov      ecx, 0x03
            mov      edx, 0x04
            mov      esi, 0x05
            mov      edi, 0x06
            push     edi
            push     esi
            push     edx
            push     ecx
            push     ebx
            push     eax
            push     format
            call     _printf
            add      esp, 28

quit:       pop      ebx
            ret

            segment  .data
format:     db '%5d %5d %5d %5d %5d %5d ', 0x00
