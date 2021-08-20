# Problems for Assignment #4
## Learning Outcomes
<blockquote>
  1. Practice creating logic diagram models from truth table and text descriptions<br />
  2. Practice with manipulating register contents using various operations<br />
  3. Practice writing and interpreting assembly language programs<br />
</blockquote>

### Logic Design Problems

  1. Consider the function with three inputs (A,B,C) and two outputs (X,Y) that works like this:
<pre>
               A  B  C | X  Y
              ---------+------
               0  0  0 | 0  1
               0  0  1 | 0  1
               0  1  0 | 0  1
               0  1  1 | 1  1
               1  0  0 | 1  0
               1  0  1 | 1  1
               1  1  0 | 1  0
               1  1  1 | 1  1
</pre>
    Design two logic circuits for this function
       A) one using AND, OR and NOT gates only, and
       B) one using NAND gates only. Do NOT draw the circuit
    Just write two formulas ~ one for computing <code>X</code> and one for computing <code>Y</code>.
    
  2. Draw a logic circuit that compares two 2-bit signed numbers as follows: It should have four inputs a1, a0, b1, and b0. a1a0 is a 2-bit signed number (call it a) and b1b0 is a 2-bit signed number (call it b). The circuit has one output, c, which is 1 if a > b and 0 otherwise.

### Register Operations
  3. Given a 32-bit register, write logic instructions to perform the following operations. For parts (c) and (f) assume an unsigned interpretation; for part (d) assume a signed interpretation.<br />
    a. Clear all even numbered bits<br />
    b. Set the last three bits<br />
    c. Compute the remainder when divided by 8<br />
    d. Make the value -1<br />
    e. Complement the two highest order bits<br />
    f. Compute the largest multiple of 8 less than or equal to the value itself

### Assembly Language Programming
  4. For the sample single-accumulator computer discussed in class, write a complete assembly language program that sends the values 0 through 255 out to port 0x8.
  1. Translate your assembly language program in the previous problem to machine language.
  1. For the sample single-accumulator computer discussed in class, write a complete assembly language program that computes a greatest common divisor. Assume the two inputs are read in from port 0x100. Write the result to port 0x200.
  1. For the sample single-accumulator computer discussed in class, give a code fragment, in assembly language, that swaps the accumulator and memory address 0x30AA.
  1. For the sample single-accumulator computer discussed in class, give a code fragment, in assembly language, that has the effect of jumping to the code at address 0x837BBE1 if the value in the accumulator is greater than or equal to 0.
  1. Explain, at a high-level, what the following sequence of instructions does. In other words<br />
     A) suppose a programmer has stored data in r8 and r9. After executing these instructions, 
        what does the programmer notice about the data?

              xor r8, r9
              xor r9, r8
              xor r8, r9

     B) Also state as briefly as possible why that effect happens.


## Evaluation Criteria for Homework 04
#### LOGIC DESIGN
  - Question 1a: logic design           10 pts.
  - Question 1b: logic design            5 pts.
  - Question 2: logic design            10 pts.
#### REGISTER OPERATIONS
  - Question 3a: Reg. clear even         2 pts.
  - Question 3b: Reg. set last 3         2 pts.
  - Question 3c: Reg./8 remainder        2 pts.
  - Question 3d: Reg. set to -1          2 pts.
  - Question 3e: Reg. invert 2 MSBs      2 pts.
  - Question 3f: Register computation    2 pts.
#### ASSEMBLY PROGRAMS
  - Question 4: asm program 1a          11 pts.
  - Question 5: asm program 1b          11 pts.
  - Question 6: asm GCD prog.           11 pts.
  - Question 7: asm swap code fragment   5 pts.
  - Question 8: asm jmp to address       5 pts.
  - Question 9a: explain what it does    5 pts.
  - Question 9b: explain why it happens  5 pts.

Total possible points: 90
