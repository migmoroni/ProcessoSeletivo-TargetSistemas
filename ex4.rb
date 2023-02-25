require 'json'

# Método que extrai os dados do arquivo Json (difenrente do ex3, onde este permite ser alterado as células que irão ser procuradas)
def extract_data_from_json_file(file_path, i1, i2)
    json_data = File.read(file_path)
    parsed_data = JSON.parse(json_data)

    data_array = []
    parsed_data.each do |data|
        data_array << [data[i1], data[i2]]
    end

    return data_array
end

#
def soma_valores(data)
    soma = 0
    data.each do |dia, valor|
        soma += valor
    end
    return soma
end

data = extract_data_from_json_file('arquivos/dados.json', "dia", "valor")
data_month = extract_data_from_json_file('arquivos/mensal_estadual.json', "estado", "faturamento")

somaGeral = soma_valores(data).round(2)

#puts somaGeral
#puts data_month

def calcula_porcentagem(valor, valores)
    porcentagens = []
    
    valores.each do |v|
      porcentagem = (v * 100.0) / valor
      porcentagens << porcentagem.round(2)
    end
    
    return porcentagens
  end
  
  # Exemplo de uso
  valor = 1000
  valores = [250, 350, 100, 200, 100]
  porcentagens = calcula_porcentagem(valor, valores)
  puts "Porcentagens: #{porcentagens}" # Saída: "Porcentagens: [25.0, 35.0, 10.0, 20.0, 10.0]"


# duvida - se possui ligação a questao 3 ou não