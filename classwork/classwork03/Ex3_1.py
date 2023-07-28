# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  filename: Ex3_1.c
#  purpose:  implement inclass exercise 1, week 3 in Java
#  @author:  Dr. Johnson
#  @date:    2020-12-31
#  Note:     see https://bjohnson.lmu.build/cmsi284web/week03.html
#            actually does both Ex3-1 and Ex3-2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

import sys

def mySplit( s ):
   return [char for char in s]

def main():

   NATO     = [ "alpha", "bravo", "charlie", "delta", "echo", "foxtrot", "golf", "hotel",
                "india", "juliett", "kilo", "lima", "mike", "november", "oscar", "papa",
                "quebec", "romeo", "sierra", "tango", "uniform", "victor", "whiskey",
                "xray", "yankee", "zulu" ]
   MORSE    = [ "*-", "-***", "-*-*", "-**", "*", "**-*", "--*", "****", "**", "*---",
                "-*-", "*-**", "--", "-*", "---", "*--*", "--*-", "*-*", "***", "-",
                "**-", "***-", "*--", "-**-", "-*--", "--**" ]
   ALPHABET = "abcdefghijklmnopqrstuvwxyz";

   i = 0;
   j = 0;
   k = 0;

   print( "\n\n  Message Encoder\n\n" );
   if( len(sys.argv) == 1 ):
      print("  Please try again and enter a word or phrase on the command line.\n\n" )
   else:
      for word in sys.argv[1:]:
         x = mySplit( word.lower() )
         for letter in x:
            print( NATO[ALPHABET.index(letter)] )
         print()
      for word in sys.argv[1:]:
         x = mySplit( word.lower() )
         for letter in x:
            print( MORSE[ALPHABET.index(letter)] )
         print()

main()
