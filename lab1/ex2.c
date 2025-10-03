#include <stdio.h>
#include <stdlib.h>

float foo (float pf); //chamada da funcao foo que esta em labaux.c (retorna pf+1)

int main (int argc, char **argv) {
  float f; //valor de entrada float

  if (argc!=2) { //verifica se quantidade de argumentos e diferente de 2
    printf ("uso do programa: %s <valor float>\n", argv[0]); //mostra a forma correta de usar o programa
    exit(0);
  }
  f = atof(argv[1]); //converte o 2 argumento para float
  printf ("foo(%.2f): %.2f\n", f, foo(f)); //chama funcao foo e imprime
  return 0;
}

//resumidamente: este codigo verifica a quantidade de argumentos passados
//se for diferente de 2 ele explica o certo e fecha
//se for exatamente 2, ele pega o segundo e usa a funcao foo para somar 1, printando o resultado