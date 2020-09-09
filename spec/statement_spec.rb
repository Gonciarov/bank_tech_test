# frozen_string_literal: true

require 'statement.rb'

describe Statement do
  describe '#statement_header' do
    it 'shows history' do
      account = Account.new
      account.proceed(500)
      statement = Statement.new(account.history)
      expect(statement.statement_header.to_s).to include('date  || credit || debit')
    end
  end

  describe '#display' do
    it 'shows history' do
      account = Account.new
      account.proceed(500)
      account.proceed(-200)
      statement = Statement.new(account.history)
      expect(statement.display).to be_a(String)
      expect(statement.display).to eq("date  || credit || debit || balance\n 09/09/2020|| -200.00 ||    || 300.00\n09/09/2020||    || 500.00 || 500.00")
    end
  end

end
