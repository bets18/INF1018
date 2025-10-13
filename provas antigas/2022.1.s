.text
.globl foo 

foo: 
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16 %rsp

    movq    %r12, -4(%rbp)
    movq    %r13, -8(%rbp)

    movl    $0, %r12d
    movl    $0, %r13d

loop:
    cmpl    %edi, %r12d
    jge      final

    

final:



#dicionario:
# char c1 %rdi 1 byte
# char c2 %rsi 1 byte

# int n %edi 4 bytes 
# char c %rsi  1 bytes 
# char *v %rdx 8 bytes
# int i %r12d 4 bytes
# int s %r13d 4 bytes 