/*
 *  file:  outputs.c
 *  show the output of the same value as different types
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

   int value  = 97;
   float fval = 97.0;

   printf( "value: %c as char,\n" \
           "value: %d as int,\n" \
           "value: %ld as long,\n" \
           "value: %u as unsigned int,\n" \
           "value: %20.17f as float,\n" \
           "value: %20.17f as cast to float\n" \
           "value: %lf as double,\n" \
           "value: %20.17lf as cast to double\n",
            value, value, value, value, value, (float)value, value, (double)value );

   printf( "fval: %f as float,\n" \
           "fval: %lf as cast to double\n",
            fval, (double)fval );

   exit( 0 );
}
