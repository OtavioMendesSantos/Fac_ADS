# Escreva um programa que lê dois valores booleanos (lógicos) e então determina se ambos são VERDADEIROS ou FALSOS.

def toBoolean(value):
    if value == "True":
        return True
    else:
        return False

condicao = toBoolean(input("Escreva um valor booleano: [True/False] "))
condicao2 = toBoolean(input("Escreva outro valor booleano: [True/False] ")) 

if condicao and condicao2:
    print(f"Os valores informados, {condicao} e {condicao2}, sao VERDADEIROS")
else:
    print(f"Os valores informados, {condicao} e {condicao2}, sao FALSOS")
