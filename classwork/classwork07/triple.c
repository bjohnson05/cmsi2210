/*
 *  file: triple.c
 */

#include <stdio.h>

int main() {
    int a, b, c;              // declare three integers

    printf("     A     B     C\n");    // header line 1
    printf("------------------\n");    // header line 2
    for (c = 1; c <= 100; c++) {
        for (b = 1; b <= 100; b++) {
            for (a = 1; a <= 100; a++) {
                if (a * a + b * b == c * c) {
                    printf("%6d%6d%6d\n", a, b, c);
                } else {
                   // nothing here, just to show 'else'
                }
            }
        }
    }
    return 0;
}
