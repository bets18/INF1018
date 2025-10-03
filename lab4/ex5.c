#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", (void*)p1, *p1);
    p1++;
  }
}

int main (void) {
  signed char sc = -1;
  unsigned int ui = sc;

  printf("Valor de signed char sc: %d\n", sc);
  printf("Valor de unsigned int ui: %u\n", ui);

  printf("\n--- Conteúdo da memória para 'ui' ---\n");
  dump (&ui, sizeof(ui));

  return 0;
}