#include <stdio.h>
#include <stdlib.h>

int main( int argc, char * argv[] ) {

   printf( "\n\n   You entered %d arguments\n", argc );

   int sum = 0;

   if( argc < 3 ) {
      printf( "   C'mon, gimme something to work with here!!\n" );
   } else {
      for( int i = 1; i < argc; i++ ) {
         printf( "      arg[%2d] is %s\n", i, argv[i] );
         sum += atoi( argv[i] );
      }
      printf( "total is: %d\n", sum );
   }
   printf( "   ...and the name of this program is '%s'", argv[0] );
   printf( "      The average is: %lf \n", (double)sum / (argc - 1) );
   printf( "\n\n" );

   exit( 0 );

}
