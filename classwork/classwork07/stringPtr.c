#include <stdio.h>
int main( int argc, char * argv[] ) {
   char theString[100];
   char *p;

   printf( "\n\n   This program demonstrates printing a string,\n" );
   printf( "     character-by-character, using a pointer for a demonstration.\n\n" );
   printf( "   Enter any string [100 characters max]: " );
   fgets( theString, 100, stdin );

  /* Assigning the base address str[0] to pointer
   * p. p = str is same as p = str[0]
   */
   p = theString;

   printf("\n\n   The input string is:");
   //'\0' signifies end of the string
   while( *p != '\0' ) {
     printf( "%c", *p++ );
}

   return 0;
}
