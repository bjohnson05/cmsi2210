/**
 *  filename: roman.c
 *  purpose: calculate and display roman numerals
 *  author: Dr. Johnson
 *  date: 2023-08-01
 *  note: program only handles up to 5999
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define  MAX_VALUE   5999

int main( int argc, char * argv[] ) {

   char outputString[25] = "\0";
   int  index = 0;
   int  value = 0;
   int  del[] = { 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 };
   char * symbol[] = { "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" };
   if( argc == 1 ) {
      printf( "\n\n   Sorry, you need to provide a single integer" \
              " less than or equal to 5999.\n\n" );
      exit( 0 );
   }

   value = atoi( argv[1] );
   if( value > MAX_VALUE ) {
      printf( "\n\n   Sorry, you need to provide a single integer" \
              " less than or equal to %d.\n\n", MAX_VALUE );
      exit( 0 );
   }

   while( value ) {                             // while input number is not zero
      while( value / del[index] ) {             // while a number contains the largest key value possible
         strcat( outputString, symbol[index] ); // append the symbol for this key value to res string
         value -= del[index];                   // subtract the key value from number
      }
      index++;                                  // proceed to the next key value
   }
   printf( "\n\n   Roman numerals for value %d: %s\n\n", atoi( argv[1] ), outputString );

}
