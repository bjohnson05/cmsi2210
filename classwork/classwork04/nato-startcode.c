/** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  filename: Ex3_1.c
 *  purpose:  implement inclass exercise 1, week 3 in "C" language
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
   char ALPHABET[27]  =   "abcdefghijklmnopqrstuvwxyz";

   int i = 0;
   int j = 0;
   int k = 0;

   printf( "\n\n  Message Encoder\n\n" );

  /*
   *  Check the number of arguments to see if the user provided any
   *     arguments.  If argc is "1" then there aren't any so output
   *     a message and quit.
   */
   if( argc == 1 ) {
      printf( "\n  Please try again and enter a word or phrase on the command line.\n\n" );
      exit( 0 );
   } else {

     /*
      *  Now loop through the arguments and convert all their
      *     characters to lower case to make matching easier.
      */
      for( i = 1; i < argc; i++ ) {
         for( j = 0; argv[i][j] != '\0'; j++ ) {
            argv[i][j] = tolower( argv[i][j] );
         }
         printf( "  converted string: %s\n", argv[i] );
      }
   }

/*
 * Now you need to loop through the words and for each word
 *    loop through the word to find each character in the
 *    ALPHABET array.  This will give you the index in that
 *    array, so that you can use that index to access the
 *    NATO array.  At each match, print the NATO word.
 */

}
