
def odd( x ):
   return x % 2 != 0

def balance( p, n, r, t ):
   return p * (1 + r/n) ** (n * t)

print( "   the number -35 is odd: ", odd( -35 ) )

print( "   the number 3278947239863000  is odd: ", odd( 3278947239863000 ) )

print( "   balance on $1000 after 5 months compounded annually at 3 percent: ${:.2f}".format(balance( 1000, 12, 0.03, 5 )) )
