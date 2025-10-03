#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main(void) {
    int i = 10000;
    long l = 10000;
    short s = 10000;
    char c = 'a';
    char str[] = "7509";

    dump(&i, sizeof(i));
    dump(&l, sizeof(l));
    dump(&s, sizeof(s));
    dump(&c, sizeof(c));
    dump(str, sizeof(str));

    char ascii_chars[] = {'A', ' ', '\n', '$'};
    dump(ascii_chars, sizeof(ascii_chars));

    return 0;
}