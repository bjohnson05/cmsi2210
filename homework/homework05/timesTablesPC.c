/*
 * filename: timesTables.c
 * purpose:  prints timesTables from 2 to N
 *             where 'N' is a command line argument
 * This version is specifically for PC, but should run fine
 *    on Mac, since there are no platform specific functions
 */
#include <stdio.h>
#include <stdlib.h>

#define MINIMUM_VALUE   2

int main( int argc, char* argv[] ) {
   int num;
   if( argc < 2 ) {
      printf( "\n\n  You must input a number on the command line for 'N'.\n\n" );
      exit( 1 );
   }

   num = atoi( argv[1] );
   if( num <= MINIMUM_VALUE ) {
      printf( "\n\n  You must input a number on the command line for 'N'.\n" );
      printf( "    'N' must be 2 or greater\n\n" );
      exit( 1 );
   }

   printf( "X   |" );
   for( int i = MINIMUM_VALUE; i < num; i++ ) {
      printf( "%3d|", i );
   }
   printf( "%4d\n", num );
   for( int i = 0; i < (4 * num) + 5; i++ ) {
      printf( "-" );
   }
   printf( "\n" );

   for( int i = MINIMUM_VALUE; i <= num; i++ ) {
      for( int j = MINIMUM_VALUE; j <= num; j++ ) {
         if( j == MINIMUM_VALUE ) {
            printf( "%3d||", i );
         }
         printf( "%4d", i * j );
      }
      printf( "\n" );
   }
}
