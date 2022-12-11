/*
 * filename: paritygen.c
 * purpose: test the algorithm before writing it in nasm
 * algorithm:  for 32 bits
 *                mask starts at 1
 *                mask is anded with number
 *                if result not zero, increment count
 *                shift mask left by one bit
 */

#include <stdio.h>
#include <stdlib.h>

int main( int argc, char * argv[] ) {

   int number = 0;
   int mask   = 1;
   int count  = 0;

   if( 2 == argc ) {
      number = atoi( argv[1] );

      for( int i = 0; i < 32; i++ ) {
         if( 0 != (number & mask) ) {
            count++;
         }
         mask = mask << 1;
      }
      if( 0 == (count % 2) ) {
         printf( "\n  Even number of 1's, parity bit = 1\n\n" );
      } else {
         printf( "\n  Odd number of 1's, parity bit = 0\n\n" );
      }
   } else {
      printf( " \n\n  One 32-bit integer number needed.  Try again.\n\n" );
   }
   return 0;
}
