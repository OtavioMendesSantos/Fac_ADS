# Projeto: Jogo da Velha
# Disciplina: Lógica de Programação
# Participantes:
# Amanda Cristiny O. Melo
# Carlos Henrique dos Santos,
# Felipe M. Ventura,
# Letycia Silva de Aguiar,
# Maria Clara R. B. Pinheiro,
# Otávio Mendes Santos,
# Pedro Judah G. N. Lopes,
# Rafael R. Da Silva.

def criaMatriz():
    return [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

def apresentaMatriz(mat):
    for i in range(3):
        print(mat[i][0], "|", mat[i][1], "|", mat[i][2])
        if i < 2:
            print("-" * 9)

def posicaoOcupada(matriz, posicao):
    for i in range(3):
        for j in range(3):
            if matriz[i][j] == posicao:
                return False
    return True

def registraJogada(mat, posicao, jogador):
    for i in range(3):
        for j in range(3):
            if mat[i][j] == posicao:
                mat[i][j] = jogador
    return mat

def trocaJogador(jogador):
    if jogador == 'X':
        return 'O'
    else:
        return 'X'
        

def verificaGanhador(mat, jogador):
    # Verificar linhas
    for linha in mat:
        if linha.count(jogador) == 3:
            return True
    
    # Verificar colunas
    for col in range(3):
        if mat[0][col] == mat[1][col] == mat[2][col] == jogador:
            return True
    
    # Verificar diagonais
    if mat[0][0] == mat[1][1] == mat[2][2] == jogador:
        return True
    if mat[0][2] == mat[1][1] == mat[2][0] == jogador:
        return True
    
    return False

print("*** JOGO DA VELHA *** \n")
print("Desafie o seu colega no jogo da velha.\n")
print("Regras:")
print(" a) O primeiro jogador participará com a letra X e o segundo com a letra O.")
print(" b) Os números de 1 a 9 representam os espaços que estão livres.")
print("    Você só poderá escolher as posições livres.")
print(" c) O vencedor será o primeiro Jogador a preencher uma linha, uma coluna ou uma diagonal.")

matriz = criaMatriz()  # Cria a Matriz do Jogo
jogador = "X"  # Define o Jogador Inicial
c = 0

while c < 9:  # Controla a quantidade máxima de Jogadas (Nove).
    print()
    apresentaMatriz(matriz)
    print()
    posicao = int(input(f"(Jogador {jogador}) Informe a posição desejada: "))
    
    if posicaoOcupada(matriz, posicao):  # Verifica se a posição está livre
        print("\nVocê não pode escolher uma posição que já está ocupada. Tente novamente.")
        continue
    
    matriz = registraJogada(matriz, posicao, jogador)  # Registra a jogada
    
    if verificaGanhador(matriz, jogador):  # Verifica se o jogador venceu
        apresentaMatriz(matriz)
        print(f"\nParabéns, jogador {jogador}! Você venceu!")
        break
    
    jogador = trocaJogador(jogador)  # Troca o jogador
    c += 1

if c == 9:
    print("\nO jogo empatou!")

apresentaMatriz(matriz)
print("\nFim de jogo.")
