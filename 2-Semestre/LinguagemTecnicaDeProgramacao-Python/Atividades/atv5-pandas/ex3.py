import pandas as pd

# Criando um DataFrame simples
df = pd.DataFrame({
    'nome': ['Ana', 'Bruno', 'Carlos', 'Daniela', 'Eduardo'],
    'idade': [23, 35, 45, 29, 41],
    'email': ['ana@example.com', 'bruno@example.com', 'carlos@example.com',
              'daniela@example.com', 'eduardo@example.com']
})

#Filtrar pessoas com idaade acima de 30 anos
acima_de_30 = df[df['idade'] > 30]
print(acima_de_30) 