/** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  filename: Ex3_1.java
 *  purpose:  implement inclass exercise 1, week 3 in Java
 *  @author:  Dr. Johnson
 *  @date:    2020-12-31
 *  Note:     see https://bjohnson.lmu.build/cmsi284web/week03.html
 *            actually does both Ex3-1 and Ex3-2
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

public class Ex3_1 {

   private static final String[] NATO = { "alpha", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel",
                                          "india", "juliett", "kilo", "lima", "mike", "november", "oscar", "papa",
                                          "quebec", "romeo", "sierra", "tango", "uniform", "victor", "whiskey",
                                          "xray", "yankee", "zulu" };
   private static final String[] MORSE = { "*-", "-***", "-*-*", "-**", "*", "**-*", "--*", "****", "**", "*---",
                                           "-*-", "*-**", "--", "-*", "---", "*--*", "--*-", "*-*", "***", "-",
                                           "**-", "***-", "*--", "-**-", "-*--", "--**" };
   private static final String ALPHABET = "abcdefghijklmnopqrstuvwxyz";

   public static void main( String [] args ) {

      int k = 0;

      System.out.println( "\n\n  Message Encoder\n\n" );
      if( args.length == 0 ) {
         System.out.println( "\n  Please try again and enter a word or phrase on the command line.\n\n" );
         System.exit( 0 );
      } else {
         for( int i = 0; i < args.length; i++ ) {
            args[i] = args[i].toLowerCase();
         }
      }

      for( int i = 0; i < args.length; i++ ) {
         for( int j = 0; j < args[i].length(); j++ ) {
            System.out.println( "  " + NATO[ALPHABET.indexOf(args[i].charAt(j))] );
         }
         System.out.println( "\n" );
      }

      for( int i = 0; i < args.length; i++ ) {
         for( int j = 0; j < args[i].length(); j++ ) {
            System.out.println( "  " + MORSE[ALPHABET.indexOf(args[i].charAt(j))] );
         }
         System.out.println( "\n" );
      }

   }
}
