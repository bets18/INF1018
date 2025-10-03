#include <stdio.h>

void dump (void *p, int n) { //imprime o conteudo da memoria byte a byte
// p e ponteiro generico para o dado
// n e numero de bytes a serem exibidos

  unsigned char *p1 = p; //ponteiro para acessar 
  while (n--) { //enquanto n maior que 0
    printf("%d ", *p1); //imprime valor do byte
    p1++; //avanca para o proximo
  }
}