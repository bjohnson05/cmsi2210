

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ENTRY 25

int main( int argc, char * argv[] ) {

   char input[10];
   char storage[MAX_ENTRY][10];
   int  values[MAX_ENTRY];

   printf( "   hello, world!\n" );
   for( int i = 0; i < MAX_ENTRY; i++ ) {
      printf( "\n  enter an integer: " );
      scanf( "%d", &input );
      // fgets( input, 10, stdin );
      printf( "\n     got: %d", input );
      strcpy( storage[i], input );
   }
   for( int i = 0; i < MAX_ENTRY; i++ ) {
      printf( "storage[%d]: %s\n", i, storage[i] );
   }
}
