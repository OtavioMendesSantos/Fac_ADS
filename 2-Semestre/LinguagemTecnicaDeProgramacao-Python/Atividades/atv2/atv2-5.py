# 5. Implemente um programa que leia uma sequência de números positivos, encerrando a leitura quando o número zero for inserido. 
# O programa deve contar quantos números pares e ímpares foram inseridos, além de calcular a média dos números pares e a média geral dos números lidos. 
# Inclua uma explicação de como o programa diferencia números pares de ímpares.

cont_pares = 0
cont_impares = 0
soma_pares = 0
soma_total = 0
cont_total = 0

while True:
    # Lê um número do usuário
    num = int(input("Insira um número positivo (0 para sair): "))
    
    if num == 0:  # Se o número for zero, encerramos a leitura
        break
    
    # Atualiza a soma e a contagem total de números lidos
    soma_total += num
    cont_total += 1
    
    # Verifica se o número é par ou ímpar
    if num % 2 == 0:  # Número é par se o resto da divisão por 2 for 0
        cont_pares += 1
        soma_pares += num
    else:  # Número é ímpar se o resto da divisão por 2 for diferente de 0
        cont_impares += 1

# Exibe os resultados
if cont_pares > 0:
    media_pares = soma_pares / cont_pares
else:
    media_pares = 0  # Evita divisão por zero caso não tenha números pares

if cont_total > 0:
    media_geral = soma_total / cont_total
else:
    media_geral = 0  # Evita divisão por zero caso não tenha números

print(f"\nTotal de números pares: {cont_pares}")
print(f"Total de números ímpares: {cont_impares}")
print(f"Média dos números pares: {media_pares:.2f}")
print(f"Média geral dos números lidos: {media_geral:.2f}")
