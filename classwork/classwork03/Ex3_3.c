/** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  filename: Ex3_3.java
 *  purpose:  implement inclass exercise 3, week 3 in Java
 *  @author:  Dr. Johnson
 *  @date:    2020-12-31
 *  description: program to print out the balances after the first three
 *               months.  Use the equation that is given above in the
 *               function description area of the page.  Implements the
 *               calculation p * ((1 + (r/n))**(n*t)) for three months
 *  Note:     see https://bjohnson.lmu.build/cmsi284web/week03.html
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void usage() {
   printf( "\n\n  Must enter three decimal numbers for:\n" );
   printf( "    principal amount\n" );
   printf( "    annual interest rate in percent" );
   printf( "    number of months to compound and list\n" );
   printf( "  Please try again!\n\n" );
}

int main( int argc, char * argv[] ) {

   double principal = 0.0;
   double annualInterestRate = 0.0;
   double numberOfMonths = 0.0;
   double interest = 0.0;
   double newPrincipal = 0.0;

   if( argc < 3 ) {
      usage();
      exit( 0 );
   } else {
         principal = atof( argv[1] );
         annualInterestRate = atof( argv[2] );
         numberOfMonths = atof( argv[3] );
   }
   printf( "\n\n  First %d months of your loan: \n", (int)numberOfMonths );
   printf( "    Initial Balance: $%8.2f\n", principal );
   printf( "    Annual Interest Rate [percent]: %4.3f\n", annualInterestRate );

   newPrincipal = principal;
   interest = (annualInterestRate / 100) / 12;
   for( int i = 0; i < (int)numberOfMonths; i++ ) {
      newPrincipal = newPrincipal + (newPrincipal * interest);
      printf( "  After %d month: new principal: %8.2f\n", (i + 1), newPrincipal );
   }
}
