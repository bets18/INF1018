#include <stdio.h>
void dump (void *p, int n) {
    unsigned char *p1 = (unsigned char *) p;
    while (n--) {
        printf("%p - %02x\n", p1, *p1);
        p1++;
    }
}
struct X {
    int dict;
    int *p;
    char c;
};

int v[] = {7, 8, -1, 3};
struct X x = {-10, &tams[2], 'c'};


int main (void) {
    dump (&x, sizeof(X));
    return 0;
}