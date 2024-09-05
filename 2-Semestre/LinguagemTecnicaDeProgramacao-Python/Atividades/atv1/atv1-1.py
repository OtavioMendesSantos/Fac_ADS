#Faça um programa que leia os valores A, B, C e imprima na tela se a soma de A + B é menor que C.
num1 = int(input("digite o primeiro valor: "))
num2 = int(input("digite o segundo valor: "))
num3 = int(input("digite o terceiro valor: "))

if (num1 + num2) < num3:
    print("True, a soma de A + B é menor que C")
else:
    print("False, a soma de A + B é maior que C")
