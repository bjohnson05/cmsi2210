/**
*  @authors: Maya Epps and Anacan Mangelsdorf
*  filename:  whichEndIsUp.c
*  thanks to https://www.geeksforgeeks.org/little-and-big-endian-mystery/ for help on endianness
*
*  to compile/link: gcc whichEndIsUp.c -o whichEndIsUp
*  to run:  ./whichEndIsUp
*/
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

/**
 * @brief Returns true if the machine is in Network Byte Order (big endian)
 * false if little endian
 */
bool whichEndIsUp() {
    unsigned long testInt = (unsigned long)0x123456789;
    // get the address of the long, but pretend it only points to 8 bits
    uint8_t* testPointer = (uint8_t*)&testInt;
    // Check whether those 8 bits are the first or last 8 bits of testInt
    if (*testPointer == (uint8_t)0x12) {
        return true;
    } else {
        return false;
    }
}

int main() {
    printf("Is this machine big endian?\n%s\n", whichEndIsUp() ? "yes" : "no");
}