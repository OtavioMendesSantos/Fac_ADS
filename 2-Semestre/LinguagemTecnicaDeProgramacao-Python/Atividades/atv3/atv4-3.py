# Crie uma classe `Produto` com os atributos `codigo`, `nome` e `quantidade`. Implemente uma
# classe `Estoque` que utiliza um dicionário para controlar os produtos, onde a chave será o
# `codigo` do produto e o valor será o objeto `Produto`.
# Implemente os seguintes métodos:
# - `adicionar_produto(produto)`: adiciona ou atualiza um produto no estoque.
# - `remover_produto(codigo)`: remove um produto pelo código.
# - `listar_produtos()`: exibe todos os produtos no estoque.
# - `verificar_estoque()`: retorna um conjunto com os nomes de todos os produtos que
# possuem mais de 10 unidades no estoque.
# Crie um programa que permita ao usuário adicionar, remover e listar produtos no estoque.

class Produto:
    def __init__(self, codigo, nome, quantidade):
        self._codigo = codigo
        self._nome = nome
        self._quantidade = quantidade

    def get_codigo(self):
        return self._codigo

    def get_nome(self):
        return self._nome

    def get_quantidade(self):
        return self._quantidade

    def set_quantidade(self, quantidade):
        self._quantidade = quantidade
        
class Estoque:
    def __init__(self):
        self._estoque = {}

    def adicionar_produto(self, produto):
        # Se o produto já existe (mesmo código), atualiza a quantidade
        if produto.get_codigo() in self._estoque:
            # Se o produto já existe, atualiza a quantidade somando a existente
            quantidade_atual = self._estoque[produto.get_codigo()].get_quantidade()
            nova_quantidade = quantidade_atual + produto.get_quantidade()
            self._estoque[produto.get_codigo()].set_quantidade(nova_quantidade)
        else:
            # Adiciona o produto novo ao estoque
            self._estoque[produto.get_codigo()] = produto

    def remover_produto(self, codigo):
        if codigo in self._estoque:
            del self._estoque[codigo]
            return True
        else:
            return False

    def listar_produtos(self):
        if not self._estoque:
            print("Nenhum produto no estoque.")
        else:
            for codigo, produto in self._estoque.items():
                print(f"Código: {codigo} | Nome: {produto.get_nome()} | Quantidade: {produto.get_quantidade()}")

    def verificar_estoque(self):
        produtos_com_estoque = set()
        for produto in self._estoque.values():
            if produto.get_quantidade() > 10:
                produtos_com_estoque.add(produto.get_nome())
        return produtos_com_estoque
    
estoque = Estoque()

while True:
    print("\nMenu:")
    print("1. Adicionar produto")
    print("2. Remover produto")
    print("3. Listar produtos")
    print("4. Verificar produtos com mais de 10 unidades")
    print("5. Sair")
    
    opcao = input("Escolha uma opção: ")
    
    if opcao == "1":
        codigo = input("Digite o código do produto: ")
        nome = input("Digite o nome do produto: ")
        quantidade = int(input("Digite a quantidade do produto: "))
        
        produto = Produto(codigo, nome, quantidade)
        estoque.adicionar_produto(produto)
        print(f"Produto '{nome}' adicionado/atualizado com sucesso!")
    
    elif opcao == "2":
        codigo = input("Digite o código do produto que deseja remover: ")
        if estoque.remover_produto(codigo):
            print("Produto removido com sucesso!")
        else:
            print("Produto não encontrado!")
    
    elif opcao == "3":
        print("\nProdutos no estoque:")
        estoque.listar_produtos()
    
    elif opcao == "4":
        produtos_com_estoque = estoque.verificar_estoque()
        if produtos_com_estoque:
            print("Produtos com mais de 10 unidades:")
            for produto in produtos_com_estoque:
                print(produto)
        else:
            print("Nenhum produto com mais de 10 unidades no estoque.")
    
    elif opcao == "5":
        print("Saindo...")
        break
    
    else:
        print("Opção inválida. Tente novamente.")