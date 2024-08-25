# Faça um programa que leia dois valores inteiros A e B, se os valores forem iguais deverá se somar os dois, caso contrário multiplique A por B. Ao final de qualquer um dos cálculos deve-se atribuir o resultado para uma variável C e mostrar seu conteúdo na tela.

numA = int(input("Digite o primeiro valor: "))
numB = int(input("Digite o segundo valor: "))
numC = 0

if numA == numB:
    numC = numA + numB
else:
    numC = numA * numB

print("O resultado da operação e: ", numC)
