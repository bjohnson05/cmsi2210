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

int mysteryFunc( int value ) {
   int x = 0;
   int y = 1;
   for( int i = 0; i < 32; i++ ) {
      if( value & y ) {
         x++;
      }
      y = y << 1;
   }
   return ((x % 2) == 0) ? 0 : 1;
}

int main( int argc, char * argv[] ) {

   int number = 0;
   int mask   = 1;
   int count  = 0;

   if( 2 == argc ) {
      number = atoi( argv[1] );
      printf( "\n  Parity bit should be: %d\n\n", mysteryFunc( number ) );
   } else {
      printf( " \n\n  One 32-bit integer number needed.  Try again.\n\n" );
   }
   return 0;
}
