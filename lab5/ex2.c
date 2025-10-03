#include <stdio.h>

struct X {
  int a;
  short b;
  int c;
};

int main() {
  struct X x = {0xa1a2a3a4, 0xb1b2, 0xc1c2c3c4};

  printf("Tamanho da struct X: %zu bytes\n\n", sizeof(struct X));

  printf("Conteúdo da memória:\n");

  unsigned char *ptr = (unsigned char *)&x;
  for (size_t i = 0; i < sizeof(struct X); i++) {
    printf("Byte %02zu: 0x%02x\n", i, ptr[i]);
  }

  return 0;
}