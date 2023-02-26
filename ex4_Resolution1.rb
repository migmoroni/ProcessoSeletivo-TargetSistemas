require 'json'

# Método 1: que extrai os dados do arquivo Json (difenrente do ex3, onde este permite ser alterado as células que irão ser procuradas)
def extract_data_from_json_file(file_path, i1, i2)
    json_data = File.read(file_path)
    parsed_data = JSON.parse(json_data)

    data_array = []
    parsed_data.each do |data|
        data_array << [data[i1], data[i2]]
    end

    return data_array
end

# Método 2: que soma os valores do array data, correspondente aos valores de todo mês
def soma_valores(data)
    soma = 0
    data.each do |dia, valor|
        soma += valor
    end
    return soma
end

# Método 3: Faz o mesmo que o método 1, mas também realiza o calculo de porcentagem dos faturamentos dos estados pelo valor total
def extract_data_from_json_file_and_calc(file_path, i1, i2, somaG)
    json_data = File.read(file_path)
    parsed_data = JSON.parse(json_data)

    data_array = []
    parsed_data.each do |data|
        data[i2] = (data[i2] * 100.0) / somaG
        data[i2] = data[i2].round(2)
        data_array << [data[i1], data[i2]]
    end

    return data_array
end


# Inicio do programa
# Extração dos dados dos arquivos .Json
data = extract_data_from_json_file('arquivos/dados.json', "dia", "valor") # Extração dos dados de faturamento de todos os dias


somaGeral = soma_valores(data).round(2)

data_month = extract_data_from_json_file_and_calc('arquivos/mensal_estadual.json', "estado", "faturamento", somaGeral)


puts "Valor total: #{somaGeral}"
puts "Porcentagem de representação de cada estado: #{data_month}"


# Duvida - se possui ligação a questao 3 ou não
# Farei 2 versoes, com ou sem a versão anterior
# Esta é a resolução 1, havendo ligação ao excercicio 3.