/** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  filename: Ex3_1.c
 *  purpose:  implement inclass exercise 1, week 3 in Java
 *  @author:  Dr. Johnson
 *  @date:    2020-12-31
 *  Note:     see https://bjohnson.lmu.build/cmsi284web/week03.html
 *            actually does both Ex3-1 and Ex3-2
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


int main( int argc, char * argv[] ) {

   char NATO[26][10]  = { "alpha", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel",
                          "india", "juliett", "kilo", "lima", "mike", "november", "oscar", "papa",
                          "quebec", "romeo", "sierra", "tango", "uniform", "victor", "whiskey",
                          "xray", "yankee", "zulu" };
   char MORSE[26][10] = { "*-", "-***", "-*-*", "-**", "*", "**-*", "--*", "****", "**", "*---",
                          "-*-", "*-**", "--", "-*", "---", "*--*", "--*-", "*-*", "***", "-",
                          "**-", "***-", "*--", "-**-", "-*--", "--**" };
   char ALPHABET[27]  =   "abcdefghijklmnopqrstuvwxyz";

   int i = 0;
   int j = 0;
   int k = 0;

   printf( "\n\n  Message Encoder\n\n" );
   if( argc == 0 ) {
      printf( "\n  Please try again and enter a word or phrase on the command line.\n\n" );
      exit( 0 );
   } else {
      for( i = 1; i < argc; i++ ) {
         for( j = 0; argv[i][j] != '\0'; j++ ) {
            argv[i][j] = tolower( argv[i][j] );
         }
         printf( "  converted string: %s\n", argv[i] );
      }
   }

   for( i = 1; i < argc; i++ ) {
      for( j = 0; argv[i][j] != '\0'; j++ ) {
         for( k = 0; ALPHABET[k] != '\0'; k++ ) {
            if( argv[i][j] == ALPHABET[k] ) {
               printf( "  %s\n", NATO[k] );
            }
         }
      }
      printf( "\n" );
   }

   for( i = 1; i < argc; i++ ) {
      for( j = 0; argv[i][j] != '\0'; j++ ) {
         for( k = 0; ALPHABET[k] != '\0'; k++ ) {
            if( argv[i][j] == ALPHABET[k] ) {
               printf( "  %s\n", MORSE[k] );
            }
         }
      }
      printf( "\n" );
   }

}
