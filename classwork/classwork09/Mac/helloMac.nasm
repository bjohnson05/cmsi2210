;
; filename: helloMac.nasm
; purpose: simple hello program in 64-bit nasm for Mac
;
;  assemble: nasm -f macho64 helloMac.nasm
;  link:  ld -macosx_version_min 10.7 helloMac.o -o helloMac
;
;  Note that the loader needs to be used, NOT gcc, since
;     we're not calling any functions from the 'C' library
;  Note also ~ depending on the version of the loader, you
;     may get a warning that the macosx version thing is
;     deprecated ... it's a WARNING, not an ERROR
;

            global start
            section  .text

start:   mov      rax,  0x2000004
         mov      rdi,  1
         mov      rsi,  msg
         mov      rdx,  msg.len
         syscall

end:     mov      rax,  0x2000001
         mov      rdi,  0
         syscall

            section  .data
msg:     db    "Hello, world!", 10
.len:    equ   $-msg
