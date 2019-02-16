# Classe com os atributos de uma conta
class Conta
  attr_accessor :limite, :saldo
  def saca(valor)
    if self.saldo >= valor && valor <= self.limite
      self.saldo -= valor
    elsif self.saldo <= valor
      'Saldo insuficiente para saque :('
    else
      "Limite máximo por saque é de R$ #{self.limite.to_int}"
    end
  end
end
