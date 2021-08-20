/*
 * file: unsignedexample.c
 * This is an example of three cases where mixing signed and unsigned values cause
 * trouble.
 */

#include <stdio.h>
#include <string.h>

void expect(int condition) {
    printf("%s\n", condition ? "Cool" : "Hey, WTF?");
}

/* FAIL! (Example from Bryant and O'Hallaron, page 77) */
int longerThan(char *s, char *t) {
    return strlen(s) - strlen(t) > 0;  /* FAIL */
}

int main() {
    int x = -1;
    int y = 1000000000;
    unsigned z = 3000000000;

    expect(x < y);
    expect(y < z);
    expect(x < z);
    expect(!longerThan("Jen", "Jennifer"));
}
