/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  int sum = 0;
  for (i = 0, p = nums; i != 4; i++, p++)
    sum += *p;
  printf("%d\n", sum);
  return 0;
}
*/

.data
nums:  .int  10, -21, -30, 45
Sf:  .string "%d\n"    # string de formato para printf

.text
.globl  main
main:

  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)
  movq    %r12, -16(%rbp)

  movl  $0, %ebx  /* ebx = 0; */
  movq  $nums, %r12  /* r12 = &nums */
  movl $0, %eax

  L1:
  cmpl  $4, %ebx  /* if (ebx == 4) ? */
  je  L2          /* goto L2 */

  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %eax, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */