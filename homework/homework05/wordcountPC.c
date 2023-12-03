/*
 * filename wordcount.c
 * purpose: Counts the number of words in a file.
 *    CMSI 284 Spring 2021, homework05 problem 5
 */

#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>

int main( int argc, char * argv[] ){
   int count = 0;

   if( argc != 2 ) {
      printf( "\n\nOne command line argument needed to specify file to count.\n\n" );
      return 1;
   } else {
      FILE* in = fopen( argv[1], "r" );
      if( !in ) {
         printf( "\n\nFile %s: error on open\n\n", argv[1] );
         return 2;
      }
      while( 1 ) {
         int c = fgetc( in );
         if( c == EOF ) {
            break;
         }
         if( isspace(c) ) {
            count++;
         }
      }
      printf("\n  I count %d words in selected file.\n", count);
   }
   exit( 0 );
}
