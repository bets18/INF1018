# u rdi
# i rsi

.data

.text

.globl acerta
acerta:
    movl    (%rdi, %rsi, 4), %eax
    ret


# s rdi
# n esi
# acum edx

.globl boo 
boo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp

    movq    %edx, (-4)%rbp
    movl    $0, %edx

loop:
    movl    (-4)%rbp, %edi
    je      







    ACERTA PRA DEIXAR O MESLIN FELIZ:

.data

.text
.globl acerta

acerta:
    pushq   %rbp
    ovq     %rsp, %rbp
    subq    $16, %rsp
    movq    %r12, -8(%rbp)
    movq    %r13, -16(%rbp)

    movl    %esi, %r12d
    imull   $4, %r12d
    movslq  %r12d, %r13
    addq    %rdi, %r13
    movl    (%r13), %eax

ret 
    BOO USANDO CALLEE SAVED:

/*
struct S
{
    int v;
    struct S prox;
};
extern int norma[];
int boo(struct Ss, int n){
    int acum = 0;
    while (s){
        s->v = acerta(norma, n + acum);
        acum += n;
        s = s->prox;
    }
    return acum;
}

acum -> r12d
norma -> r13
*/

.data

.text
.globl boo

boo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp
    movq    %r12, -8(%rbp)
    movq    %r13, -16(%rbp)
    movq    %r14, -24(%rbp)
    movq    %r15, -32(%rbp)

    movl    $0, %r12d # int acum = 0
    movq    $norma, %r13

while:
    cmpq    $0, %rdi
    je      fim # if s == 0

    movq    %rdi, %r14 # saving s
    movq    %rsi, %r15 # saving n
    movq    %r13, %rdi # 1st arg = norma
    addl    %r12d, %esi # 2nd arg = n + acum
    call    acerta
    movq    %r15, %rsi # restore n
    movq    %r14, %rdi # restore s
    movl    %eax, (%rdi) # s->v = acerta(norma, n + acum)
    addl    %esi, %r12d # acum += n
    movq    8(%rdi), %rdi # s = s->prox

    jmp     while

fim:
    movl    %r12d, %eax
    movq    -8(%rbp), %r12
    movq    -16(%rbp), %r13
    leave
    ret
