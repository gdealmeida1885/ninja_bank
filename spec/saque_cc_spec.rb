
require_relative '../app/conta_corrente'

describe 'Saque' do
  context 'saque com saldo positivo' do
    before(:all) do
      @conta_corrente = ContaCorrente.new(1000.0)
      @conta_corrente.saca(200)
    end

    it 'deve atualizar o saldo' do
      expect(@conta_corrente.saldo).to eql 800.00
    end
  end
  context 'saldo zero na conta' do
    before(:all) do
      @conta_corrente = ContaCorrente.new(0.0)
      @message = @conta_corrente.saca(100.0)
    end

    it 'deve negar a transacão' do 
      expect(@message).to eql "Saldo insuficiente para saque :("
    end

    it 'não deve atualizar o saldo' do
      expect(@conta_corrente.saldo).to eql 0.0
    end
  end
  context 'saldo insuficiente' do 
    before(:all) do
      @conta_corrente = ContaCorrente.new(500.0)
      @message = @conta_corrente.saca(501.0)
    end

    it 'deve negar a transacão' do
      expect(@message).to eql "Saldo insuficiente para saque :("
    end

    it 'não deve atualizar o saldo' do
      expect(@conta_corrente.saldo).to eql 500.0
    end
  end
  context 'limite por saque' do 
    before(:all) do
      @conta_corrente = ContaCorrente.new(1000.0)
      @message = @conta_corrente.saca(701.0)
    end

    it 'deve negar a transacao' do
      expect(@message).to eql "Limite máximo por saque é de R$ 700"
    end

    it 'não deve atualizar o saldo' do 
      expect(@conta_corrente.saldo).to eql 1000.0
    end
  end
end