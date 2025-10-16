/*
int bemboba (int num) {
  int local[4];
  int *a;
  int i;

  for (i=0,a=local;i<4;i++) {
    *a = num;
    a++;
  }
  return addl (local, 4);
}
*/

.data

#int num -> %edi

.text
.globl bemboba
bemboba:

    pushq   %rbp
    movq    %rsp, %rbp
    subq    $?, %rsp

    

