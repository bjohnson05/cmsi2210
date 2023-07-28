#** ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#*  filename: Ex3_3.py
#*  purpose:  implement inclass exercise 3, week 3 in Python
#*  @author:  Dr. Johnson
#*  @date:    2020-12-31
#*  description: program to print out the balances after the first three
#*               months.  Use the equation that is given above in the
#*               function description area of the page.  Implements the
#*               calculation p * ((1 + (r/n))**(n*t)) for three months
#*  Note:     see https://bjohnson.lmu.build/cmsi284web/week03.html
#* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

start = int( input( "Enter the initial balance: " ) )
interest = int( input( "Enter the APR in percent: " ) )
duration = int( input( "Enter the number of months: " ) )
interest = float( (interest / 100) / 12 )
print( "interest is ", interest )
current = start
print( "At start,  balance is {c:8.2f}".format(c=current) )
for i in range (1, duration+1) :
    current = current + (current * interest)
    print( "After {i:3d} month, balance is {c:8.2f}".format(i=i,c=current) )
