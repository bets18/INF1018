#include <stdio.h>

unsigned char switch_byte(unsigned char x) {
  unsigned char mais = (x & 0xF0) >> 4;
  unsigned char menos  = (x & 0x0F) << 4;
  return mais | menos;
}

int main() {
  unsigned char original = 0xAB;
  unsigned char invertido = switch_byte(original);

  printf("Original: 0x%02X\n", original);
  printf("Invertido: 0x%02X\n", invertido);
  return 0;
}