/*
 * filename: isleap.c
 * purpose: check if several years are leap years
 *    this is a silly little example program
 */

#include <stdio.h>
#include <stdbool.h>

bool checkYear( int y ) {
   return (((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0));
}

int main( int argc, char * argv[] ) {
   int year = 1900;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 1920;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 1922;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 2000;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 2020;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 2021;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 1600;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 1800;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 1802;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   year = 1804;
   printf( "\n\n   Checking %d to see if it's a leap year: ", year );
   printf( checkYear(year) ? "Yes!\n" : "Nope...\n" );

   return 0;
}
