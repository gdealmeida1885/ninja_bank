require_relative '../app/conta'

class ContaPoupanca < Conta
  def initialize(saldo, limite = 500)
    super
  end

  def saca(valor, taxa = 2.00)
    super
  end
end
