=begin
Atividade 5: Lógica do Caixa Eletrônico (prazo: 20/05/2019)

Algoritmo do Caixa Eletrônico
Você foi contratado como programador por um banco para desenvolver a lógica computacional dos caixas eletrônicos desse banco.

O cliente do banco, ao chegar num caixa eletrônico, informa o valor em reais (R$) que deseja sacar. 
Os caixas eletrônicos do banco possuem cédulas de R$ 2, R$ 5, R$ 10, R$ 20, R$ 50 e R$ 100 reais. 
Após o cliente digitar o valor que deseja sacar, o caixa eletrônico deve informar (mostrar na tela) 
a quantidade de cédulas de R$ 2, R$ 5, R$ 10, R$ 20, R$ 50 e/ou R$ 100 reais que devem ser fornecidas 
para o cliente.
Importante: o caixa eletrônico sempre deverá fornecer para o cliente a menor quantidade de cédulas possíveis.

Caso o cliente informe um valor impossível de ser fornecido, como por exemplo R$ 101 reais, 
o caixa eletrônico deve apresentar a seguinte mensagem: 
"O valor solicitado deve ser múltiplo de R$ 2, R$ 5, R$ 10, R$ 20, R$ 50 ou R$ 100 reais!".

Crie um script em Ruby que implemente a lógica do caixa eletrônico e que permita que ela possa ser executada várias vezes, 
ou seja, permita que vários clientes realizem saques. 
O script deve parar de permitir saques quando um cliente digitar o valor 0 (zero). 
A solução desse problema não precisa utilizar, necessariamente, hashes ou arrays.
=end

=begin
Caro professor, a atividade pede apenas multiplos dos valores 2,5,10,20, 50 e 100. Mas 7, 17, 27, 9, 49, etc não são multiplos de nenhum desses valores mas (no meu entender) são valores permitidos.

A máquina permite sacar qualquer valor>0 que seja diferente de 1 ou 3, pois, por exemplo, se o cliente informa 11 reais, ele saca 5 + 3 notas de 2 reais. 

101 = nota de 50 + 2 notas 20 +nota de 5 + 3 notas de 2;
=end
def checkValidity(value)
    if (value==1 || value==3)
        return false
    else
        return true
    end
end

def countHundred(value)
    count = 0
        while value>=100
            count = count +1
            value = value-100
        end
    return count
end
def countFifty(value)
    count = 0
        while value>=50
            count = count +1
            value = value-50
        end
    return count
end
def countTwenty(value)
    count = 0
        while value>=20
            count = count +1
            value = value-20
        end
    return count
end
def countTen(value)
    count = 0
        while value>=10
            count = count +1
            value = value-10
        end
    return count
end
def countFive(value)
    count = 0
        while value>=5
            count = count +1
            value = value-5
        end
    return count
end
def countTwo(value)
    count = 0
        while value>=2
            count = count +1
            value = value-2\
        end
    return count
end

print "+-------------------------------------+\n"
print "|--- GERENCIAMENTO CAIXA ELETRÔNICO --|\n"
print "+-------------------------------------+\n"
getOut = false

#utilizei hash pra salvar a quantidade de notas
money_notes = {
    "100" => 0,
    "50" => 0,
    "20" => 0,
    "10" => 0,
    "5" => 0,
    "2" => 0
}

while !getOut do
    puts "NOVO SAQUE - Informe seu nome: "
    name = gets.chomp
    puts "Ola #{name}, Informe o valor que deseja sacar: "
    sake = gets.chomp.to_i
    current = sake

    if sake<1 
        getOut = true
    elsif checkValidity(sake)
        
        money_notes["100"] = countHundred(current)
        current = current - money_notes["100"]*100
        money_notes["50"] = countFifty(current)
        current = current - money_notes["50"]*50
        money_notes["20"] = countTwenty(current)
        current = current - money_notes["20"]*20
        money_notes["10"] = countTen(current)
        current = current - money_notes["10"]*10
        money_notes["5"] = countFive(current)
        current = current - money_notes["5"]*5
        money_notes["2"] = countTwo(current)
        current = current - money_notes["2"]*2

        puts "Voce sacou R$ #{sake} da seguinte forma: "
        money_notes.each do |value, quantity|
            if quantity>0
                puts "#{quantity.to_s} notas de R$ #{value} "
            end
        end
        if current>1
            puts "R$ #{current} reais ficarão na sua conta para saque posterior."
        end

    else
        puts "Valor inválido."
    end
end
print "\n OBRIGADO POR UTILIZAR NOSSO BANCO"

