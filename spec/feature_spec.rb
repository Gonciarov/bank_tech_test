require 'account'
require 'statement'

describe 'running operations and printing statement' do
  it 'allows to run operations and prints out statement' do
    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)
    statement = Statement.new(account.history)
    expect(statement.display).to eq("date  || credit || debit || balance\n 09/09/2020|| -500.00 ||    || 2500.00\n09/09/2020||    || 2000.00 || 3000.00\n09/09/2020||    || 1000.00 || 1000.00")
  end
end
