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
   printf( "\n\n   x: %d, a[0]: %d, a[1]: %d, a[2]: %d, a[3]: %d, a[4]: %d, a[5]: %d, y: %d, z: %d\n\n",
                   x,     a[0],     a[1],     a[2],     a[3],     a[4],     a[5],     y,     z );
}

int main() {
   f();
   return 0;
}
