; ----------------------------------------------------------------------------
; makeNBO.nasm
;
; This is a Win32 console program that calls a "C" function to swap the byte
;  order of a user-input number to make it "Network Byte Order" [NBO] based on
;  whether the machine is "big-endian" [already in NBO] or "little-endian" [and
;  needs bytes swapped].
;
; Also requires the "makeNBOC.c" file to be created and compiled with:
;
;     gcc -c makeNBOC.c
;
;  to assemble for windows:   nasm -f win32 makeNBO.nasm
;  to link for win32:         gcc -m32 makeNBO.o makeNBOC.obj -o makeNBO.exe
; ----------------------------------------------------------------------------

         global      _main
         extern      _makeBigEndian32
         extern      _printf
         extern      _scanf

         section     .text

_main:
         push        ebx               ; we have to save this since we use it

getone:
         push        message1          ; message to get the number
         call        _printf
         add         esp,  4           ; remove parameters from stack

getnum:
         push        number1           ; address of first number "a"
         push        formatin          ; input format string to scanf()
         call        _scanf            ; value returned in location "number1"
         add         esp,  8           ; remove parameters from stack

output1:
         mov         eax, [number1]    ; load value from storage address into EAX
         push        eax               ; push EAX for printf()
         push        outmsg1           ; push output message for printf()
         call        _printf           ; display it in hex
         add         esp,  8           ; remove parameters from stack

convert:
         mov         eax, [number1]    ; load value from storage address into EAX
         push        eax               ; put returned value into EAX
         call        _makeBigEndian32  ; call the function to swap byte order
         add         esp,  4           ; remove parameters from stack
                                       ;  result should be in EAX

printit:
         push        eax               ; push
         push        outmsg2           ; load format for output
         call        _printf           ; print it out

done:
         add         esp,  8           ; remove parameters from stack
         ret


message1:   db    0x0A, 0x0A, "   Enter the number: ", 0
formatin:   db    "%d", 0
outmsg1 :   db    0x0A, "   Original value is: 0x%08x", 0
outmsg2 :   db    0x0A, "        NBO value is: 0x%08x", 0x0A, 0x0A, 0

         section     .bss
number1:    resb    4
