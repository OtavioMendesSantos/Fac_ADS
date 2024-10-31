import pandas as pd

df = pd.read_excel('dados_exemplo.xlsx')
vendas = df[df['Receita Total'] > 15]
print(vendas)
