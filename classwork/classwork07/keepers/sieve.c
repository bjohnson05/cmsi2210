/*
 * A program that displays all the prime numbers up to and
 * including 1000, using the famous algorithm of Erathostenes.
 * This is a C99 program, not a C90 program.
 *
 * The purpose of the program is only to illustrate arrays
 * assuming one has not yet seen pointers or command line
 * arguments, so it isn't very good.
 */

#include <stdio.h>
// #include <stdbool.h>

// To get primes up to and including 1000, the sieve has
// to have a slot at index 1000.  But indices must start
// at 0, so there have to be 1001 slots in the array.
#define SIZE 1001

// Fills the first n slots of array s with the given value.
void fillArray( bool s[], bool value, int n ) {
   for( int i = 0; i < n; i++ ) {
      s[i] = value;
   }
}

// This function writes false in each slot of the array
// corresponding to a nonprime number.  First, we know 0 and
// 1 are not prime.  Then for each value starting with 2, if
// the value is still thought to be prime, we write false in
// each slot corresponding to its multiples.
void checkOffComposites( bool s[], int n ) {
   s[0] = false;
   s[1] = false;
   for( int i = 2; i * i < n; i++ ) {
      if( s[i] ) {
         for( int j = i + i; j < n; j += i ) {
            s[j] = false;
         }
      }
   }
}

// This function writes out all the values which correspond to
// positions in a vector containing the value "true".  Each
// value is written to the standard output in a field of
// eight characters.
void displayTrueIndices( bool s[], int n ) {
   for( int i = 0; i < n; i++ ) {
      if( s[i] ) {
         printf( "%8d", i );
      }
   }
   printf( "\n" );
}

// main() just calls the worker functions.
int main() {
   bool sieve[SIZE];
   fillArray( sieve, true, SIZE );
   checkOffComposites( sieve, SIZE );
   displayTrueIndices( sieve, SIZE );
   return 0;
}
