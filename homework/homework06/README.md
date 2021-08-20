# Problems for Assignment #6
## Learning Outcomes
<blockquote>
  1. Practice writing nasm programs and functions<br />
  2. Practice writing and using <q>C</q> programs<br />
  3. Practice writing and using <q>C</q> to call nasm functions<br />
  4. Practice writing and using nasm to call <q>C</q> functions<br />
  5. Experience with using nasm and <q>C</q> to investigate network issues of byte-ordering and parity<br />
</blockquote>

### The Problems
1. Using a previous homework problem with code from our <code>stanley/penguin</code> language as your guide, write an assembly program using <strong>nasm</strong> called <code>findGCD.nasm</code> which will find the GCD of the two numbers 3113041662 and 11570925.  Read the two numbers from the keyboard at port <q>stdin</q> and write the result to port <q>stdout</q>.
1. Change the program from the previous problem to be a <strong>nasm</strong> function which is able to be called from a <q>C</q> program.  Then write a program <code>gcdFinder.c</code> containing the code in <q>C</q> to call your function.  Use the <q>assert()</q> functions from the <q>C</q> library.  You can link this into your program by <code>#include <assert.h></code> as you've seen in class.  Your assembly code should take the two numbers as arguments which are passed from the <q>C</q> code.
1. Parity is a term which is applied when counting the number of bits that are set to <q>1</q> in a sequence of bits.  It is used to help guarantee that nothing has gone wrong with the bit sequence during transmission.  Parity is calculated based on the number of <q>1</q> bits in a byte, and a ninth bit, the parity bit, is either set or cleared to achieve the proper parity, either even or odd.  For example, for the byte <code>01101001</code>, assuming even parity, the parity bit would be cleared so that the count of <q>1</q> bits remains even for all nine bits; for the byte <code>10101110</code>, assuming even parity, the parity bit would be set so that the count of <q>1</q> bits remains even.  Note that the parity bit IS NOT PART of the byte, IT IS A NINTH BIT which is separate.<br />Write a <strong>nasm</strong> function called <code>paritygen.nasm</code> that will count the <q>one</q> bits in a byte of data and return the proper value for the parity bit assuming we are using <u><i>odd</i></u> parity.
1. In networking, it is necessary to make sure that bytes are transimitted in the proper order so the receiving device can interpret them correctly.  This requires that big-endian and little-endian values are converted to something called <strong>Network Byte Order</strong> before they are transmitted.  For this problem, write a <q>C</q> program <code>whichEndIsUp.c</code> that will determine whether your computer is big-endian or little-endian.
1. Building on the previous problem, write a <q>C</q> function <code>makeNBO.c</code> that reads a number from the command line arguments and swaps its byte order, if necessary, to be in Network Byte Order.  Create a test program to call your function and display the results on stdout.
1. Finally, create a <strong>nasm</strong> program called <code>makeNBO.nasm</code> which does the byte order swapping BY CALLING YOUR <q>C</q> function.  Make your <strong>nasm</strong> program call the function <i><u>at least</u></i> five times with different values to test it.
