#1. Fa�a um script em Ruby que leia um n�mero n e mostre a tabuada de multiplica��o de 1 a 10 deste n�mero (com la�o de repeti��o)
puts "Informe um numero n: "
n = gets.chomp.to_i

for i in 1..10
  puts n*i
end

#2. Criar um script em Ruby que entre com 2 notas (de 0 a 100) de cada aluno de uma turma de 5 alunos, e imprima:
#A m�dia de cada aluno;
#A m�dia da turma;
#O percentual de alunos com m�dia maior ou igual a 60.

matriz = Array.new(5) { Array.new(2) }

for i in 1..5
  for j in 1..2
    puts "Informe a nota #{i} do aluno #{j}"
    nota_atual = gets.chomp.to_i
    matriz[i][j] = nota_atual
  end
end

puts matriz
#3. Um n�mero � primo se os �nicos divisores dele s�o 1 e o pr�prio n�mero. Fa�a um script em Ruby para ler um n�mero inteiro positivo e determinar se ele � ou n�o um n�mero primo.

cont = 0
puts "Informe um numero inteiro: "
n = gets.chomp.to_i

for i in 1..n
  if n % i == 0 
    cont = cont + 1
  end
end

if cont==2
  puts "O n�mero #{n} informado � primo!"
else
  puts "O numero #{n} informado n�o � primo!"
end