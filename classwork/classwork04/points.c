#include <stdio.h>

int main( int argc, char * argv[] ) {

   int i = 23;
   int *p2i = &i;
   int **p2p2i = &p2i;

   printf( "\n   The value of i is %d\n", i );
   printf( "   The value of p2i [the address of i] is %d\n", p2i );
   printf( "      or using 'p' specifier: %p\n", p2i );
   printf( "   The value of p2p2i [the address of p2i] is %d\n", p2p2i );
   printf( "      or using 'p' specifier: %p\n", p2p2i );

}
