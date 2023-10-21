/*
 * f-test.c
 *   show some array stuff
 */

#include <stdio.h>

int f() {
   int x;
   int a[4];
   int y;
   int z = 23;
   a[5] = 100;
   printf( "\n\n" );
   printf( "     x: %d\n", x );
   printf( "  a[0]: %d\n", a[0] );
   printf( "  a[1]: %d\n", a[1] );
   printf( "  a[2]: %d\n", a[2] );
   printf( "  a[3]: %d\n", a[3] );
   printf( "  a[4]: %d\n", a[4] );
   printf( "  a[5]: %d\n", a[5] );
   printf( " a[-1]: %d\n", a[-1] );
   printf( "     y: %d\n", y );
   printf( "     z: %d\n\n", z );
   return y;
}

int main() {
   int myY = f();
   printf( "\n\n   Back in main, myY: %d\n\n", myY );
   return 0;
}
