
#include <stdio.h>
#include <stdlib.h>

int main( int argc, char * argv[] ) {

   char input[50];
   printf( "\n\n   Hello, World!\n\n" );

   printf( "   What's your name? " );
   gets( input );
   printf( "\n  Well then, hello %s!  Nice to see you today...\n\n", input );
   exit( 0 );

}
