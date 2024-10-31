import pandas as pd

df = pd.read_excel('dados_exemplo.xlsx')
media_receita_por_produto = df.groupby('produto', as_index=False)['Receita Total'].mean()
print(media_receita_por_produto)
