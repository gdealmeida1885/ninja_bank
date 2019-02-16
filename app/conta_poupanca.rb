require_relative '../app/conta'

class ContaPoupanca < Conta
  def initialize(saldo_inicial, limite = 500.0)
    self.saldo = saldo_inicial
    self.limite = limite
  end
end
