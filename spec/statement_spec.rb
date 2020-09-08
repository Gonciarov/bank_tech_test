# frozen_string_literal: true

require 'statement.rb'

describe Statement do
  describe '#statement_header' do
    it 'shows history' do
      a = Account.new
      a.proceed(500)
      s = Statement.new(a.history)
      expect(s.statement_header.to_s).to include('date  || credit || debit')
    end
  end

  describe '#display_balance_history' do
    it 'shows history' do
      a = Account.new
      a.proceed(500)
      s = Statement.new(a.history)
      expect(s.display.to_s).to include('|| 500')
    end
  end
end
