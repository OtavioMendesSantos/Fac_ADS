# Crie um programa que solicite ao usuário uma quantidade indefinida de valores numéricos. 
# O programa deve calcular e exibir a média aritmética dos números inseridos, além de contar quantos desses números são positivos e quantos são negativos.
# Finalmente, calcule e apresente a porcentagem de números positivos e negativos. 
# Considere que o usuário deve inserir pelo menos um número positivo e um negativo.

temNegativo = False
temPositivo = False
numeros = []
positivos = 0
negativos = 0

while (temNegativo == False or temPositivo == False):
    num = float(input("Insira um número: "))
    if (num > 0):
        temPositivo = True
        positivos += 1
    elif (num < 0):
        temNegativo = True
        negativos += 1
    else:
        break
    numeros.append(num)

media = sum(numeros) / len(numeros)

print("Média aritmética: ", media)
print("Quantidade de números inseridos: ", len(numeros))
print("Quantidade de positivos: ", positivos)
print("Quantidade de negativos: ", negativos)
print("Porcentagem de positivos: ", round((positivos / len(numeros) * 100), 2))
print("Porcentagem de negativos: ", round((negativos / len(numeros) * 100), 2))
