/*
 * filename: gcdFinderTest.c
 * purpose: call the nasm function to find the gcd
 *
 * assemble nasm function: nasm -f win32 gcdFinder.nasm
 * compile/link program:   gcc -m32 gcdFinderTest.c gcdFinder.o -o gcdFinderTest.exe
 */

#include <stdio.h>
#include <inttypes.h>

extern uint64_t gcdFinder( uint64_t, uint64_t );

int main() {

   uint64_t x = 0;
   uint64_t y = 0;
   uint64_t gcd = 0;

   printf( "\n\n  Enter first number: " );
   scanf( "%llu", &x );
   printf( "  Enter second number: " );
   scanf( "%llu", &y );

   gcd = gcdFinder( x, y );
   printf( "\n    GCD is %10llu\n\n", gcd );

   return 0;
}
