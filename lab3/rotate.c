#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n) {
  return (x << n) | (x >> (8 - n));
}

int main() {
  unsigned char x = 0x61;

  printf("Valor original: 0x%02X\n", x);

  for (int n = 1; n < 8; n++) {
    printf("rotate_left(%02X, %d) = 0x%02X\n", x, n, rotate_left(x, n));
  }
  return 0;
}
