# Implemente uma classe `Livro` que tenha os atributos `titulo`,
# `autor`, `ano_publicacao` e `genero`. 
# Crie também uma classe `Biblioteca`, que terá um dicionário onde
# a chave será o gênero do livro e o valor será um conjunto de títulos.
# Implemente os seguintes métodos na classe `Biblioteca`:
# - `adicionar_livro(livro)`: adiciona um livro ao dicionário, classificando-o pelo gênero.
# - `remover_livro(titulo)`: remove um livro pelo título.
# - `listar_livros_por_genero(genero)`: exibe todos os livros de um determinado gênero.
# Crie um programa que permita ao usuário adicionar livros à 
# biblioteca e listar livros por gênero.

class Livro:
    def __init__(self, titulo, autor, ano_publicacao, genero):
        self.titulo = titulo
        self.autor = autor
        self.ano_publicacao = ano_publicacao
        self.genero = genero
        
class Biblioteca:
    def __init__(self):
        # Inicializa o dicionário
        self.livros_por_genero = {}
    
    def adicionar_livro(self, livro):
        # Caso o gênero ainda não esteja no dicionário
        # adiciona-o e inicializa-o com um conjunto vazio
        # Utiliza-se o set para evitar arquivos duplicados
        # Caso o gênero exista, adiciona o título ao conjunto
        if livro.genero not in self.livros_por_genero:
            self.livros_por_genero[livro.genero] = set()
        self.livros_por_genero[livro.genero].add(livro.titulo)

    def remover_livro(self, titulo):
        # Percorre o dicionário e remove o livro pelo título
        for genero, livros in self.livros_por_genero.items():
            # genero -> chave do dicionário
            # livros -> conjunto de títulos
            if titulo in livros:
                livros.remove(titulo)
                if not livros:
                    # Se o conjunto estiver vazio, remove o gênero
                    del self.livros_por_genero[genero]
                return True 
        return False
                
    def listar_livros_por_genero(self, genero):
        if genero in self.livros_por_genero:
            return self.livros_por_genero[genero]
        else:
            return set()
        
biblioteca = Biblioteca()

while True:
    print("\nMenu:")
    print("1. Adicionar livro")
    print("2. Remover livro")
    print("3. Listar livros por gênero")
    print("4. Sair")
    
    opcao = input("Escolha uma opção: ")
    
    match opcao:
        case "1":
            titulo = input("Digite o título do livro: ")
            autor = input("Digite o autor do livro: ")
            ano_publicacao = input("Digite o ano de publicação do livro: ")
            genero = input("Digite o gênero do livro: ")
            
            livro = Livro(titulo, autor, ano_publicacao, genero)
            biblioteca.adicionar_livro(livro)
            print(f"Livro '{titulo}', adicionado com sucesso!")
        case "2":
            titulo = input("Digite o título do livro que deseja remover: ")
            if biblioteca.remover_livro(titulo):
                print("Livro removido com sucesso!")
            else:
                print("Livro não encontrado!")
        case "3":
            genero = input("Digite o gênero que deseja exibir os livros: ")
            livros = biblioteca.listar_livros_por_genero(genero)
            if livros:
                print(f"Livros do gênero '{genero}':")
                for livro in livros:
                    print(livro)
            else:
                print(f"Nenhum livro do gênero '{genero}' foi encontrado!")
        case 4:
            print("Saindo...")
            break
        case _:
            print("Opção inválida. Tente novamente.")
                    