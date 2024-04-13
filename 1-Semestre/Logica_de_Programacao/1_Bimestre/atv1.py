# Escreva um algoritmo em Portugol para cada um dos problemas abaixo:

'''

Algoritmos em Portugol

// 1 - Algoritmo para calcular o consumo de combustível numa viagem de carro

real quilometros, autonomia, litros
escreva("Informe a Quantidade de Km's percorridos: ")
leia(quilometros)
escreva("Informe a autonomia do veículo: ")
leia(autonomia)
litros <- quilometros / autonomia
escreva("Foram gastos ", litros, " Litros de combustível.")

// 2 - Algoritmo para calcular o consumo de água e o valor da conta

real mes1, mes2, gastoMes1, gastoMes2
escreva("Informe o consumo do mês anterior: ")
leia(mes1)
escreva("Informe o consumo do mês atual: ")
leia(mes2)
gastoMes1 <- mes1 * 3
gastoMes2 <- mes2 * 3
escreva("Gasto mês anterior: R$", gastoMes1)
escreva("Gasto mês atual: R$", gastoMes2)
se (gastoMes1 < gastoMes2) entao
    escreva("O gasto deste mês foi maior, você gastou R$", gastoMes2 - gastoMes1, " a mais")
senao se (gastoMes1 > gastoMes2) entao
    escreva("O gasto deste mês foi menor, você gastou R$", gastoMes1 - gastoMes2, " a menos")
senao
    escreva("O gasto deste mês é igual ao mês anterior")

// 3 - Algoritmo para calcular o lucro na venda de um produto

real pCusto, pVenda, lucro
inteiro estoque
escreva("Informe o preço de custo: ")
leia(pCusto)
escreva("Informe o preço de venda: ")
leia(pVenda)
escreva("Informe a quantidade no estoque: ")
leia(estoque)
lucro <- pVenda - pCusto
escreva("Por venda, você lucra: ", lucro)
escreva("Vendendo o estoque inteiro, você lucra: ", lucro * estoque)

// 4 - Algoritmo para calcular a média de consumo de água

real mes1, mes2, mes3, gastoMes1, gastoMes2, gastoMes3, media
escreva("Informe o consumo do mês 1: ")
leia(mes1)
escreva("Informe o consumo do mês 2: ")
leia(mes2)
escreva("Informe o consumo do mês 3: ")
leia(mes3)
gastoMes1 <- mes1 * 3
gastoMes2 <- mes2 * 3
gastoMes3 <- mes3 * 3
media <- (gastoMes1 + gastoMes2 + gastoMes3) / 3
escreva("Gasto médio atual: R$", media)

'''

#Algoritmos em python

# 1 

quilometros = float(input("Informe a Quantidade de Km's percorridos: "))
autonomia = int(input("Informe a autonomia do veículo: "))
litros = quilometros / autonomia
print(f"Foram gastos {litros} Litros de combustível.")

# 2 

mes1 = float(input("Informe o consumo do mês anterior: "))
mes2 = float(input("Informe o consumo do mês atual: "))

gastoMes1 = mes1 * 3
gastoMes2 = mes2 * 3

print(f"Gasto mês anterior: R${gastoMes1}")
print(f"Gasto mês atual: R${gastoMes2}")

if (gastoMes1 < gastoMes2):
    print(f"O gasto deste mês foi maior, você gastou R${gastoMes2 - gastoMes1} a mais")
elif (gastoMes1 > gastoMes2):
    print(f"O gasto deste mês foi menor, você gastou R${gastoMes1 - gastoMes2} a menos")
else:
    print(f"O gasto deste mês é igual ao mês anterior")

# 3

pCusto = float(input("Informe o preço de custo: ")) 
pVenda = float(input("Informe o preço de venda: ")) 
estoque = int(input("Informe a quantidade no estoque: ")) 

lucro = pVenda - pCusto

print(f"Por venda, você lucra: {lucro}")

print(f"Vendendo o estoque inteiro, você lucra: {lucro * estoque}")

# 4 
mes1 = float(input("Informe o consumo do mês 1: "))
mes2 = float(input("Informe o consumo do mês 2: "))
mes3 = float(input("Informe o consumo do mês 3: "))

gastoMes1 = mes1 * 3
gastoMes2 = mes2 * 3
gastoMes3 = mes3 * 3

media = (gastoMes1 + gastoMes2 + gastoMes3) / 3

print(f"Gasto médio atual: R${media}")