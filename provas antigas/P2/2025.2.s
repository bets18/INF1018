# POSSIVEIS PROVAS QUE O THIAGO FEZ

# P1
.text 
.globl foo 

# dicionario 
# float a   %xmm0
# int b     %edi  -> %xmm1

foo:
    pushq   %rbp 
    movq    %rsp, %rbp 
    subq    $16, %rsp

    cvtss2sd    %xmm0, %xmm0

    movss   %xmm0, -8(%rbp)
    
    cvtsi2ss  %edi, %xmm1
    movss   %xmm1, -16(%rbp)

    call    sin 

    addss   -16(%rbp), %xmm0
    leave 
    ret

.text 
.globl pack 

# dicionario
# struct X *px  %edi 

pack: 
    pushq   %rbp 
    movq    %rsp, %rbp
    subq    $16, %rsp

    pxor    %xmm0, %xmm0
    movsd   %xmm0, -8(%rbp) # double acc

while:
    cmp     %edi, $0
    je      fim

    mov
    