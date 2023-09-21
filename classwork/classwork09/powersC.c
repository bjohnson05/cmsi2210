#include <stdio.h>

int main() {

   int power = 1;
   int limit = 1000000;

   while( power <= limit ) {
      printf( "   %d\n", power );
      power += power;
   }

   return 0;

}
