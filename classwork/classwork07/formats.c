/*
 * formats.c
 * program to demonstrate different format specifiers
 *    for the same variable
 */
#include <stdio.h>

int main() {

   int value = 97;
   printf( "value: %c as char,\n" \
           "value: %d as int,\n" \
           "value: %u as unsigned int,\n" \
           "value: %f as float,\n" \
           "value: %f as cast to float\n",
            value, value, value, value, (float)value );

   return 0;
}
