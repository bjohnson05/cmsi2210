/*
 * filename: bigEndianTest.c
 * purpose:  to determine whether this is a big-endian
 *             or a little-endian computer and display the order
 *
 * NOTE: this program is intended for PC, but should run on either
 *    Mac or PC since there is no code that is platform specific
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool isLittleEndian() {

   unsigned int x = 0x76543210;
   char *c = (char*)&x;
   char *d = (char*)&x;
   if( *c == 0x10 ) {
      for( int i = 0; i < 4; i++ ) {
         printf( "%02x ", *c );
         c++;
      }
   }
   return (*d == 0x10);
}

int main( int argc, char * argv[] ) {

   printf( "\n\n   The string '0x76543210 in this computer is " );
   printf( "%s", (isLittleEndian() ? "\n    which is little-endian.\n\n" : "\n    which is big-endian.\n\n") );

   return( 0 );

}
