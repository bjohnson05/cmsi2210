/*
 * filename: gcdFinderTest.c
 * purpose: call the nasm function to find the gcd
 *
 * assemble nasm function: nasm -f win32 gcdFinder.nasm
 * compile/link program:   gcc -m32 gcdFinderTest.c gcdFinder.o -o gcdFinderTest.exe
 */

#include <stdio.h>

extern int gcdFinder( int x, int y );

int main() {

   int x = 0;
   int y = 0;
   int gcd = 0;

   printf( "\n\n  Enter first number: " );
   scanf( "%d", &x );
   printf( "  Enter second number: " );
   scanf( "%d", &y );

   gcd = gcdFinder( x, y );
   printf( "\n    GCD is %10d\n\n", gcd );

   return 0;
}
