# Instalei a Biblioteca Pandas 
# pip install pandas
# Instalei também openpyxl para ler arquivos .xlsx
# pip install pandas openpyxl

import pandas as pd

# Importa a biblioteca 'os' padrão do Python que fornece funcionalidades para interagir com o sistema operacional
import os

# Obter o diretório onde o script está localizado
# __file__ é uma variável especial que contém o caminho do script atual
caminho_base = os.path.dirname(__file__)

# Criar o caminho relativo para o arquivo Excel a partir do diretório do script
caminho_arquivo = os.path.join(caminho_base, 'dados_clientes.xlsx')

# Verifica se o arquivo Excel existe no caminho especificado
if os.path.exists(caminho_arquivo):
    # Ler o arquivo Excel e criar um DataFrame com os dados
    df = pd.read_excel(caminho_arquivo)
    
    # Exibir as primeiras 5 linhas do DataFrame para ter uma visão geral dos dados
    print('Primeiras linhas da planilha:')
    print(df.head())
    
    # Exibir informações gerais sobre o DataFrame, como número de colunas, tipo de dados e valores nulos
    print('\nInformações gerais sobre a planilha:')
    print(df.info())
    
    # Filtrar e exibir apenas as pessoas com mais de 30 anos
    print("\nPessoas com mais de 30 anos:")
    maiores_30 = df[df['idade'] > 30]  # Cria um novo DataFrame apenas com as linhas onde a idade é maior que 30
    print(maiores_30)
    
    # Função para categorizar as idades em três grupos: Jovem, Adulto e Idoso
    def categorizar_idade(idade):
        if idade < 30:
            return 'Jovem'
        elif 30 <= idade < 50:
            return 'Adulto'
        else:
            return 'Idoso'
    
    # Aplicar a função de categorização para cada linha na coluna 'idade' e criar uma nova coluna 'categoria'
    df['categoria'] = df['idade'].apply(categorizar_idade)
    
    # Exibir o DataFrame atualizado com a nova coluna 'categoria'
    print("\nDados com nova coluna de categoria:")
    print(df)

    # Criar o caminho completo para salvar o resultado no mesmo diretório do script
    caminho_resultado = os.path.join(caminho_base, 'resultado_modificado.xlsx')
    
    # Salvar o DataFrame modificado em um novo arquivo Excel
    # O parâmetro index=False evita que os índices das linhas sejam adicionados ao arquivo Excel como uma nova coluna
    df.to_excel(caminho_resultado, index=False)

    print("\nArquivo 'resultado_modificado.xlsx' salvo com sucesso!")
else:
    # Mensagem de erro caso o arquivo original não seja encontrado
    print("Arquivo não encontrado no caminho especificado.")
