#include <stdio.h>

void dump (void *p, int n); //chamada da funcao dump, recebe um ponteiro e um numero e imprime o conteuro da memoria

int main() {
  char c1 = 1;
  char c2 = '1';
  int i = 1;
  char v[] = "1"; //declaracao das variaveis

  printf("valor de c1: %d -> na memória: ",c1);
  dump(&c1, sizeof(c1)); //passa o endereço de c1 e seu tamanho para imprimir

  printf("\nvalor de c2: %d -> na memória: ",c2);
  dump(&c2, sizeof(c2)); //passa o endereço de c2 e seu tamanho para imprimir

  printf("\nvalor de i: %d -> na memória: ",i);
  dump(&i, sizeof(i)); //passa o endereço de i e seu tamanho para imprimir 

  printf("\nvalor de v: %s -> na memória: ",v);
  dump(v, sizeof(v)); //passa o endereço de v e seu tamanho(2 bytes) para imprimir

  printf("\n");
  return 0;
}

//resumidamente, esse codigo cria variaveis e as imprime junto de seu tamanho em bytes