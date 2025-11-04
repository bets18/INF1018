/*struct X {
short val0;
int val1;
int val2;

val0 2 bytes
2 bytes de padding
val1 4 bytes
val2 4 bytes
4 bytes de padding 

};
int foo (struct X vals[], int x, int y) {
if (x < y) {
return vals[x].val1;
}
else
return vals[x].val2;
}

vals -> rdi
x -> esi 
y -> edx 
*/

.text 
.globl foo
foo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %r12, -4(%rbp)

    movl    %esi, %r12d
    imull   $16, %r12d
    addq    %rdi, %r12d

if:
    cmpl     %esi, %edx
    je      else
    movq    -8(%rdi), %eax
    ret

else:
    movq    -12(%rdi), %eax
    ret