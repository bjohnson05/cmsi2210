/*
 * filename: sayHiTimesTest.c
 * purpose:  "C" tester for the 'sayHiTimes()' function
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

uint64_t sayHiTimes( uint64_t );

int main( int argc, char * argv[] ) {

   uint64_t input = atoi( argv[1] );
   printf( "  returned value is: %llu\n", sayHiTimes( input ) );

   input *= 2;
   printf( "  returned value is: %llu\n", sayHiTimes( input ) );

   input *= 2;
   printf( "  returned value is: %llu\n", sayHiTimes( input ) );

   input *= 2;
   printf( "  returned value is: %llu\n", sayHiTimes( input ) );


}
