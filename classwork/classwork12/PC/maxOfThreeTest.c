/*
 *  filename:  maxOfThreeTest.c
 *
 *  to compile/link: gcc maxOfThreeTest.c maxofthree.obj -o maxOfThreeTest
 *  to run:  ./maxOfThreeTest
 */
#include <stdio.h>
#include <inttypes.h>

int32_t maxofthree( int32_t, int32_t, int32_t );

int main() {
   printf( "%ld\n", maxofthree(  1, -4, -7 ) );
   printf( "%ld\n", maxofthree(  2, -6,  1 ) );
   printf( "%ld\n", maxofthree(  2,  3,  1 ) );
   printf( "%ld\n", maxofthree( -2,  4,  3 ) );
   printf( "%ld\n", maxofthree(  2, -6,  5 ) );
   printf( "%ld\n", maxofthree(  2,  4,  6 ) );
   return 0;
}
