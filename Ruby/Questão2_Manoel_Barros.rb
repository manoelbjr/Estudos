def MDC(x,y)
  sair = false
  while !sair
    resto = x % y 
    x = y
    y = resto
      if resto == 0
        break
      end
  end

  return x
end

puts "|--Cálculo MDC de dois números--|"

puts "Informe o primeiro numero:"
x = gets.chomp.to_i

puts "Informe o segundo numero:"
y = gets.chomp.to_i

puts "O máximo divisor Comum é: "
MDC(x,y)
