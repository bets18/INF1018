.text 
.globl foo

# dicionario 
# double *vd   rdi
# int n        esi


foo:
    pushq    %rbp
    movq    %rsp, %rbp

    pxor    %xmm0, %xmm0

while:
    cmp     $0, %esi 
    je      fim
    subl    $1, %esi

    movsd   %xmm0, (%rdi)
    addq    $8, %rdi 

    jmp while


fim:
    leave 
    ret 


.text 
.globl boo 

# dicionario 
# double d      %xmm0 -> %r13
# float bias    %xmm1
# struct exam - 8 bytes totais 
# struct exam temp - 40 bytes totais 


boo: 
    pushq   %rbp
    movq    %rsp, %rbp 
    subq    $64, %rsp

    movq    %r12, -8(%rbp) # int i 
    movl    $0, %r12d

    movsd   %xmm0, -16(%rbp) # double d 
    movss   %xmm1, -20(%rbp)  # float bias

for:
    cmp     $5, %r12d
    jge     fim 

    movsd   -16(%rbp), %xmm0
    call    inv # inv(d)

    cvtsd2ss %xmm0, %xmm0 

    movss   %xmm0, -64(%rbp, %r12, 8) # temp[i].val = inv(d)

    movl   %r12, -60(%rbp, %r12, 8) # temp[i].tipo = i
    
    addl    $1, %r12d
    jmp     loop 

fim:
    movss   -64(%rbp), %xmm0
    addss   -20(%rbp), %xmm0

    movq    -8(%rbp), %r12

    leave 
    ret 
