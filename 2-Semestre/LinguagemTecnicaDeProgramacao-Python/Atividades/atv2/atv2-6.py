# 6. Crie um programa que gere e exiba todos os números ímpares situados entre 100 e 200.
# Explique como o programa decide se um número é ímpar e como ele percorre o intervalo especificado.

for num in range(100, 201):  # range(100, 201) vai de 100 a 200 (inclui 200)
    # Verifica se o número é ímpar
    if num % 2 != 0:
        print(num)
