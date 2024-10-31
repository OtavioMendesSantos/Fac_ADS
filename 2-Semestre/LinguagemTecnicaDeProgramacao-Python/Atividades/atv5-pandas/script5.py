import pandas as pd

df = pd.read_excel('dados_exemplo.xlsx')
nome_aluno = input("Digite o nome do aluno que deseja buscar: ")
aluno_filtrado = df[df['Nome'] == nome_aluno]

if not aluno_filtrado.empty:
    produtos_agrupados = aluno_filtrado.groupby('Produto', as_index=False).agg({
        'Quantidade': 'sum',
        'Preço Unitário': 'first'
    })
    
    produtos_agrupados['Total'] = produtos_agrupados['Quantidade'] * produtos_agrupados['Preço Unitário']
    print(f"Informações do aluno '{nome_aluno}'")
    print(aluno_filtrado)
    print("\nResumo de cada produto comprado pelo aluno:")
    print(produtos_agrupados)
else:
    print(f"Nenhum aluno encontrado com o nome: '{nome_aluno}'.")