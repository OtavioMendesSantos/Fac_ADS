import pandas as pd

# Exemplo de DataFrame simples
df = pd.DataFrame({
    'nome': ['Ana', 'Bruno', 'Carlos', 'Daniela', 'Eduardo'],
    'idade': [23, 35, 45, 29, 41],
    'email': ['ana@example.com', 'bruno@example.com', 'carlos@example.com',
              'daniela@example.com', 'eduardo@example.com']
})

# Remover todas as linhas que possuem valores nulos
df_limpo = df.dropna()
print(df_limpo)