; -----------------------------------------------------------------------------
;  maxofthree function in 'nasm'
;     to assemble:   nasm -fwin32 maxofthree.nasm
; -----------------------------------------------------------------------------

            global  maxofthree
            section .text

maxofthree:
            mov     eax, edi     ; result (rax) initially holds x
            cmp     eax, esi     ; is x less than y?
            cmovl   eax, esi     ; if yes, set result to y
            cmp     eax, edx     ; is max(x,y) less than z?
            cmovl   eax, edx     ; if yes, set result to z
            ret                  ; return what's in rax
