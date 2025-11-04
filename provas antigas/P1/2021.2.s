.data 

.globl foo

foo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %r12, -4(%rbp)
    movq    %r13, -8(%rbp)
    # a = %edi 4 bytes 
    # r12d 4 bytes

if:
    cmpl    $1, %edi
    je      chamada
    cmpl    $0, %edi
    je      chamada

    subl    $1, %edi
    movl    %edi, %r13d
    call    foo
    movl    %eax, %r12d

    subl    $1, %r13d
    movl    %r13d, %edi
    call    foo

    addl    %r12d, %eax
    leave 
    ret

chamada:
    movl    %edi, %eax
    leave
    ret


.globl boo
boo:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $??, %rsp

    # s %rdi 8 bytes 
    # n %esi 4 bytes 
    # i %r12d 4 bytes
    # acc %r13 8 bytes
    # tamanho da struct : 1 + 3 + 4 + 8 
    # a esta em 0 e b esta em 4 e p esta em 8 

    movq    %r12d, -4(%rbp) #i
    movq    %r13, -16(%rbp)
    movq    %r14, -17(%rbp) # vai salvar v[i].a
    movq    %r15, -22(%rbp) # vai salvar v[i].a estendido de 4 bytes

    movl    $0, %r12d
    movq    $0, %r13

loop:
    cmpl    %esi, %r12d
    jge     fim

    movl    %r12d, %eax 
    imulq   $16, %rax
    addq    %rdi, %rax

    movq    (%rax), %r14b
    movsbl  %r14b, %r15b

    movl    %r12d, %r15d


fim:
    movq    %r13, %rax
    leave 
    ret