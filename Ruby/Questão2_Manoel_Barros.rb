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

puts "|--C�lculo MDC de dois n�meros--|"

puts "Informe o primeiro numero:"
x = gets.chomp.to_i

puts "Informe o segundo numero:"
y = gets.chomp.to_i

puts "O m�ximo divisor Comum �: "
MDC(x,y)
