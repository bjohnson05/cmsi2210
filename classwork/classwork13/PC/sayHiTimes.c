/*
 * filename:  sayHiTimes.c
 * purpose:   callable function from nasm
 *             demonstration only
 *             takes single integer
 *             prints "Hello" that many times
 *             counts how many times
 *             returns the count
 */

#include <stdio.h>
#include <inttypes.h>

int64_t sayHiTimes( int64_t x ) {
   int64_t count = 0;
   for( int i = 0; i < x; i++ ) {
      printf( "   Hello!\n" );
      count++;
   }
   return count;
}


