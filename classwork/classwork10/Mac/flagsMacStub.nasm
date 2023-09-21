; ----------------------------------------------------------------------------------------
; This is a Mac OSX console program that displays the contents of the flags register on
;     the display.  In addition, if the carry flag is set, it outputs a message to that
;     effect, and if the overflow flag gets set, it outputs that message as well.
;
;  to assemble:   nasm -fmacho64 flagsMac.nasm
;  to link:       gcc -no_pie flagsMac.o -o flagsMac
;  to run:        ./flagsMac
; ----------------------------------------------------------------------------------------

            global      _start
            extern      _printf
            default     rel

            section     .text
_start:     pushf                         ; push the value of the flags onto the stack
            pop         r8                ; pop flags and load into r8
            mov         rax,  0x6543210   ; initialize the RAX register

display1:   ; display the starting value of the flags using printf
            ; display the starting value of the rax register using printf

addloop:    ; add the rax register to itself

carrychk:   pushf                         ; get the flag values
            pop         r8                ;  and save 'em
            ; mask off the carry flag [bit zero]
            ; check if the carry flag is set
            jnz         display2          ; it's set, so output the message
            jmp         ovrflwchk         ; it's not, so check for overflow flag

display2:   ; display the carry flag set message

ovrflwchk:  pushf                         ; get the flag values again
            pop         r8                ;  and save 'em
            ; mask off the overflow flag [bit eleven]
            ; check if the overflow flag is set
            jnz         display3          ; it's set, so output the message

display3:   ; display the overflow flag is set message
            jmp         addloop           ; if it is NOT, go again

display4:   ; display the overflow flag is set message
quit:       mov         rax, 0x02000001   ; system call for exit
            xor         rdi, rdi          ; exit code 0
            syscall                       ; invoke operating system to exit

            section     .bss
; define your variables down here
; this includes the two messages, and perhaps the value to add each time
