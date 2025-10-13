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
    movq     %rsp, %rbp
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


/*
QUESTAO 2

v= ....10
7= ....13
8= 14...17
-1= 18...1B


0000 0000 0000 0000 0000 0000 0000 1010
1111 1111 1111 1111 1111 1111 1111 0101 +1
1111 1111 1111 1111 1111 1111 1111 0110
FF FF FF F6
-10 = F6 FF FF FF
&v[2] = 18 c0 60 00 00 00 00 00

c= 99
0110 0011
63

print:

20 F6 
21 FF
22 FF
23 FF
24 PP 
25 PP
26 PP
27 PP
28 18
29 C0
2A 60
2B 00
2C 00
2D 00
2E 00
2F 00
30 63
31 PP
32 PP
33 PP
34 PP
35 PP
36 PP
37 PP

*/

