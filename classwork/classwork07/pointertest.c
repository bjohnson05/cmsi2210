/*
 *  pointertest.c
 *    demonstrates some simple pointer stuff
 */
 #include <stdio.h>
 #include <stdlib.h>

 int main() {

   int x = 5;           // a normal variable x
   int* p = &x;         // a pointer to where x is stored
   int* q = NULL;       // a pointer to nothing at this point

  // this is how we allocate space for something
   int* r = (int *)malloc( sizeof(int) );

  // this is how we allocate space for 100 somethings
   int* s = (int *)malloc( 100 * sizeof(int) );

   printf( "%d %d %d", *p, *r, s[20] );
   printf( "%d", *q );  // this will CRASH because it's NULL

   free(r);             // we have to "free" things
   free(s);             //    when we allocate space
  // But we do not free p or q

}
