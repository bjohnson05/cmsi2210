/**
 *  filename: tasm.java
 *  purpose:  write an assembler for the tiny asm language
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Tasm {

   private String inputFile = null;
   private String outputFile = null;
   private BufferedReader br = null;
   private BufferedWriter bw = null;

   private static final boolean DEBUG_ON = true;

   private String[] mnemonics = { "LOAD", "STORE", "READ", "WRITE",
                                  "ADD",  "SUB",   "MUL",  "DIV",
                                  "MOD",  "AND",   "OR",   "XOR",
                                  "JMP",  "JZ",    "JLZ",  "JGZ" };
   private String[] opCodes = { "0000", "0001", "0010", "0011",
                                "0100", "0101", "0110", "0111",
                                "1000", "1001", "1010", "1011",
                                "1100", "1101", "1110", "1111" };

  /**
   * outputs a message on how to use this assembler
   */
   public void usage() {
      System.out.println( "\n   Usage:\n" +
                          "     java Tasm <filename>.tasm\n" +
                          "   Please try again.\n\n" );
   }

  /**
   * open the input '.tasm' file
   * @param filename String containing input file name
   * @return BufferedReader on the open file
   * @throws FileNotFoundException
   */
   public BufferedReader openInput( String filename ) {
      inputFile = filename;
      File file = null;
      BufferedReader br = null;
      try {
         file = new File( filename );
         br = new BufferedReader( new FileReader( file ) );
      }
      catch( FileNotFoundException fnfe ) {
         System.out.println( "\n   Sorry, no such file as " + filename );
         System.exit( -1 );
      }
      return br;
   }

  /**
   * open the output '.tasm' file
   * @return BufferedReader on the open file
   * @throws IOException
   */
   public BufferedWriter openOutput() {
      String outputFile = inputFile.substring( 0, inputFile.indexOf('.') ) + ".obj";
      BufferedWriter bw = null;
      try {
         bw = new BufferedWriter( new FileWriter( outputFile ) );
      }
      catch( IOException ioe ) {
         System.out.println( "\n   Sorry, cannot open output file " + outputFile );
         System.exit( -1 );
      }
      return bw;
   }

   public String parseOpcode( String fileLine ) {
      String opReturnString = "";
      for( int i = 0; i < 15; i++ ) {
         if( fileLine.contains( mnemonics[i] ) ) {
            opReturnString = opCodes[i];
            break;
         }
      }
      if( DEBUG_ON ) System.out.println( "opcode is: " + opReturnString );
      return opReturnString;
   }

//   public String decodeOpcode( String fileLine ) {


   public static void main( String [] args ) {

      System.out.println( "\n   Tiny Assembler v. 1.0.0 2021-01-08\n" );
      Tasm t = new Tasm();
      if( 0 == args.length ) {
         t.usage();
         System.exit( 0 );
      }
      System.out.println( "   Assembling " + args[0] );
      t.br = t.openInput( args[0] );
      t.bw = t.openOutput();
      for( int i = 0; i < 15; i++ ) {
         System.out.println( t.parseOpcode( t.mnemonics[i] + "  blah" ) );
      }

      System.exit( 0 );
   }

}
