import pandas as pd

df = pd.read_excel('dados_exemplo.xlsx')
total_vendido_por_produto = df.groupby('Produto', as_index=False)['Quantidade'].sum()
total_vendido_por_produto.rename(columns={'Quantidade': 'Total Vendido'}, inplace=True)
print(total_vendido_por_produto)
