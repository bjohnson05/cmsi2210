/*
 *  file:  mouseandcheese.c
 *  plays a simple version of a word-guessing game
 *  Rules
 *     The goal of the game is to prevent the mouse from reaching the cheese
 *     You are given a word that you must guess, one letter at a time
 *     You have ten guesses total, meaning the mouse has ten steps to reach the cheese
 *     For each letter you guess right, the mouse stays put
 *     For each letter you guess wrong, the mouse moves one step closer to the cheese
 *     For each correct guess, the letter is displayed in the word
 *     If the mouse reaches the cheese before you guess the word, you lose the game
 *     If you guess the word before the mouse reaches the cheese, you win the game
 *     For multiple occurrences of a letter in a word, one correct guess will display
 *       all of them; for example, if there are three E's in the word, one guess of 'E'
 *       will display all three
 *  Game Mechanics
 *     The main game must be in a file called mouseandcheese.c
 *     The word is selected randomly from an array of words which are strings
 *     Initially all the letters are indicated by underscores, dashes, or some other
 *       non-letter you pick
 *     You must keep track of which letters have been used
 *     You must keep track of the number of incorrect guesses
 *     You must display the number of steps remaining before the mouse reaches the cheese
 *       after each guess
 *     You must display the current state of the word after each guess; for example, if
 *       the word is NANDGATE and the letters N and A have been correctly guessed, and the
 *       letters S, T, and I, have been incorrectly guessed, after five guesses you should
 *       display:
 *
 *     N A N _ _ A _ _    with seven steps left
 *
 *     This is a virtual abstraction game; you are NOT required to make a drawing of a
 *       mouse, the cheese, the steps, or any other part of the game except the letters
 *       and steps as shown above
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define  TRUE        1
#define  FALSE       0
#define  MAX_GUESSES 10
#define  WORD_COUNT  16

/*
 * helper function that displays the game instructions and
 *    waits for the user to press enter to continue
 */
void instructions() {
   printf( "\n\n   MOUSE AND CHEESE GAME\n\n   =====================\n\n" );
   printf( "  The purpose of the game is to keep the mouse from getting the cheese.\n" );
   printf( "  You must guess the word indicated by the blanks below.\n" );
   printf( "  You have 10 guesses.  If you guess right, the mouse sits still.\n" );
   printf( "  If you guess a letter that is NOT in the word, the mouse moves one step.\n" );
   printf( "  If the mouse reaches the cheese, you lose, if you guess the word first, you WIN!\n" );
   printf( "\n\n     Press the 'enter' key to begin:" );
   fflush( stdin );
   getchar();
}

/*
 * helper function to get the user input letter
 *    returns the letter in uppercase
 */
char getLetterFromUserInUppercase() {
   char letter[2];
   printf( " Enter your letter: " );
   fflush( stdout );
   scanf( "%s", letter );
   for( int i = 0; letter[i] != '\0'; i++ ) {
      if(letter[i] >= 'a' && letter[i] <= 'z') {
         letter[i] = letter[i] - 32;
      }
   }
   return letter[0];
}

/*
 * main program is really just a loop that runs while both the
 *    "allGuessed" flag is false and the number of guesses is
 *    less than ten.
 */
int main() {

   char guess;
   char words[WORD_COUNT][15]  = { "NANDGATE", "XORGATE", "CPU", "MEMORY",
                                   "MOTHERBOARD", "CHEESE", "MOUSE", "HDMIPORT",
                                   "HARDDRIVE", "RAM", "COOLINGFAN", "FLOATINGPOINT",
                                   "COMPILER", "LINKLOADER", "LINUX", "WINDOWS" };

   int found      = FALSE;
   int allGuessed = FALSE;
   int guesses    = 0;
   int index      = 0;
   int k          = 0;

   srand( time(0) );
   index = (rand() % WORD_COUNT);

  /*
   * Initialize the 'mask' array
   *   The purpose of the mask array is to provide a way to check and
   *   track correct letter guesses:
   *     mask[i] is true if the character s[i] has been guessed.
   * The mask array must be allocated to have one slot per letter in the
   *   word being guessed.  Since the word is selected at random, the
   *   array must be allocated dynamically so it is the same length as
   *   the number of letters in the word each time, then initialized to 
   *   all false using a loop.
   */

  /*
   * Print the instructions
   */
   instructions();

  // Loop over each round of guessing
   while( /* what two conditions are needed here? */ ) {
     // Print word with underscores for unguessed letters
      printf( "\n  The word is now: " );
      for( int j = 0; j < N; ++j ) {
        // TODO: fill this in!
      }
      printf( "    You've used %d of %d guesses...\n", guesses, MAX_GUESSES );

     // Get player's next guess
      guess = getLetterFromUserInUppercase();

     // Mark as true all mask positions corresponding to guess
     //  if they are correct!

     // Determine whether the player has won!
   }

  // Print victory message!
   if( guesses == MAX_GUESSES ) {
      printf("\n\n   YOU LOSE! The word is \"%s\".\n", words[index]);
   } else {
      printf("\n\n   Victory! The word is \"%s\".\n", words[index]);
   }

   return 0;
}
