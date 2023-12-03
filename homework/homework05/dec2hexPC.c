/*
 * filename: dec2hexPC.c
 * purpose: converts a base 10 unsigned integer to its 32-bit
 *    hexadecimal equivalent and outputs to the display
 * NOTE:  this version is specifically for PC, but should run
 *    on either platform since there's nothing platform specific
 */
#include <stdio.h>
#include <stdlib.h>

#define STRING_LENGTH 32

int main( int argc, char* argv[] ) {

   char *eptr;
   int numOfBits = STRING_LENGTH;

  // error check arguments
   if( argc < 2 ) {
      printf("\n\n  Enter exactly one or two unsigned integers\n" );
      printf( "    The first is the number to convert\n" );
      printf( "    The second is an optional number of bits, either 32 or 64\n\n");
      return 0;
   } else if( argc == 3 ) {
      numOfBits = atoi( argv[2] );
      if( (numOfBits != STRING_LENGTH) && (numOfBits != 64) ) {
         printf("\n\n  Enter exactly one or two unsigned integers\n" );
         printf( "    The first is the number to convert\n" );
         printf( "    The second is an optional number of bits, either 32 or 64\n\n");
         return 0;
      }
   }

  // Just use the printf format specifier to output the hex string
  //  only need to determine how many digits
   if( numOfBits == STRING_LENGTH ) {
      printf( "\n\n   %s in decimal is 0x%08X in hexadecimal.\n\n", argv[1], strtoul( argv[1], &eptr, 10 ) );
   } else {
      printf( "\n\n   %s in decimal is 0x%016X in hexadecimal.\n\n", argv[1], strtoul( argv[1], &eptr, 10 ) );
   }
}
