/*
 * filename: gcdFinder.c
 * purpose:  find the Greatest Common Denominator of two numbers
 *             using Euclid's algorithm which states:
 *
 *       return (b == 0) ? a : (gcd( b, a % b ))
 *
 * NOTE: this program is intended for PC, but should run on either
 *    Mac or PC since there is no code that is platform specific
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <assert.h>

#define DEBUG_ON 1

long long gcd_c( long long a, long long b ) {
   if( DEBUG_ON ) {
      printf( "   calculating: a = %llu and b = %llu and a mod b = %llu\n", a, b, (a % b) );
   }
   return (b == 0) ? a : (gcd_c( b, a % b ));
}

int main( int argc, char * argv[] ) {

   long long a = 0;
   long long b = 0;
   long long gcdValue = 0;

   if( argc != 3 ) {
      printf( "\n\n   Not enough arguments: two integers required.\n\n" );
      return( 1 );
   }

   for( int i = 0; i < strlen( argv[1] ); i++ ) {
      if( !isdigit(argv[1][i]) ) {
         printf( "\n\n   Wrong type arguments: two integers required.\n\n" );
         return( 2 );
      }
   }
   for( int i = 0; i < strlen( argv[2] ); i++ ) {
      if( !isdigit(argv[2][i]) ) {
         printf( "\n\n   Wrong type arguments: two integers required.\n\n" );
         return( 2 );
      }
   }
   a = strtoull( argv[1], NULL, 10 );
   b = strtoull( argv[2], NULL, 10 );

   printf( "\n\n    Greatest Common Denominator of %lld and %lld is %lld\n\n",
            a, b, gcd_c( a, b ) );

   return( 0 );
}
