.text 
.globl acerta

# dicionario 
# int u[]   %rdi
# int i    %esi

acerta:
    pushq   %rbp
    movq    %rsp, %rbp 
    subq    $??, %rsp 

    movslq  %esi, %rax 
    movl    (%rdi, %rax, 4), %eax

    leave
    ret



.text 
.globl boo

# dicionario 
# struct S *s   %rdi  -> rbx
# int n         %esi  -> r14d
# int acum      %r12d

boo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $32, %rsp

    movq    %r14, -8(%rbp)
    movq    %rbx, -16(%rbp)
    movq    %r12, -24(%rbp)

    movq    %rdi, %rbx
    movl    %esi, %r14d
    movl    $0, %r12d

while:
    cmpq    $0, %rbx
    je      fim

    movl    %r14d, %esi
    addl    %r12d, %esi
    movq    $norma, %rdi
    call    acerta

    movl    %eax, (%rbx)
    addl    %r14d, %r12d
    movq    8(%rbx), %rbx
    jmp     while

fim:
    movl    %r12d, %eax

    movq    -8(%rbp), %r14
    movq    -16(%rbp), %rbx
    movq    -24(%rbp), %r12

    leave
    ret