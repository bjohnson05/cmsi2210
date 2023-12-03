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
   int width = 2;

   if( argc < 2 ) {
      printf( "\n\n  You must input a number on the command line for 'N'.\n\n" );
      exit( 1 );
   }

   num = atoi( argv[1] );
   if( num <= MINIMUM_VALUE ) {
      printf( "\n\n  You must input a number on the command line for 'N'.\n" );
      printf( "    'N' must be 2 or greater\n\n" );
      exit( 1 );
   } else {
      if( num >= 10 && num < 32 ) {
         width++;
      }
   }

   printf( "%c%", 201 );
   for( int i = 1; i < ((width + 2) * num) + (num - 1); i++ ) {
      printf( "%c", 205 );
   }
   printf( "%c%\n%c", 187, 186 );
   printf( "%*cN |", width - 1, ' ' );
   for( int i = MINIMUM_VALUE; i <= num; i++ ) {
      if( i == num ) {
         printf( " %*d %c", width, i, 186 );
      } else {
         printf( " %*d |", width, i );
      }
   }
   printf( "\n%c", 199 );
   for( int i = 0; i < ((width + 2) * num) + (num -2); i++ ) {
      printf( "-" );
   }
   printf( "%c\n", 182 );

   for( int i = MINIMUM_VALUE; i <= num; i++ ) {
      for( int j = MINIMUM_VALUE; j <= num; j++ ) {
         if( j == MINIMUM_VALUE ) {
            printf( "%c%*d |", 186, width, i );
         }
         if( j == num ) {
            printf( " %*d %c", width, i * j, 186 );
         } else {
            printf( " %*d |", width, i * j );
         }
      }
      printf( "\n" );
   }

   printf( "%c%", 200 );
   for( int i = 1; i < ((width + 2) * num) + (num - 1); i++ ) {
      printf( "%c", 205 );
   }
   printf( "%c%\n", 188 );
}
