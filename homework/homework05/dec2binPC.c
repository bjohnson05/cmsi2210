/*
 * filename: dec2binPC.c
 * purpose: converts a base 10 unsigned integer to its 32-bit
 *    binary equivalent and outputs to the display
 * NOTE:  this version is specifically for PC, but should run
 *    on either platform since there's nothing platform specific
 */
#include <stdio.h>
#include <stdlib.h>

#define STRING_LENGTH 32

int main( int argc, char* argv[] ) {

   char binStr[STRING_LENGTH];
   char *eptr;
   unsigned long base10 = 0;
   unsigned long calcValue = base10;

  // error check arguments
   if( argc != 2 ) {
      printf("\n\n  Enter exactly one unsigned integer argument.\n\n");
      return 0;
   }
   base10 = strtoul( argv[1], &eptr, 10 );
   calcValue = base10;

  // initialize the string to all zeros
   for( int i = 0; i < STRING_LENGTH; i++ ) {
      binStr[i] = '0';
   }

  // performe the computation to put the 1's in
   for( int i = STRING_LENGTH - 1; i >= 0; i-- ) {
      binStr[i] = ( calcValue % 2 ) ? '1' : '0';
      calcValue = ( calcValue - (calcValue % 2) ) / 2;
      printf( "  binStr[%d]: %c\n", i, binStr[i] );
   }

  // NULL terminate the string and output the result
   binStr[STRING_LENGTH] = '\0';
   printf( "\n\n   %s in decimal is %s in binary.\n\n", argv[1], binStr );
}
