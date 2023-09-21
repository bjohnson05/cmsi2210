; ----------------------------------------------------------------------------------------
; This is a Mac OSX console program that displays the contents of the flags register on
;     the display.  In addition, if the carry flag is set, it outputs a message to that
;     effect, and if the overflow flag gets set, it outputs that message as well.
;
;  to assemble:   nasm -fmacho64 flagsMac.nasm
;  to link:       gcc flagsMac.o -o flagsMac
;  to run:        ./flagsMac
; ----------------------------------------------------------------------------------------

            global      _main
            extern      _printf

            section     .text
            default     rel

_main:
            push        rbx
            mov         r14,  0x6543210   ; initialize the r14 register
            mov         r15,  0x6543210   ; initialize the r10 register also
            mov         r11,  0x0000010   ; r11 for max loop count of 16

; display the value of the "sum" register
display1:
            mov        rsi,   r14         ; second arg is the integer to be output
            lea        rdi,   [r14fmt]    ; first argument is the format string
            call       _printf            ;

; display the value of the "flags" register
display2:
            pushf                         ; push the value of the flags onto the stack
            pop        r12                ; pop flags and load into r12
            mov        rsi,   r12         ; second arg is the integer to be output
            lea        rdi,   [flgfmt]    ; first argument is the format string
            call       _printf            ;

; add the value 0x6543210 from r15 to the "sum" register
addloop:
            dec        r11                ; one less time
            add        r14,   r15         ; add the value trying to make a carry
            pushf                         ; get the flag values
            pop        r12                ;     and save 'em
            mov        r13,   r12         ; save to display later
            lea        rdi,   [looptrkg]  ; output tracking message
            call       _printf            ;
            mov        rsi,   r14         ; second arg is the integer to be output
            lea        rdi,   [r14fmt]    ; first argument is the format string
            call       _printf            ;

; check if the "carry flag" [CF] is set and if so, jmp to display it
carrychk:
            mov         r12,   r13        ; restore flags from before
            and         r12,   1          ; mask off the carry flag [bit zero]
            cmp         r12,   0          ; check if the carry flag is set
            jne         display3          ; it's set, so output the message
            mov        rsi,   r13         ; second arg is the integer to be output
            lea        rdi,   [flgfmt]    ; first argument is the format string
            call       _printf            ;
            jmp         ovrflwchk         ; it's not, so check for overflow flag

; display the carry flag is set message
display3:
            mov        rsi,   r13         ; second arg is the integer to be output
            lea        rdi,   [fl