require 'account'
require 'statement'

describe 'running operations and printing statement' do
  it 'allows to run operations and prints out statement' do
    account = double()
    allow(account).to receive(:history).and_return(["#{Date.today.strftime('%d/%m/%Y')}||    || 1000.00 || 1000.00", "#{Date.today.strftime('%d/%m/%Y')}||    || 2000.00 || 3000.00", "#{Date.today.strftime('%d/%m/%Y')}|| -500.00 ||    || 2500.00"])
    statement = Statement.new(account.history)
    expect(statement.display).to eq("date  || credit || debit || balance\n #{Date.today.strftime('%d/%m/%Y')}|| -500.00 ||    || 2500.00\n#{Date.today.strftime('%d/%m/%Y')}||    || 2000.00 || 3000.00\n#{Date.today.strftime('%d/%m/%Y')}||    || 1000.00 || 1000.00")
  end
end
