; ----------------------------------------------------------------------------------------
; This is a Win32 console program that displays the contents of the flags register on
;     the display.  In addition, if the carry flag is set, it outputs a message to that
;     effect, and if the overflow flag gets set, it outputs that message as well.
;
;  to assemble:   nasm -fwin32 flagsPC.nasm
;  to link:       gcc -m32 flagsPC.obj -o flagsPC.exe
;  to run:        flagsPC
; ----------------------------------------------------------------------------------------

            global      _main
            extern      _printf
            default     rel

            section     .text
_main:      push        EBX               ; save this one
            pushf                         ; push the value of the flags onto the stack
            pop         EAX               ; pop flags and load into EDX
            mov         EBX,  0x6543210   ; initialize the ECX register

display1:   ; display the starting value of the flags
            ; display the starting value of the EAX register

addloop:    ; add the EBX value to current value

carrychk:   pushf                         ; get the flag values
            pop         EDX               ;  and save 'em
            ; mask off the carry flag [bit zero]
            ; check if the carry flag is set
            je          display2          ; it's set, so output the message
            jmp         ovrflwchk         ; it's not, so check for overflow flag

display2:   ; display the carry flag set message

ovrflwchk:  pushf                         ; get the flag values again
            pop         EDX               ;  and save 'em
            ; mask off the overflow flag [bit eleven]
            ; check if the overflow flag is set
            ; it's set, so output the message
            jmp         addloop           ; time to go again!

display3:   ; display the overflow flag set message
            
            add         esp,  4

                                          ; Terminate program
            pop         EBX               ; restore this one
            ret

            section     .data
; define your variables down here
; this includes the two message, and perhaps the value to add each time
; you might also want a '.bss' section as well
