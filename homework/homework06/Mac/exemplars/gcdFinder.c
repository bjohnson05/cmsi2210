// Maya Epps and Anacan Mangelsdorf
// Homework 6, problem 2
// To run on MacOS: nasm -fmacho64 findGCD.nasm
//                  gcc GCDFinder.c findGCD.o -o GCDFinder
//                  ./GCDFinder

#include <assert.h>
#include <stdio.h>

int64_t findGCD(int64_t, int64_t);

int main() {
    assert(findGCD(10, 3) == 1);
    assert(findGCD(3, 10) == 1);
    assert(findGCD(1024, 12) == 4);
    assert(findGCD(12, 1024) == 4);
    assert(findGCD(30, 30) == 30);
    assert(findGCD(30, 15) == 15);
    assert(findGCD(15, 30) == 15);
    assert(findGCD(30, 1) == 1);
    assert(findGCD(1, 30) == 1);
    assert(findGCD(0, 100) == 100);
    assert(findGCD(100, 0) == 100);
    assert(findGCD(18, 27) == 9);

    printf("All clear!\n");
}