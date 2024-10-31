import pandas as pd

# Exemplo de DataFrame simples
df = pd.DataFrame({
    'nome': ['Ana', 'Bruno', 'Carlos', 'Daniela', 'Eduardo'],
    'idade': [23, 35, 45, 29, 41],
    'email': ['ana@example.com', 'bruno@example.com', 'carlos@example.com',
              'daniela@example.com', 'eduardo@example.com']
})

# Adicionar uma coluna 'faixa_etaria' baseada na idade
df['faixa_etaria'] = df['idade'].apply(lambda x: 'Jovem' if x < 30 else 'Adulto')
print(df)