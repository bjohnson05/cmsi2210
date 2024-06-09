#include <stdio.h>

int func1( int value ) {
   printf( "   Inside func1, value is %d\n", value );
   value += 17;
   printf( "   Inside func1, after addition, value is %d\n", value );
   return 0;
}

int func2( int *value ) {
   printf( "   Inside func2, value is %d\n", *value );
   *value += 17;
   printf( "   Inside func2, after addition, value is %d\n", *value );
   return 0;
}

int main( int argc, char * argv[] ) {

   int i = 23;
   int *p2i = &i;
   int **p2p2i = &p2i;

   printf( "\n   The value of i is %d\n", i );
   printf( "   The value of p2i [the address of i] is %d\n", p2i );
   printf( "      or using 'p' specifier: %p\n", p2i );
   printf( "   The value of p2p2i [the address of p2i] is %d\n", p2p2i );
   printf( "      or using 'p' specifier: %p\n\n", p2p2i );

   printf( "   Before call to func1, i = %d\n", i );
   func1( i );
   printf( "   After call to func1, i = %d\n", i );

   printf( "   Before call to func2, i = %d\n", i );
   func2( &i );
   printf( "   After call to func2, i = %d\n", i );

}
