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
_main:
            push        EBX               ; save this one

begin:      pushf                         ; push the value of the flags onto the stack
            pop         EDX               ; pop flags and load into EDX
            mov         EBX,  0x6543210   ; initialize the EBX register
            mov         [current], EBX    ; save EBX for later
            mov         [flags],   EDX    ; save the original flags

display1:
            push        EDX               ; display the starting value of the flags
            push        format1
            call        _printf
            add         esp,  8           ; pop the stack
clear:
            xor         EAX,  EAX         ; clear EAX
            mov         EAX,  [current]   ; get current value into EAX

display1a:
            push        EAX               ; display the starting value of the EAX register
            push        format2
            call        _printf
            add         esp,  8           ; pop the stack

addloop:
            mov         EAX,  [current]   ; load current value
            add         EAX,  [addvalu]   ; add the current value to itself
            pushf                         ; get the flag values
            mov         [current], EAX    ; save new value back

carrychk:
            pop         EDX               ; get flags back
            mov         [flags], EDX      ; save for printing later
            and         EDX,  0x00000001  ; mask off the carry flag [bit zero]
            cmp         EDX,  0x00000001  ; check if the carry flag is set
            je          display2          ; it's set, so output the message
            jmp         ovrflwchk         ; it's not, so check for overflow flag

display2:
            push        format3           ; display the carry flag set message
            call        _printf
            add         esp,  4
            mov         EDX,  [flags]     ; load the flags value again
            push        EDX               ; push for use in printf
            push        format1
            call        _printf
            add         esp,  8           ; pop the stack
            jmp         done

ovrflwchk:
            mov         EDX,  [flags]     ; load the flags value again
            and         EDX,  0x00000800  ; mask off the overflow flag [bit eleven]
            cmp         EDX,  0x00000800  ; check if the overflow flag is set
            je          display3          ; it's set, so output the message
            jmp         addloop           ; time to go again!

display3:  ; display the overflow flag set message
            push        format4
            call        _printf
            add         esp,  4

done:                                     ; Terminate program
            pop         EBX               ; restore this one
            ret

            section     .data
format1:    db          0x0A, "   FLAGS: 0X%08x", 0x0A, 0
format2:    db          0x0A, "     EAX: 0X%08x", 0x0A, 0
format3:    db          0x0A, "   Carry flag set", 0x0A, 0
format4:    db          0x0A, "   Ovflw flag set", 0x0A, 0
addvalu:    dd          0x6543210

            section     .bss
current:    resb        4                 ; space to store current value
flags:      resb        4                 ; space to store flags register value
