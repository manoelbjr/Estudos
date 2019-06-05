#1. Faça um script em Ruby que leia um número n e mostre a tabuada de multiplicação de 1 a 10 deste número (com laço de repetição)
puts "Informe um numero n: "
n = gets.chomp.to_i

for i in 1..10
  puts n*i
end

#2. Criar um script em Ruby que entre com 2 notas (de 0 a 100) de cada aluno de uma turma de 5 alunos, e imprima:
#A média de cada aluno;
#A média da turma;
#O percentual de alunos com média maior ou igual a 60.

matriz = Array.new(5) { Array.new(2) }

for i in 1..5
  for j in 1..2
    puts "Informe a nota #{i} do aluno #{j}"
    nota_atual = gets.chomp.to_i
    matriz[i][j] = nota_atual
  end
end

puts matriz
#3. Um número é primo se os únicos divisores dele são 1 e o próprio número. Faça um script em Ruby para ler um número inteiro positivo e determinar se ele é ou não um número primo.

cont = 0
puts "Informe um numero inteiro: "
n = gets.chomp.to_i

for i in 1..n
  if n % i == 0 
    cont = cont + 1
  end
end

if cont==2
  puts "O número #{n} informado é primo!"
else
  puts "O numero #{n} informado não é primo!"
end