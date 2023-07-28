
#include <stdio.h>

int main( int argc, char * argv[] ) {

   int number1, number2, number3;
   int *p1, *p2, *p3;
   printf( "\n\n   This program prints the largest of three values.\n" );
   printf( "     You will enter three integers when prompted.\n" );
   printf( "     The program uses pointers to find the max.\n\n" );

  //taking input from user
   printf( "   Enter First Number: " );
   scanf( "%d", &number1 );
   printf( "   Enter Second Number: " );
   scanf( "%d", &number2 );
   printf( "   Enter Third Number: " );
   scanf( "%d", &number3 );

  //assigning the address of input numbers to pointers
   p1 = &number1;
   p2 = &number2;
   p3 = &number3;
   if( *p1 > *p2 ) {
      if( *p1 > *p3 ) {
         printf( "\n\n   %d is the largest number\n", *p1);
         printf( "     and its address is 0x%016X\n", p1 );
      } else {
         printf( "\n\n   %d is the largest number\n", *p3);
         printf( "     and its address is 0x%016X\n", p3 );
      }
   } else {
      if( *p2 > *p3 ) {
         printf( "\n\n   %d is the largest number\n", *p2);
         printf( "     and its address is 0x%016X\n", p2 );
      } else {
         printf( "\n\n   %d is the largest number\n", *p3);
         printf( "     and its address is 0x%016X\n", p3 );
      }
   }
   return 0;
}
