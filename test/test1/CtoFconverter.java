import java.util.Scanner;
class CtoFconverter {
   public static void main( String args[] ) {
      System.out.println( "Enter a temperature in degrees Fahrenheit: ");
      Scanner myInput = new Scanner( System.in );
      double degreesF = Double.parseDouble(myInput.nextLine());
      System.out.println( degreesF + " degrees F is " + (((degreesF - 32.0) * 5.0) / 9.0) + " degrees C." );
   }
}