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
import java.text.DecimalFormat;

public class Ex3_3 {

   public void usage() {
      System.out.println( "\n\n  Must enter four decimal numbers for:\n" +
                          "    principal amount\n" +
                          "    annual interest rate in percent\n" +
                          "    number of months to compound and list\n" +
                          "  Please try again!\n\n" );
   }

   public static void main( String [] args ) {
      Ex3_3 e = new Ex3_3();
      DecimalFormat df = new DecimalFormat( "#.00" );
      String[] count = { "first", "second", "third" };
      double principal = 0.0;
      double annualInterestRate = 0.0;
      double numberOfMonths = 0.0;
      double interest = 0.0;
      double newPrincipal = 0.0;

      if( args.length < 3 ) {
         e.usage();
         System.exit( 0 );
      } else {
         try {
            principal = Double.parseDouble( args[0] );
            annualInterestRate = (Double.parseDouble( args[1] ) );
            numberOfMonths = Double.parseDouble( args[2] );
         }
         catch( NumberFormatException nfe ) {
            System.out.println( "\n\n  Error on input, something was not a number." );
            e.usage();
         }
      }
      System.out.println( "\n\n  First " + numberOfMonths + " months of your loan: " );
      System.out.println( "   Initial Balance: $" + principal );
      System.out.println( "   Annual Interest Rate [percent]: " + annualInterestRate + "%" );

      newPrincipal = principal;
      interest = (annualInterestRate / 100) / 12;
      for( int i = 0; i < 3; i++ ) {
         newPrincipal = newPrincipal + (newPrincipal * interest);
         System.out.println( "  After " + count[i] + " month: " + df.format( newPrincipal ) );
      }
   }
}


























