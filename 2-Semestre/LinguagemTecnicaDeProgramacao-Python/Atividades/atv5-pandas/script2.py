import pandas as pd

df = pd.read_excel('dados_exemplo.xlsx')
media_notas_por_curso = df.groupby('Curso', as_index=False)['Nota Final'].mean()
media_notas_por_curso.rename(columns={'Nota Final': 'Média Nota Final'}, inplace=True)
print(media_notas_por_curso)
