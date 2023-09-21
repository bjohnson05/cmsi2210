; -----------------------------------------------------------------------------
; A 64-bit program that displays its command line arguments, one per line.
;
;  to assemble:   nasm -f macho64 echoer.nasm
;  to link:       gcc echoer.o -o echoer
;  to run:        ./echoer
; -----------------------------------------------------------------------------


         global   _main
         extern   _puts

         section  .text
_main:
         push     rdi               ; save registers that puts uses
         push     rsi
         sub      rsp, 8            ; must align stack before call

         mov      rdi, [rsi]        ; the argument string to display
         call     _puts             ; print it

         add      rsp, 8            ; restore %rsp to pre-aligned value
         pop      rsi               ; restore registers puts used
         pop      rdi

         add      rsi, 8            ; point to next argument
         dec      rdi               ; count down
         jnz      _main             ; if not done counting keep going

         ret
