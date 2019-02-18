require_relative '../app/conta'

class ContaCorrente < Conta
  def initialize(saldo_inicial, limite = 700)
    super
  end

  def saca(valor, taxa = 5.00)
    super
  end
end
