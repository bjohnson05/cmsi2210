/*
 * filename: holditPC.c
 * purpose:  problem #3 of homwork #5
 * times how many seconds you can hold your breath
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {

   int elapsedTime  = 0;
   int endSeconds   = 0;;
   int startSeconds = 0;;

   printf( "\n\n   holditPC program\n\n" );
   printf( "  This program will help you time how long you can hold your breath.\n" );
   printf( "  You take a breath and hold it, then press the 'enter' key.\n" );
   printf( "  When you *HAVE* to exhale, let your breath out and press 'enter' again.\n" );
   printf( "  The program will tell you the duration to the nearest second.\n\n" );
   printf( "      Press 'enter' when ready:" );
   getchar();

   startSeconds = time( 0 );
   printf( "      Press 'enter' when you have to exhale:" );
   getchar();
   endSeconds = time( 0 );
   elapsedTime = endSeconds - startSeconds;
   printf( "\n\n  You held your breath for %d seconds!\n\n", elapsedTime );

   return 0;

}

