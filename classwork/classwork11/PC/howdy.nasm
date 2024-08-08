; ----------------------------------------------------------------------------------------
;  filename: howdy.nasm
;     to assemble:         nasm -fwin32 howdy.nasm
;     to link using gcc:   gcc -m32 howdy.obj -o howdy
;     to run on macOS:     howdy
; ----------------------------------------------------------------------------------------

            global    _main
            extern    _puts

            section   .text
_main:
         push      EBX             ; Call stack must be aligned
         push      message         ; First argument is address of message
         call      _puts           ; puts(message)
         pop       EBX             ; Fix up stack before returning
         ret

            section   .data
message: db   0x0A, "   Howdy, pardner!", 0x0A, 0x00      ; C strings need a zero byte at the end
