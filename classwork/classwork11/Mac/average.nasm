; -----------------------------------------------------------------------------
; filename: average.nasm
; 64-bit MacOS program that treats all its command line arguments as integers
;  and displays their average as a floating point number.  Uses a data section
;  to store intermediate results, to illustrate how data sections are used.
;
;     to assemble: nasm -fmacho64 average.nasm
;     to link:     gcc average.o -o average
;     to run:      average 12 23 34 45 56
; -----------------------------------------------------------------------------

        global   _main
        extern   _atoi
        extern   _printf
        default  rel

        section  .text
_main:
        push     rbx                   ; we don't ever use this, but it is necesary
                                          ; to align the stack so we can call stuff
        dec      rdi                   ; argc-1, since we don't count program name
        jz       nothingToAverage
        mov      [count], rdi          ; save number of real arguments

accumulate:
        push     rdi                   ; save register across call to atoi
        push     rsi
        mov      rdi, [rsi+rdi*8]      ; argv[rdi]
        call     _atoi                 ; now rax has the int value of arg
        pop      rsi                   ; restore registers after atoi call
        pop      rdi
        add      [sum], rax            ; accumulate sum as we go
        dec      rdi                   ; count down
        jnz      accumulate            ; more arguments?

average:
        cvtsi2sd xmm0, [sum]
        cvtsi2sd xmm1, [count]
        divsd    xmm0, xmm1            ; xmm0 is sum/count
        lea      rdi, [format]         ; 1st arg to printf
        mov      rax, 1                ; printf is varargs, there is 1 non-int argument
        call     _printf               ; printf(format, sum/count)
        jmp      done

nothingToAverage:
        lea      rdi, [error]
        xor      rax, rax
        call     _printf

done:
        pop      rbx                   ; undoes the stupid push at the beginning
        ret

           section  .data
count:  dq       0                     ; argument cound
sum:    dq       0                     ; sum :D
format: db       "%g", 10, 0           ; output format specifier
error:  db       "There are no command line arguments to average", 10, 0