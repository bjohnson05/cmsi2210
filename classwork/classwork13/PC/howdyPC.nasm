   ; ----------------------------------------------------------------------------------------
   ;  filename: howdyPC.nasm
   ;     to assemble:         nasm -f win32 howdyPC.nasm
   ;     to link using gcc:   gcc -m32 howdyPC.obj -o howdyPC.exe
   ;     to run on Windows:   howdyPC
   ; ----------------------------------------------------------------------------------------

            global   _main
            extern   _puts

            section  .text
   _main:
            push     ebx         ; Call stack must be aligned

            push     message     ; First argument is address of message
            call     _puts       ; equivalent to "puts( message );"

            pop      ebx         ; Fix up stack before returning
            ret

            section  .data
   message: db       0x0A, "Howdy, pardner!", 0x0A, 0    ; C strings need a zero byte at the end
