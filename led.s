.globl _boot
.section .text
_boot:
    # carrega o endereço base do periférico de LEDs (0x80000000) no registrador t0.
    # A instrução 'lui' carrega um imediato de 20 bits nos 20 bits mais significativos
    # do registrador, preenchendo os LSBs com zeros
    lui t0, 0x80000       # t0 = 0x80000000 (Endereço base do periférico)

    # carrega o valor 0b00001111 (15 em decimal) para acender os 4 primeiros LEDs no registrador t1.
    # como o valor 15 se encaixa em um imediato de 12 bits, 'addi' com x0 (zero)
    # como fonte é usado, evitando a pseudoinstrução 'li'.
    addi t1, x0, 15       # t1 = 15 (Valor a ser escrito nos LEDs)

    # envia o valor contido em t1 para o registrador de escrita do periférico de LEDs.
    # o endereço para escrita é o endereço base (t0) com offset 0.
    # a instrução 'sw' (Store Word) armazena 32 bits de um registrador em memória.
    sw t1, 0(t0)          # Escreve o valor de t1 no endereço 0x80000000 (registrador de LEDs)

    # lê o estado atual dos LEDs do periférico para o registrador t2.
    # o endereço para leitura é o endereço base (t0) com offset 4.
    # a instrução 'lw' (Load Word) carrega 32 bits da memória para um registrador.
    lw t2, 4(t0)          # Lê o valor do endereço 0x80000004 (estado dos LEDs) para t2

loop:
    j loop                # Loop infinito para encerrar o programa
  
