# Desenvolva um programa que receba uma série de números de forma contínua até que um valor negativo seja inserido.
# O programa deve contar quantos números caem dentro dos seguintes intervalos: [0-25], [26-50], [51-75], [76-100]. 
# Depois que o valor negativo for inserido, exiba o total de números contados em cada intervalo e faça uma breve análise dos resultados.

lastNum = 0
numeros = []
intervalo0, intervalo1, intervalo2, intervalo3 = [], [], [], []
def intervalo(num):
    if num >= 0 and num <= 25:
        intervalo0.append(num)
        return 
    elif num >= 26 and num <= 50:
        intervalo1.append(num)
        return 
    elif num >= 51 and num <= 75:
        intervalo2.append(num)
        return 
    elif num >= 76 and num <= 100:
        return intervalo3.append(num)
    else:
        return 

while lastNum >= 0:
    num = int(input("Insira um número Inteiro: "))
    numeros.append(num)
    intervalo(num)
    lastNum = num

print(f"Intervalo [0-25]: {len(intervalo0)}")
print(f"Intervalo [26-50]: {len(intervalo1)}")
print(f"Intervalo [51-75]: {len(intervalo2)}")
print(f"Intervalo [76-100]: {len(intervalo3)}")
