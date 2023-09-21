
/*
 * assertTestExpanded.c
 * test out the assert library functions in C
 */

#include <stdio.h>
#include <stdint.h>
#include <assert.h>

uint64_t gcd(uint64_t x, uint64_t y) {
   return (0 == y) ? x : gcd( y, x % y );
}

int main() {
    int count = 0;
    printf( "\n\n   Demonstrating the 'assert()' function...\n\n" );
    printf( "     Testing 'gcd(309,66) == 3', should pass; if fails tests will stop.\n" );
    assert(gcd(309,66) == 3);                               // should pass
    printf( "     Testing 'gcd(66, 309) == 3', should pass; if fails tests will stop.\n" );
    assert(gcd(66, 309) == 3);                              // should pass
    printf( "     Testing 'gcd(3113041662, 11570925) == 462837', should pass; if fails tests will stop.\n" );
    assert(gcd(3113041662, 11570925) == 462837);            // should pass
    printf( "     Testing 'gcd(427366239731, 4273650023214) == 6499', should pass; if fails tests will stop.\n" );
    assert(gcd(427366239731, 4273650023214) == 6499);       // should pass
    printf( "     Testing 'gcd(427366239731687, 4268765973650023214) == 1', should pass; if fails tests will stop.\n" );
    assert(gcd(427366239731687, 4268765973650023214) == 1); // should pass
    printf( "     Testing 'gcd(427366239731687, 4268765973650023214) == 2', should fail; if fails tests will stop.\n" );
    assert(gcd(427366239731687, 4268765973650023214) == 2); // should FAIL
    printf( "     Testing 'gcd(427366239731687, 4268765973650023214) != 2', should pass; if fails tests will stop.\n" );
    assert(gcd(427366239731687, 4268765973650023214) != 2); // should FAIL
    puts("All tests passed");
    return 0;
}
