; ----------------------------------------------------------------------------
; gcdFinder.nasm
;
; This is a Win32 console program that uses Euclid's algorithm to find the GCD
;  of two numbers and return it to the caller.  The two numbers are passed as
;  arguments.
;
; Algorithm:  return (b == 0) ? a : (gcd( b, a % b ))
;
;  eax will be the "a" value and ecx will be the "b" value
;
;  to assemble for windows:   nasm -f win32 findGCD.nasm
;  to link for win32:         gcc -m32 findGCD.obj -o findGCD.exe
; ----------------------------------------------------------------------------

         global      _gcdFinder

         section     .text

_gcdFinder:
filetop:
         push        ebp               ; we have to save this since we use it
         mov         ebp,  esp         ; point to first parameters

getnums:
         mov         eax,  [ebp+8]     ; get first number
         mov         ecx,  edx         ; get second number ~ not sure why it's
                                       ;  in edx, but it is...

calc:
         cmp         eax,  ecx         ; check if 'a' == 'b'
         je          end               ;  if it is, nothing to do
         jb          swap              ; if ebx > eax swap 'em
         jmp         top               ; all good, skip next part
swap:
         xchg        eax,  ecx         ; swap 'em
top:
         xor         edx,  edx         ; set up edx for remainders
         idiv        ecx               ; eax now eax/ebx, rmndr in edx
         test        edx,  edx         ; if rmndr==0, we're done
         je          end
         mov         eax,  ecx         ; else, put dividend 'b' in divisor 'a'
         mov         ecx,  edx         ;  then rmndr becomes divisor 'b'
         jmp         top               ;  and go again

end:
         mov         eax,  ecx         ; put GCD into eax
         mov         esp,  ebp         ; restore stack pointer
         pop         ebp               ; restore base pointer
         ret

