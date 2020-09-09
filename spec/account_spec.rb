require 'account.rb'
require 'statement.rb'

describe Account do

  account = Account.new

  describe '#deposit' do
    before do
      allow_any_instance_of(Account).to receive(:deposit)
      .and_return(:return_value)
    end
    it 'allows to receive deposit' do
      expect(account.deposit(500)).to eq(:return_value)
    end
  end

  describe '#deposit' do
    it 'calls for proceed' do
      expect(account).to receive(:proceed)
      account.deposit(500)
    end
  end

  describe '#withdraw' do
    before do
      allow_any_instance_of(Account).to receive(:withdraw).and_return(:return_value)
    end
    it 'allows to receive withdraw' do
      expect(account.withdraw(500)).to eq(:return_value)
    end
  end

  describe '#withdraw' do
    it 'calls for proceed' do
      expect(account).to receive(:proceed)
      account.withdraw(500)
    end
  end

  describe '#record' do
    it 'records changes of balance' do
      expect(account.record(200).to_s).to include('|| 200')
      expect(account.record(200).to_s).to include
      ("#{Date.today.strftime('%d/%m/%Y')}||")
      expect(account.record(-200).to_s).to include('|| 200')
      expect(account.record(-200).to_s).to include
      ("#{Date.today.strftime('%d/%m/%Y')}||")
    end
  end

  describe '#display_statement' do
    it 'calls for statement display' do
      account.proceed(500)
      expect_any_instance_of(Statement).to receive(:display)
      account.display_statement
    end
  end

end
