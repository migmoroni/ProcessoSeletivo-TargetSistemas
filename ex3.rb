require 'json'

# Método que extrai os dados do arquivo Json
def extract_data_from_json_file(file_path)
    json_data = File.read(file_path)
    parsed_data = JSON.parse(json_data)

    data_array = []
    parsed_data.each do |data|
        data_array << [data['dia'], data['valor']]
    end

    return data_array
end

# Método que calcula o menor faturamento
def menor_faturamento(data)
    menor = data[0][1]
    data.each do |dia|
        if dia[1] < menor
        menor = dia[1]
        end
    end
    return menor
end

# Método que calcula o maior faturamento
def maior_faturamento(data)
    maior = data[0][1]
    data.each do |dia|
        if dia[1] > maior
        maior = dia[1]
        end
    end
    return maior
end

# Método que calcula quantos dias tiveram faturamento acima da média
def dias_faturamento_acima_media(data)
    faturamento_total = 0
    dias_com_faturamento = 0
    data.each do |dia|
        if dia[1] != 0
        faturamento_total += dia[1]
        dias_com_faturamento += 1
        end
    end
    media = faturamento_total / dias_com_faturamento.to_f
    dias_acima_media = 0
    data.each do |dia|
        if dia[1] > media
        dias_acima_media += 1
        end
    end
    return dias_acima_media
end

# Inicio o programa
data = extract_data_from_json_file('arquivos/dados.json')

puts data.inspect

puts "Menor faturamento: #{menor_faturamento(data)}"
puts "Maior faturamento: #{maior_faturamento(data)}"
puts "Dias com faturamento acima da média: #{dias_faturamento_acima_media(data)}"