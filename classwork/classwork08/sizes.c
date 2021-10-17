/*
 * file: sizes.c
 * output the sizes that the compiler assumes for types
 */

#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>

int main() {

   printf( "\n\n   Sizes of 'C' standard data types\n\n" );
   printf( "   char      : %3d\n", sizeof(char) );
   printf( "   wchar_t   : %3d\n", sizeof(wchar_t) );
   printf( "   short     : %3d\n", sizeof(short) );
   printf( "   int       : %3d\n", sizeof(int) );
   printf( "   long      : %3d\n", sizeof(long) );
   printf( "   longlong  : %3d\n", sizeof(long long) );
   printf( "   float     : %3d\n", sizeof(float) );
   printf( "   double    : %3d\n", sizeof(double) );

   exit( 0 );
}
