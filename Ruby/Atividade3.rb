a = true
b = false
c = true
d = false

exemplo1 = (a and b) or (b and c)
# false or false == false
exemplo2 = (d or c) and not a
# true and not false == false
exemplo3 = (a or b) or !c
# true or not true == true
exemplo4 = (3 < 4) or (a ^ c)
# true or [não entendi a^c]
exemplo5 = (10 >= 10) and (a or b) or not d
true and true or not false == true

puts "(a and b) or (b and c) = #{exemplo1}"
puts "(d or c) and not a = #{exemplo2}"
puts "(a or b) or !c = #{exemplo3}"
puts "(3 < 4) or (a ^ c) = #{exemplo4}"
puts "(10 >= 10) and (a or b) or not d = #{exemplo5}"

gets