.text
.globl buba

buba:
# --- PRÓLOGO DA FUNÇÃO: Preparação do ambiente da função ---
    pushq %rbp              # Salva o ponteiro base da pilha ('base pointer') da função anterior.
    movq %rsp, %rbp         # Define o ponteiro base da pilha para a função 'buba' como o valor atual do ponteiro da pilha.
    subq $16, %rsp          # Aloca 16 bytes de espaço na pilha para variáveis locais (neste caso, para salvar %r12 e %r13).
    movq %r12, -8(%rbp)     # Salva o valor original do registrador %r12 na pilha, pois ele será modificado.
    movq %r13, -16(%rbp)    # Salva o valor original do registrador %r13 na pilha, pois ele também será modificado.

# --- INICIALIZAÇÃO DAS VARIÁVEIS LOCAIS ---
    movl $0, %r12d          # Inicializa o contador do loop 'i' (em %r12d) com 0. (Equivalente a: int i = 0;)
    movl $0, %r13d          # Inicializa o acumulador 'soma' (em %r13d) com 0. (Equivalente a: int soma = 0;)

# --- INÍCIO DO LOOP (equivalente a um 'for' ou 'while') ---
LOOP:
    cmpl %esi, %r12d        # Compara 'i' (%r12d) com 'n' (%esi). (Equivalente a: if (i >= n))
    jge FORA                # 'Jump if Greater or Equal'. Se 'i' for maior ou igual a 'n', pula para o final da função (FORA).

# --- CORPO DO LOOP: Cálculo de endereço e comparação ---
    movl %r12d, %eax        # Copia o valor de 'i' (%r12d) para o registrador %eax para cálculo.
    imulq $1, %rax          # Multiplica %rax por 1. Esta instrução é redundante e não tem efeito, é um artefato do compilador.
    addq %rdi, %rax         # Soma o endereço base do 'vetor' (%rdi) com o índice 'i' (%rax).
                            # Agora, %rax contém o endereço de memória de vetor[i].

    cmpb %dl, (%rax)        # Compara o 'limite' (no registrador %dl de 8 bits) com o byte no endereço apontado por %rax (vetor[i]).
                            # (Equivalente a: if (vetor[i] >= limite))
    jge FORA_IF             # 'Jump if Greater or Equal'. Se vetor[i] for maior ou igual a 'limite', pula o bloco 'if'.

# --- BLOCO 'IF': Executado se vetor[i] < limite ---
    movb (%rax), %dil       # Move o byte de vetor[i] para %dil (os 8 bits inferiores de %rdi).
                            # Isso prepara o primeiro (e único) argumento para a chamada da função 'corta'.
    call corta              # Chama a função 'corta'. O valor de retorno será colocado em %eax.

    addl %eax, %r13d        # Adiciona o valor de retorno de 'corta' (%eax) à 'soma' (%r13d).
                            # (Equivalente a: soma += resultado_de_corta;)

    jmp FORA_IF             # Pula incondicionalmente para o final do corpo do loop.

# --- INCREMENTO E CONTINUAÇÃO DO LOOP ---
FORA_IF:
    addl $1, %r12d          # Incrementa o contador 'i' em 1. (Equivalente a: i++;)
    jmp LOOP                # Pula de volta para o início do loop (LOOP) para a próxima iteração.

# --- EPÍLOGO DA FUNÇÃO: Limpeza e retorno ---
FORA:
    movl %r13d, %eax        # Move o resultado final, a 'soma' (%r13d), para %eax, que é o registrador de retorno.
    movq -16(%rbp), %r13    # Restaura o valor original do registrador %r13 que foi salvo no início.
    movq -8(%rbp), %r12     # Restaura o valor original do registrador %r12.
    leave                   # Restaura a pilha para o estado anterior à chamada da função (movimenta %rbp para %rsp e depois faz pop de %rbp).
    ret                     # Retorna o controle para a função que chamou 'buba', com o resultado em %eax.