# Crie uma classe `Aluno` com os atributos `nome`, `idade` e `notas` 
# (que será uma lista de notas). A classe deve ter os seguintes métodos:
# - `adicionar_nota(nota)`: adiciona uma nova nota à lista de notas do aluno.
# - `media_notas()`: retorna a média das notas do aluno.
# - `exibir_dados()`: exibe o nome, idade e a média das notas do aluno.

# Em seguida, crie um programa que peça ao usuário para cadastrar três alunos. O programa
# deve permitir ao usuário adicionar notas e exibir as informações dos alunos.

class Aluno:
    def __init__(self, nome, idade, notas):
        self.nome = nome
        self.idade = int(idade) 
        self.notas = notas
    
    def adicionar_nota(self, nota):
        self.notas.append(float(nota))     
        
    def media_notas(self):
        if len(self.notas) == 0:
            return 0
        return sum(self.notas) / len(self.notas)
    
    def exibir_dados(self):
        print(f"Nome: {self.nome}")
        print(f"Idade: {self.idade}")
        print(f"Média das notas: {self.media_notas()}")

def main():
    alunos = []
    for i in range(3):
        input_nome = input(f"Insira o nome do Aluno {i+1}: ")
        input_idade = input(f"Insira a idade do Aluno {i+1}: ") 
        notas = []
        
        while True:     
            input_continue = input(f"Deseja adicionar notas para o Aluno {i+1}? (s/n) ")
            if input_continue.lower() == 's':
                notas.append(float(input(f"Insira uma nota para oAluno {i+1}: ")))
            elif input_continue.lower() == 'n':
                break
            
        alunos.append(Aluno(input_nome, input_idade, notas))

    for aluno in alunos:
        print('======================================')
        aluno.exibir_dados()

if __name__ == "__main__":
    main()