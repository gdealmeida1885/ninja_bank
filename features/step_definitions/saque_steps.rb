require_relative '../../app/conta_corrente'

Dado("que eu tenho R$ {float} em minha conta corrente") do |saldo_inicial|
  @conta_corrente = ContaCorrente.new(saldo_inicial)
end

Quando("faço um saque de R$ {float}") do |valor_saque|
  @retorno = @conta_corrente.saca(valor_saque)
end

Então("meu saldo final deve ser R$ {float}") do |saldo_final|
  expect(@conta_corrente.saldo).to eql(saldo_final)
end
  
Então("vejo a mensagem {string}") do |mensagem|
  expect(@retorno).to match(mensagem)
end