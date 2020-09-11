# frozen_string_literal: true

require 'statement.rb'

describe Statement do
  describe '#statement_header' do
    it 'has a header' do
    statement = Statement.new('foo')
    expect(statement.statement_header).to eq('date  || credit || debit || balance')
    end
  end

  describe '#display' do
    it 'shows history' do
        account = double()
        allow(account).to receive(:history).and_return(["09/09/2020 || 500.00 ||    || 500.00"])
        statement = Statement.new(account.history)
        expect(statement.display).to eq("date  || credit || debit || balance\n 09/09/2020 || 500.00 ||    || 500.00")
    end
  end
end
