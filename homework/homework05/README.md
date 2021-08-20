# Problems for Assignment #5
## Learning Outcomes
<blockquote>
  1. LOTS AND LOTS of practice writing <q>C</q> code<br />
  2. Practice using <q>C</q> functions from various libraries<br />
  3. Practice writing formatted output using <q>C</q> format specifiers<br />
  4. Experience with writing a <q>work-alike</q> program to a UNIX command<br />
</blockquote>

### The Problems
1. Write a <q>C</q> program, <code>dec2bin.c</code> to convert a base-10 number to its 32-bit binary value equivalent.  You may take the base-10 number in from the command line, or you may prompt the user for the number and read in her response [your option].  Your output should be a string of binary digits which correspond to the base-10 value.  For example, running the program with <code>dec2bin 65535</code> [or just <code>dec2bin</code> if asking the user] should produce the output string <code>00000000000000001111111111111111</code>.  Use unsigned integers.
1. Modify your <q>C</q> program from problem #1 to to make the program <code>dec2hex.c</code> which will output the 32-bit hexidecimal value equivalent.  For this modification, you must also handle an optional command line argument which indicates the number of bits that the output hex value will represent, either 32 or 64.  For example, running the program with dec2bin 65535 32 [or just dec2bin 32 if asking the user] should produce the output string <code>0x0000FFFF</code>.  Running the program with <code>dec2bin 65535 64</code> [or just <code>dec2bin 64</code>] will result in the output of <code>0x000000000000FFFF</code>.  Use unsigned integers.
1. Write a <q>C</q> program <code>timesTables.c</code> to output the times tables from 2 to N, where N is a user-defined number take from the command line.  Output the values in a nice table, using a format specifier that will allow for enough space for the results to be neatly aligned in columns.
1. Write a <q>C</q> program <code>holdit.c</code> that times you as you hold your breath.  The program must put out a short message that has instructions on what to do, which should read something like:<br />
<q>This program will time how long you can hold your breath.  Take a deep breath, then press the 'Enter' key.  When you absolutely have to exhale, press the enter key again.  The duration will be displayed in minutes and seconds.</q><br />
You will need to research the way the time functions work in <q>C</q>.
1. Write a <q>C</q> program <code>wordcount.c</code> that counts the number of words in a file of text.  Your program should take a file name as a command line argument.  As you read the file contents, keep a count of the number of words which are separated by <q>whitespace</q>. [Research what is meant by "whitespace" in the <q>C</q> environment.]  When the file has been completely read, close the file and display the number of words.  Be sure you handle error conditions like files that don't exist or errors while reading the file.  You should also be able to handle files that are in different directories from where your program resides.
