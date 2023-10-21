/*
 * file: unsignedexample.c
 * This is an example of three cases where mixing signed and unsigned values cause
 * trouble.
 */

#include <stdio.h>
#include <string.h>

void expect(int condition) {
   printf("%s\n", condition ? "Cool" : "Hey, WTF?");
}

/* FAIL! (Example from Bryant and O'Hallaron, page 77) */
int longerThan(char *s, char *t) {
   return strlen(s) - strlen(t) > 0;  /* FAIL */
}

int main() {
   int x = -1;
   int y = 1000000000;
   unsigned z = 3000000000;

   expect(x < y);
   expect(y < z);
   expect(x < z);
   printf( "  strlen(Jen): %d\n", strlen( "Jen" ) );
   printf( "  strlen(Jennifer): %d\n", strlen( "Jennifer" ) );
   printf( "  strlen(s) - strlen(t): %d\n", strlen( "Jen" ) - strlen( "Jennifer" ) );
   printf( "  strlen(s) - strlen(t) > 0: %d\n", strlen( "Jen" ) - strlen( "Jennifer" ) > 0 );
   printf( "  (strlen(s) - strlen(t)) > 0: %d\n", (strlen( "Jen" ) - strlen( "Jennifer" )) > 0 );
   printf( "  strlen(s) - (strlen(t) > 0): %d\n", strlen( "Jen" ) - (strlen( "Jennifer" ) > 0) );
   expect(!longerThan("Jen", "Jennifer"));
   printf( "  -5 > 0: %d or as %s\n", (-5 > 0), (-5 > 0) );
}
