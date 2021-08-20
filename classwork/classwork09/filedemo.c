/*
 * filename: filedemo.c
 *    demonstration of file I/O
 */
#include <stdio.h>
#include <ctype.h>

int main( int argc, char * argv[] ) {
   if( argc != 3 ) {
      puts( "Exactly two command line arguments needed" );
      return 1;
   } else {
      FILE* in = fopen( argv[1], "r" );
      if( !in ) {
         printf( "File %s does not exist\n", argv[1] );
         return 2;
      }
      FILE* out = fopen( argv[2], "w" );
      while( 1 ) {
         int c = fgetc( in );
         if( c == EOF ) break;
         fputc( toupper(c), out );
      }
      fclose( in );
      fclose( out );
      return 0;
   }
}
