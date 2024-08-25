# Escreva um programa que peça ao usuário um número de 1 a 7 e exiba o dia da semana correspondente (1 = Domingo, 2 = Segunda, etc.).

dia = int(input("digite um dia da semana: "))

match dia:
    case 1:
        print("Domingo")
    case 2:
        print("Segunda")
    case 3:
        print("Terça")
    case 4:
        print("Quarta")
    case 5:
        print("Quinta")
    case 6:
        print("Sexta")
    case 7:
        print("Sabado")
    case _: # Valor Padrão
        print("Dia invalido")