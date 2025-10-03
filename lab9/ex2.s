.text
/*int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);


  Reg   Var 
  edi   n
}*/

.globl fat
fat:
    pushq   %rbp    #salva a base do RA da funcao chamadora 
                    #realinha o topo da pilha em multiplo de 16
    movq    %rsp, %rbp  #cria a base do RA da funcao chamada 
    subq    $16, %rsp  #abre espaço para o RA da funcao chamada. 8 + 4 (do edi) = 16

    movq    %r15, -8(%rbo)

    cmpl    $0, %edi
    jne     ELSE 

    movl    $1, %eax
    jmp     RETORNA

ELSE:
    movl    %edi, %r15d

    decl    %r15d
    
    #salvar registradores caller-saved antes de chamar a funcao 
    movl    %edi, -12(%rbp)

    #chamar a funcao
    #parametros 
    movl    %r15d, %edi
    call    fat

    #restaurar os registradores dcaller=saved salvos 
    movl    -12(%rbp), %edi 

    #em eax esta o valor retornado
    imull   %edi, %eax

/*
    return n*fat(n-1);
    temp = n;
    temp = temp - 1;
    result= fat(temp);
    result = result + n;
    result result; 
*/

RETORNA:

    #rstaurar os callee-saved
    movq    -8(%rbp), %r15d


    #destruir o RA
    #leave
    #OU!
    movq    %rbp, %rsp 
    popq    %rbp

    #retornar 
    ret 