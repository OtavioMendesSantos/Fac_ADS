# Implemente uma classe `Funcionario` que possui os atributos `nome`, `departamento` e
# `salario`. O programa deve ter uma lista para armazenar objetos `Funcionario`.
# Implemente as seguintes funcionalidades:
# - `adicionar_funcionario(funcionario)`: adiciona um funcionário à lista.
# - `excluir_funcionario(nome)`: remove um funcionário da lista pelo nome.
# - `listar_funcionarios_por_departamento(departamento)`: exibe todos os funcionários de um
# determinado departamento.
# Crie um programa que permita cadastrar funcionários, listar por departamento e remover
# um funcionário pelo nome.

class Funcionario:
    def __init__(self, nome, departamento, salario):
        self.nome = nome
        self.departamento = departamento
        self.salario = salario

    def exibir_dados(self):
        print("========== Funcionário ==========")
        print(f"Nome: {self.nome}")
        print(f"Departamento: {self.departamento}")
        print(f"Salário: {self.salario}")
        print("=================================")

class Funcionarios:
    def __init__(self):
        self.funcionarios = []

    def adicionar_funcionario(self, nome, departamento, salario):
        funcionario = Funcionario(nome, departamento, salario)
        self.funcionarios.append(funcionario)
        print("Funcionário adicionado com sucesso!")

    def excluir_funcionario(self, nome):
        for funcionario in self.funcionarios:
            if funcionario.nome == nome:
                self.funcionarios.remove(funcionario)
                print("Funcionário excluído com sucesso!")
                return
            else:
                print("Funcionário não encontrado!")
                
    def listar_funcionarios_por_departamento(self, departamento):
        for funcionario in self.funcionarios:
            if funcionario.departamento == departamento:
                funcionario.exibir_dados()
                
funcionarios = Funcionarios()
                
while True:
    print("========== Funcionários ==========")
    print("1. Cadastrar funcionário")
    print("2. Excluir funcionário")
    print("3. Listar funcionários por departamento")
    print("4. Sair")
    opcao = input("Escolha uma opção: ")
    
    match opcao:
        case "1":
            nome = input("Nome: ")
            departamento = input("Departamento: ")
            salario = float(input("Salário: "))
            funcionarios.adicionar_funcionario(nome, departamento, salario)
        case "2":
            nome = input("Nome: ")
            funcionarios.excluir_funcionario(nome)
        case "3":
            departamento = input("Departamento: ")
            funcionarios.listar_funcionarios_por_departamento(departamento)
        case "4":
            print("Saindo...")
            break
        case _:
            print("Opção inválida. Tente novamente.")