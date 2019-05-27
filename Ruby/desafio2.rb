load 'libdesafio2.rb' # Não altere essa linha

###############################################################
######################## ORIENTAÇÕES ##########################
###############################################################
# 1. Você vai precisar do algoritmo que implementou na
# "Atividade Desafio I: Lógica do Caixa Eletrônico", portanto,
# crie uma função, no arquivo desafio2.rb, chamada entregar_cedulas,
# que recebe o valor do saque como parâmetro e mostra na tela quantas
# cédulas de cada nota (R$ 50, R$ 20, R$ 10, R$ 5 e R$ 2) serão entregues
# ao cliente. Caso você não tenha conseguido resolver a Atividade Desafio I,
# acesse a solução através do endereço:
# https://gist.github.com/jalerson/dcc7e78a9ca75ffde47f
# 2. No arquivo desafio2.rb, você terá a disposição a implementação da classe
# ContaBancaria (não precisa implementá-la, basta usá-la) e uma função chamada
# localizar_conta, que recebe o número da conta como parâmetro e retorna um
# objeto da classe ContaBancaria com o número informado. Caso nenhuma conta
# seja encontrada com o número informado, a função retorna nulo (nil);
# 3. Você poderá testar seu código usando as seguintes contas bancárias, que
# já estão a disposição para você no arquivo desafio2.rb, portanto você não
# precisa criá-las.
# Conta número: 1; Saldo: R$ 500
# Conta número: 2; Saldo:	R$ 1000
# Conta número: 3; Saldo:	R$ 2000
# Conta número: 4; Saldo:	R$ 750
# Conta número: 5; Saldo:	R$ 1500
# Ao concluir a sua implementação, envie apenas o arquivo desafio2.rb através dessa atividade.

###############################################################
### DIGITE ABAIXO A SUA SOLUÇÃO PARA A ATIVIDADE DESFAIO II ###
###############################################################
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

def entregar_cedulas(sake)
    money_notes = {
        "100" => 0,
        "50" => 0,
        "20" => 0,
        "10" => 0,
        "5" => 0,
        "2" => 0
    }
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
print "+-------------------------------------+\n"
print "|--- GERENCIAMENTO CAIXA ELETRÔNICO --|\n"
print "+-------------------------------------+\n"
print "Informe o numero da sua conta: \n"
#getOut = false
accountNumber = gets.chomp.to_i
repeat = false

while !repeat
    if localizar_conta(accountNumber) == nil
        print "Conta não Localizada"    
    else

        print "Qual operação deseja fazer?\n"
        print "1 - Ver saldo\n"
        print "2 - Depositar\n"
        print "3 - Sacar\n"
        print "4 - Transferir\n"
        option = gets.chomp.to_i

        if option == 1
            print "SEU SALDO ATUAL É DE R$ "
            print @contas[accountNumber].saldo
        end
        if option == 2
            print "Quanto gostaria de depositar? \n "
            deposit = gets.chomp.to_i
            @contas[accountNumber].depositar(deposit)
            print "Deposito realizado com sucesso. Seu novo saldo é de R$ "
            print @contas[accountNumber].saldo
        end
        if option == 3
            print "Quanto deseja sacar?"
            saque = gets.chomp.to_i
            # se tem saldo...
            if @contas[accountNumber].sacar(saque)
                entregar_cedulas(saque)
            else
                print "SALDO INSUFICIENTE\n"
            end
        end
        if option == 4
            print  "Digite o número da conta de destino\n"
            destinationAccount = gets.chomp.to_i
            if localizar_conta(destinationAccount) == nil
                print "Conta de destino não localizada!"
            else
                print "Quanto deseja Transferir? \n"
                transference =gets.chomp.to_i
                if @contas[accountNumber].sacar(transference)
                    @contas[destinationAccount].depositar(transference)
                    print "Deposito realizado com sucesso. Seu novo saldo é de R$ "
                    print @contas[accountNumber].saldo
                else
                    print "SALDO INSUFICIENTE\n"
                end
            end
        end
        if option<1 || option>4
            if option == 0 
               break 
            end 
            print "Operação Inválida"
        end
    end
end