/*
 * filename: whichEndIsUp.c
 * purpose:  to determine whether this is a big-endian
 *             or a little-endian computer
 *
 * NOTE: this program is intended for PC, but should run on either
 *    Mac or PC since there is no code that is platform specific
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

bool isLittleEndian() {

  unsigned int x = 0x76543210;
  char *c = (char*)&x;
  return (*c == 0x10);

}

int main( int argc, char * argv[] ) {

   printf( "\n\n   This computer is " );
   printf( "%s", (isLittleEndian() ? "little-endian.\n\n" : "big-endian.\n\n") );

   return( 0 );

}
