/**
*  @authors: Maya Epps and Anacan Mangelsdorf
*  filename:  makeNBO.c
*  thanks to https://www.geeksforgeeks.org/little-and-big-endian-mystery/ for help on endianness
*  thanks to https://stackoverflow.com/questions/12120426/how-do-i-print-uint32-t-and-uint16-t-variables-value
*  to compile/link: gcc -c makeNBOC.c
*/
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

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

uint32_t makeNBO(uint32_t number) {
    if (whichEndIsUp()) {
        // if computer is big endian, don't change it
        return number;
    }

    // Masks to get the individual bytes
    uint32_t maskByte1 = 0x000000FF;
    uint32_t maskByte2 = 0x0000FF00;
    uint32_t maskByte3 = 0x00FF0000;
    uint32_t maskByte4 = 0xFF000000;

    // Get each byte and shift it to its correct final location
    uint32_t resultByte4 = number & maskByte1;
    resultByte4 = resultByte4 << 24;
    uint32_t resultByte3 = number & maskByte2;
    resultByte3 = resultByte3 << 8;
    uint32_t resultByte2 = number & maskByte3;
    resultByte2 = resultByte2 >> 8;
    uint32_t resultByte1 = number & maskByte4;
    resultByte1 = resultByte1 >> 24;

    // Concatenate all the bytes
    return (resultByte1 | resultByte2 | resultByte3 | resultByte4);
}

//-----------------------------------------
// helper method for NASM

void printU32(uint32_t before, uint32_t after) {
    printf("raw number       : %.08" SCNu32, before);
    printf("\n");
    printf("raw number as hex: %.08" SCNx32, before);
    printf("\n");
    printf(" converted to NBO: %.08" SCNu32, after);
    printf("\n");
    printf("       NBO as hex: %.08" SCNx32, after);
    printf("\n\n");
}