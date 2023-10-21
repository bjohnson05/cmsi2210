/**
 * filename: randomTest.c
 * purpose: checks if function creates values that are
 *    in all four quadrants of the cartesian plane
 * author: Dr. Johndon
 * date: 2023-10-11
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Returns the 'c-squared' value of 'x' and 'y'
double squareOfDistanceToOrigin( double x, double y ) {
   return x * x + y * y;
}

// Returns a random value in [-1..1]
double randomValue() {
   return 2.0 * rand() / RAND_MAX - 1.0;
}

// The main program 'entry point'
int main() {
   srand( time(0) );
   int i = 0;
   while( i < 23 ) {
      double x = randomValue();
      double y = randomValue();
      printf( "\n  X: %9.6lf ~ Y: %9.6lf\n", x, y );
      i++;
}
   exit( 0 );

}
