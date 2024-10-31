import pandas as pd

# Exemplo de DataFrame simples
df = pd.DataFrame({
    'nome': ['Ana', 'Bruno', 'Carlos', 'Daniela', 'Eduardo'],
    'idade': [23, 35, 45, 29, 41],
    'email': ['ana@example.com', 'bruno@example.com', 'carlos@example.com',
              'daniela@example.com', 'eduardo@example.com']
})

# Ordenar o DataFrame pela coluna "idade" em ordem crescente
df_ordenado = df.sort_values(by='idade', ascending=True)
print(df_ordenado)