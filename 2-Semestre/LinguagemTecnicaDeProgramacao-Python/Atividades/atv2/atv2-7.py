# 7. Escreva um programa que solicite ao usuário um valor N, entre 1 e 10, e calcule a tabuada desse número.
# A tabuada deve ser exibida de maneira organizada, mostrando cada operação de multiplicação, de 0 a 10, e o respectivo resultado. 
# Discuta como o programa realiza o cálculo da tabuada e formata os resultados.

while True:
    num = int(input("Insira um número entre 1 e 10 para calcular a tabuada: "))
    if 1 <= num <= 10:  # Verifica se o número está dentro do intervalo válido
        break
    else:
        print("Por favor, insira um valor válido entre 1 e 10.")

# Calcula e exibe a tabuada de N
print(f"\nTabuada do {num}:")
for i in range(11):  # Gera números de 0 a 10
    resultado = num * i
    print(f"{num} x {i} = {resultado}")  # Exibe o cálculo de maneira organizada
    