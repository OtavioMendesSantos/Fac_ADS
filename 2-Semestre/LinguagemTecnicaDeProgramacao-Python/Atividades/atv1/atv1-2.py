# Faça um programa que leia o nome, o sexo e o estado civil de uma pessoa. Caso sexo seja “F” e estado civil seja “CASADA”, solicitar o tempo de casada (anos).

nome = input('Qual seu nome? ')
sexo = ''
while (sexo != 'M' and sexo != 'F'):
    sexo = input('Qual seu sexo? [M/F] ').upper()

estadoCivil = input("Qual seu estado civil? [CASADO/SOLTEIRO/OUTRO]").upper() 

tempoCasado = ''
if (sexo == 'F' and estadoCivil == 'CASADO'):
    tempoCasado = input('Quantos anos de casado? ')
    print('Ola {}, seu tempo de casado é de {} anos'.format(nome, tempoCasado))
else:
    print(f"Olá {nome}")
