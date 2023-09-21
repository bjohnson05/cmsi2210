; -----------------------------------------------------------------------------
;  maxofthree function in 'nasm'
;     to assemble:   nasm -f macho64 maxofthree.nasm
; -----------------------------------------------------------------------------

            global  maxofthree
            section .text

maxofthree: mov     rax, rdi     ; result (rax) initially holds x
            cmp     rax, rsi     ; is x less than y?
            cmovl   rax, rsi     ; if yes, set result to y
            cmp     rax, rdx     ; is max(x,y) less than z?
            cmovl   rax, rdx     ; if yes, set result to z
            ret                  ; return what's in rax
