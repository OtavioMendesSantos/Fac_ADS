import pandas as pd

# Criar dois DataFrames de exemplo
df1 = pd.DataFrame({'id': [1, 2, 3], 'nome': ['Ana', 'Bruno', 'Carlos']})
df2 = pd.DataFrame({'id': [1, 2, 3], 'email': ['ana@example.com', 'bruno@example.com', 'carlos@example.com']})

# Mesclar os DataFrames pela coluna 'id'
df_mesclado = pd.merge(df1, df2, on='id')
print(df_mesclado)