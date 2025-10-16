/*
int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
}
*/

.data
printa: .string "numero: "
reada: .string "%d"

.text
.globl novonum
novonum:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    movq    $printa, %rdi
    movl    $0, %eax
    call    printf

    movq    $reada, %rdi
    leaq    -4(%rbp), %rsi
    call    scanf
    
    movl -4(%rbp), %eax
    leave
    ret