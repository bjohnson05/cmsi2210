/*
 * filename: makeNBO.c
 * purpose:  takes a number as a command line argument and
 *    swaps its byte order to make it compatible with network
 *    messages which are big-endian
 *
 * NOTE: this program is intended for PC, but should run on either
 *    Mac or PC since there is no code that is platform specific
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <inttypes.h>

bool machineIsLittleEndian() {
  unsigned int x = 0x76543210;
  char *c = (char*) &x;
  return (*c == 0x10);
}

uint64_t makeBigEndian32( uint64_t number ) {
   uint64_t retValue = 0;
   uint64_t byte0, byte1, byte2, byte3;
   byte0 = (number & 0x00000000000000FF) >> 0 ;
   byte1 = (number & 0x000000000000FF00) >> 8 ;
   byte2 = (number & 0x0000000000FF0000) >> 16;
   byte3 = (number & 0x00000000FF000000) >> 24;
   retValue = ((byte0 << 24) | (byte1 << 16) | (byte2 << 8) | (byte3 << 0));
   return retValue;

}

uint64_t makeBigEndian64( uint64_t number ) {
   uint64_t retValue = 0;
   uint64_t byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7;
   byte0 = (number & 0x00000000000000FF) >> 0 ;
   byte1 = (number & 0x000000000000FF00) >> 8 ;
   byte2 = (number & 0x0000000000FF0000) >> 16;
   byte3 = (number & 0x00000000FF000000) >> 24;
   byte4 = (number & 0x000000FF00000000) >> 32;
   byte5 = (number & 0x0000FF0000000000) >> 40;
   byte6 = (number & 0x00FF000000000000) >> 48;
   byte7 = (number & 0xFF00000000000000) >> 56;
   retValue = ((byte0 << 56) | (byte1 << 48) | (byte2 << 40) | (byte3 << 32) |
               (byte4 << 24) | (byte5 << 16) | (byte6 << 8) | (byte7 << 0));
   return retValue;

}
