require_relative '../app/conta'

class ContaCorrente < Conta
  def initialize(saldo_inicial, limite = 700)
    self.saldo = saldo_inicial
    self.limite = limite
  end
end
