   ; ----------------------------------------------------------------------------------------
   ;  filename: howdyMac.nasm
   ;     to assemble:         nasm -f macho64 howdyMac.nasm [can also say '-fmacho64']
   ;     to link using gcc:   gcc howdyMac.o -o howdyMac
   ;     to run on macOS:     ./howdyMac
   ; ----------------------------------------------------------------------------------------

            global   _main
            extern   _puts

            section  .text
   _main:   push     rbx                     ; Call stack must be aligned
            lea      rdi, [rel message]      ; First argument is address of message
            call     _puts                   ; puts(message)
            pop      rbx                     ; Fix up stack before returning
            ret

            section  .data
   message: db       "Howdy, pardner!", 0    ; C strings need a zero byte at the end
