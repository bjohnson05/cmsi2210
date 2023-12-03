/**
*  @authors: Maya Epps and Anacan Mangelsdorf
*  filename:  makeNBO.c
*  thanks to https://www.geeksforgeeks.org/little-and-big-endian-mystery/ for help on endianness
*  thanks to https://stackoverflow.com/questions/12120426/how-do-i-print-uint32-t-and-uint16-t-variables-value
*  to compile/link: gcc makeNBOC.o makeNBOCtest.c -o makeNBOCtest
*  to run: ./makeNBOCtest
*/

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool whichEndIsUp();
uint32_t makeNBO(uint32_t);

int main(int argc, char* argv[]) {
    uint32_t number;
    if (argc < 2) {
        printf("Must input a 32-bit integer from the commandline\n");
        return 1;
    }

    sscanf(argv[1], "%" SCNu32, &number);
    printf("The result of makeNBO %" SCNu32, number);
    printf(" is: 0x%.8" SCNx32, makeNBO(number));
    printf("\n\n");

    // some tests
    if (whichEndIsUp()) {
        printf("this machine is big endian, testing accordingly...\n");
        // should see no changes
        assert(0x00000001 == makeNBO(0x00000001));
        assert(0x01020304 == makeNBO(0x01020304));
        printf("...all clear! hurrah!\n");
    } else {
        printf("this machine is little endian, testing accordingly...\n");
        assert(0x00000001 == makeNBO(0x01000000));
        assert(0x04030201 == makeNBO(0x01020304));
        printf("...all clear! hurrah!\n");
    }
}