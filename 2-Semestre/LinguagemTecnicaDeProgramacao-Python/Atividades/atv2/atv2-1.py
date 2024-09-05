# 1. Desenvolva um algoritmo que, dentro de um intervalo específico de números (de 1 a 500), selecione e some os números que atendam a dois critérios: serem ímpares e também múltiplos de três. Além disso, exiba o total de números que atenderam a esses critérios.

i = 0
soma = 0
for i in range(1, 501):
    if i % 2 != 0 and i % 3 == 0:
        soma += i
        print(i)
print(f"Total: {soma}")
