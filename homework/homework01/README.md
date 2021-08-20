# Problems for Assignment #1
## Learning Objectives:
<blockquote>
1. Verifying the development environment is set up properly for GitHub<br />
2. Verifying the development environment is set up and is functional for compiling "C" programs<br />
3. Verifying the development environment is set up and is functional for assembling "nasm" programs<br />
4. Verifying that the instructor can access the GitHub repository to provide feedback evaluations during the semester
</blockquote>

This homework assignment simply extends the in-class assignment for week one. In "classwork01" you set up and compiled a simple "C" program to make sure it worked. This proved the "gcc" compiler and linker is working on your computer. It also makes sure your editor is working properly so that you can create source code with it. These are basic steps, but I want to make sure everyone is on equal footing from the start of the semester.

The second part of this homework is to verify that your nasm assembler is working properly, which is also part of the "classwork01" exercise.

## Part One
1. Add to your <code>"sayhello.c"</code> program from your [week01.html](https://bjohnson.lmu.build/cmsi284web/week01.html) in class exercise to prompt the user for their name from the terminal command line, using the </code>printf()</code> and the </code>fgets()</code> functions.  These are also demonstrated in the F to C conversion code on the [week01.html](https://bjohnson.lmu.build/cmsi284web/week01.html) page.  Don't forget you will need to include BOTH the <code>stdio.h</code> and <code>stdlib.h</code> header files in your source file, just like you need to do in Java using the "import" keyword:

               #include <stdio.h>
               #include <stdlib.h>

               // main method and code go here...
                            
1. Add more lines to your program to change the "Hello, World!" message to say "Hello, " followed by the name that the user has input
1. Compile and run your program to make sure everything works
1. Test your program with several different inputs, like dog, $237.19, and just pressing enter without entering anything.  See if you can break your program and make it crash!
1. Go to GitHub and set up your repo and submission structure if you haven't already done so; make it look like the structure that is on the instructor's repo at [this link](https://github.com/bjohnson05/cmsi284).
1. Upload and commit your completed <code>sayhello.c</code> file to your repo under the "classwork/classwork01" folder.
1. For a little extra challenge, see if you can "dress up" your program a bit by making it output some extra blank lines before and after the output.  Can you make your program indent the output away from the left margin of the window?
1. Commit all your code so far to your repo in the "homework01" directory to make sure you've captured your properly working code.

## Part Two

1. Download and install the nasm assembler from [this location](https://www.nasm.us/pub/nasm/releasebuilds/2.15rc12/) using the version that is appropriate for your operating system.  
  - For MacOS, use the "macosx" version.  
  - For Windows, use the win64 version.  
  - You'll need to download the "zip" file and do the installation manually.
  - If you're on a mac and are familiar with the <code>homebrew</code> application, you may have some success using that tool to do the installation, but I can't guarantee that.  If you elect to use that route and get stuck, you'll need to consult with a TA on the Discord channels.  Manual installation requires adding the directory into which you install nasm to your search path.
  - If you are on windows, you will also need to do manual installation.  You will also need to install that directory into your search path
2. Once that is done, verify that you can access it from your command line by running the command:

              nasm
                            
1. Create a new file called "sayhello.asm" in the same directory where your sayhello.c is located.  Edit the file and paste in the following code:

#### Mac OS version [uses Mac system calls]

                 global      start                   ; on Linux this should be "_start"

                 section     .text
        start:   mov         rax, 0x02000004         ; system call for write [Linux should be "_start"]
                 mov         rdi, 1                  ; file handle 1 is stdout
                 mov         rsi, message            ; address of string to output
                 mov         rdx, 13                 ; number of bytes
                 syscall                             ; invoke operating system to do the write
                 mov         rax, 0x02000001         ; system call for exit [Linux use "60"]
                 xor         rdi, rdi                ; exit code 0
                 syscall                             ; invoke operating system to exit

                 section     .data
        message: db          "Hello, World", 10
                            
#### Windows version [uses "C" library's 'printf' function]

                 global      _main                   ; declares the starting entry point
                 extern      _printf                 ; we'll use the "C" library for now

                 section .text                       ; code starts here
        _main:   push        message                 ; put the message on the stack
                 call        _printf                 ; call "printf()" to display it
                 add         esp, 4                  ; set up the exit
                 ret                                 ; return to Windows

        message: db  "Hello, World!", 10, 0
                            

4. Assemble, link, and run with the following command:

#### Mac OS version [updated]

              nasm -fmacho64 sayhello.asm && ld -macosx_version_min 10.7 sayhello.o -o sayhello2 && ./sayhello2

              [NOTE: this is a different command than the original, using the "linker" instead of "gcc"]
              you can also use semicolons to separate commands:

              nasm -fmacho64 sayhello.asm;ld -macosx_version_min 10.7 sayhello.o -o sayhello2;./sayhello2
              note the semicolons        ↑                                                   ↑

#### Windows version

              nasm -fwin32 sayhello.asm && gcc sayhello.obj -o sayhello2.exe && sayhello2
                            

**NOTE** that the last part of the commands shown above will run your program, but you can also run it by just entering that last part. On Mac, run using "./sayhello" and on Windows run using "sayhello".  If there are errors, do some Internet searching to see if you can track down what's going on.  If you can't figure it out on your own, get some help from your friendly professor or a TA from the Keck Lab in Discord.

5. Now that you have both the "C" and nasm versions working, see if you can figure out how to do the same "dressing up" of your assembler code, putting extra blank lines before and after the text output. Feel free to search the Internet for help. [Hint: check the "message" label in the code for clues!]
6. When everything is working, be sure to commit your code to your repo!

### Evaluation Criteria for Homework 01
1. SAYHELLO.C
  - file exists          1 pt.
  - file compiles        1 pt.
  - program runs         1 pt.
  - prompts user         1 pt.
  - reads input          1 pt.
  - displays hello name  1 pt.
2. SAYHELLO.ASM
  - file exists          1 pt.
  - file assembles       1 pt.
  - programruns          1 pt.
3. GENERAL
  - code style           1 pt.

Total possible points: 10
