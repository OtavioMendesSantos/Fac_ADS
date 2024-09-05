# Escreva um algoritmo que leia a altura de 5 participantes de uma pesquisa. Após a leitura, o programa deve identificar e exibir as alturas máxima e mínima registradas. Explique como o algoritmo determina esses valores ao longo da execução.

i = 0
participantes = []
maior = -1
menor = 999

# Guarda os valores na lista
while i < 5:
    altura = float(input("Digite a altura: "))
    participantes.append(altura)
    i += 1

# Identifica e exibe os valores, caso o valor atual seja maior ou menor que o anterior é armazenado nas variáveis
for altura in participantes:
    if altura > maior:
        maior = altura
    if altura < menor:
        menor = altura

print(f"A maior altura registrada foi {maior} e a menor foi {menor}.")