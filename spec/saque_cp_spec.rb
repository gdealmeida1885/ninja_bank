require_relative '../app/conta_poupanca'

describe 'Saque Conta Poupanca' do
  context 'saque com saldo positivo' do
    before(:all) do
      @conta_poupanca = ContaPoupanca.new(1000.0)
      @conta_poupanca.saca(200)
    end

    it 'deve atualizar o saldo' do
      expect(@conta_poupanca.saldo).to eql 798.00
    end
  end
  context 'saldo zero na conta' do
    before(:all) do
      @conta_poupanca = ContaPoupanca.new(0.0)
      @message = @conta_poupanca.saca(100.0)
    end

    it 'deve negar a transacão' do 
      expect(@message).to eql 'Saldo insuficiente para saque :('
    end

    it 'não deve atualizar o saldo' do
      expect(@conta_poupanca.saldo).to eql 0.0
    end
  end
  context 'saldo insuficiente' do 
    before(:all) do
      @conta_poupanca = ContaPoupanca.new(500.0)
      @message = @conta_poupanca.saca(501.0)
    end

    it 'deve negar a transacão' do
      expect(@message).to eql 'Saldo insuficiente para saque :('
    end

    it 'não deve atualizar o saldo' do
      expect(@conta_poupanca.saldo).to eql 500.0
    end
  end
  context 'limite por saque' do 
    before(:all) do
      @conta_poupanca = ContaPoupanca.new(1000.0)
      @message = @conta_poupanca.saca(501.0)
    end

    it 'deve negar a transacao' do
      expect(@message).to eql 'Limite máximo por saque é de R$ 500'
    end

    it 'não deve atualizar o saldo' do 
      expect(@conta_poupanca.saldo).to eql 1000.0
    end
  end
end
