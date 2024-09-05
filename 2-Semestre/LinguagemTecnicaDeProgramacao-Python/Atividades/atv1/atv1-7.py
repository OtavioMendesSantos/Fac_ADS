# Faça um programa que leia uma variável e some 5 caso seja par ou some 8 caso seja ímpar, imprimir o resultado desta operação.

var = int(input("Digite um valor: "))

if(var % 2 == 0):
    print(var + 5)
else:
    print(var + 8)
