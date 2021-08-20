/**
 * filename   : goFish.c
 * purpose    : demonstrate "C" code for practice using pointers and addressing
 * author     : Dr. Johnson
 * date       : 2019-01-17
 * description:
 *    Write a program called "goFish.c" that sums and averages a list of numbers,
 *       then creates a string and produces a count. You must use EITHER an array,
 *       or a set of pointers as the data storage....
 *    1. The numbers must be prompted for in a loop
 *    2. The special value "-9999" is used to indicate that the entries are complete
 *    3. Store the values in a structure of some kind that is initially declared to
 *          be size 25 int elements
 *    4. Loop through the structure and sum the elements, then output the sum to
 *          the console
 *    5. Count the number of elements in the structure, and output their average to
 *          the console
 *    6. Loop through the structure again, and contatenate all the values into a
 *          long string
 *    7. Output the string to the console
 *    8. Loop through the string, and count all the "7" ["seven"] characters; this
 *          is like in the game "Go Fish" when you ask another player, "GIMME ALL
 *          YOUR SEVENS".
 *    9. Output the count to the console
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define  MAX_ARRAY_SIZE    25
#define  MAX_ENTRY_SIZE    10
#define  TERMINATE      -9999

int main( int argc, char * argv[] ) {

  /* Declare, define, and initialize variables */
   char   input[ MAX_ENTRY_SIZE ];
   char   outputString[(MAX_ENTRY_SIZE * MAX_ARRAY_SIZE)] = "";
   double average = 0.0;
   int    count = 0;
   int    i = 0;
   int    j = 0;
   int    sum = 0;
   int *  array = malloc( MAX_ARRAY_SIZE * sizeof( *array ) );
   int *  arrayStartKeeper = array;

  /* Output a happy little welcome message */
   printf( "\n\n   SUM AND AVERAGE PROGRAM\n\n" );
   printf( "   Enter integer numbers, one at a time,\n" );
   printf( "   or enter the special value '-9999' to quit entering.\n" );
   printf( "   You may enter a maximum of %d numbers:\n\n", MAX_ARRAY_SIZE );

  /* Loop to get the entries, placing them in the array
   *  watch for the '-9999' to quit entering */
   while( i++ < MAX_ARRAY_SIZE ) {
      printf( "[%d enter] <== ", i );
      *array = atoi( fgets( input, MAX_ENTRY_SIZE, stdin ) );
      if( *array == TERMINATE ) {
         break;
      }
      array++;
   }

   printf( "\n   ....%d numbers entered...\n", --i );

  /* Do the 'sum' and 'average' operations */
   array = arrayStartKeeper;
   for( j = 0; j < i; j++ ) {
      sum += *array++;
   }
   average = (double)(sum / i);

  /* Now make a string that contains all the numbers in the array, concatenated */
   array = arrayStartKeeper;
   for( i = 0; i < j; i++ ) {
//      itoa( array[i], input, 10 );  // this works on windows MinGW but not on mac gcc!
      snprintf( input, MAX_ENTRY_SIZE, "%d", *array++ );
      strncat( outputString, input, MAX_ENTRY_SIZE );
   }

  /* Finally, loop through the string and find all the sevens */
   for( i = 0; i < strlen( outputString ); i++ ) {
      if( outputString[i] == '7' ) {
         count++;
      }
   }
   printf( "\n\n" );
   printf( "--> total is %d and average is %-8.3lf\n", sum, average );
   printf( "--> output string is :%s:\n", outputString );
   printf( "--> Gimme all your sevens.....\n\n" );
   if( count == 0 ) {
      printf( "\n   GO FISH!!!\n\n" );
   } else if( count == 1 ) {
      printf( "--> there is %d seven in this string.\n\n", count );
   } else {
      printf( "--> there are %d sevens in this string.\n\n", count );
}

   free( array );
   exit( 0 );

}
