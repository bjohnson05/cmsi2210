
/*
 * assertTest.c
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
    assert(gcd(309,66) == 3);                               // should pass
    assert(gcd(66, 309) == 3);                              // should pass
    assert(gcd(3113041662, 11570925) == 462837);            // should pass
    assert(gcd(427366239731, 4273650023214) == 6499);       // should pass
    assert(gcd(427366239731687, 4268765973650023214) == 1); // should pass
    assert(gcd(427366239731687, 4268765973650023214) == 2); // should FAIL
    puts("All tests passed");
    return 0;
}
