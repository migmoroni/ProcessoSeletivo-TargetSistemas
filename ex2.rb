# Método que realiza somas sucessivas até que atinja o valor ou próximo do desejado que se quer encontrar
def fibonacci(n)
  num1 = 0
  num2 = 1
  num = 0
  while (num < n)
    num = num1 + num2
    num1 = num2
    num2 = num
  end
  return num
end

# Método que verifica se o numero desejado faz parte da sequencia de fibonacci
def verify_Number(compare)
  
  fib = fibonacci(compare)

  # Verifica se o valor desejado pertence ou não a sequencia de fibonacci
  if fib == (compare)
  puts "\n#{compare} pertence à sequência de Fibonacci!"
  else
  puts "\n#{compare} NÃO pertence à sequência de Fibonacci!"
  end
end

# Inicio do programa
puts "Este programa descobre se o número desejado pertence ou não, a sequencia de Fibonacci."
puts "OBS: Valores não inteiros, são arredondados."
puts "\nDigite o valor desejado:"

compare = gets.chomp.to_i

verify_Number(compare)