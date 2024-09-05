# 8. Desenvolva um programa que receba um valor inicial A e imprima a sequência de operações necessárias para calcular o fatorial de A, além de exibir o resultado final do cálculo.
# Como exemplo, mostre a sequência de multiplicações e o resultado final para o fatorial de 5. Explique como o programa gerencia o processo de multiplicação em sequência.

def calcular_fatorial(A):
    # Verifica se o número é negativo
    if A < 0:
        return "Fatorial não é definido para números negativos."

    # Inicializa o valor do fatorial e a sequência de multiplicações
    fatorial = 1
    operacoes = ""

    # Calcula o fatorial e armazena as operações realizadas
    for i in range(A, 0, -1):  # Loop de A até 1
        fatorial *= i
        if i == A:
            operacoes += f"{i}"
        else:
            operacoes += f" x {i}"

    # Exibe as operações realizadas
    print(f"Sequência de operações para {A}!: {operacoes}")
    
    # Retorna o resultado final
    return fatorial

 # Solicita ao usuário o valor inicial A
A = int(input("Insira um número para calcular o fatorial: "))

# Calcula e exibe o fatorial
resultado = calcular_fatorial(A)

# Exibe o resultado final
print(f"Resultado final de {A}! = {resultado}")