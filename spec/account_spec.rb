require 'account.rb'
require 'statement.rb'

describe Account do

  a = Account.new

  describe '#deposit' do
    before do
      allow_any_instance_of(Account).to receive(:deposit)
      .and_return(:return_value)
    end
    it 'allows to receive deposit' do
      expect(a.deposit).to eq(:return_value)
    end
  end

  describe '#deposit' do
    it 'calls for proceed' do
      expect(a).to receive(:proceed)
      a.deposit
    end
  end

  describe '#withdraw' do
    before do
      allow_any_instance_of(Account).to receive(:withdraw).and_return(:return_value)
    end
    it 'allows to receive withdraw' do
      expect(a.withdraw).to eq(:return_value)
    end
  end

  describe '#withdraw' do
    it 'calls for proceed' do
      expect(a).to receive(:proceed)
      a.withdraw
    end
  end

  describe '#thanks' do
    it 'thanks' do
      expect(a.thanks).to eq('Thank you!')
    end
  end

  describe '#display_balance' do
    it 'displays balance' do
      expect(a.display_balance).to eq('Your current balance is 0.00')
    end
  end

  describe '#record' do
    it 'records changes of balance' do
      expect(a.record(200).to_s).to include('|| 200')
      expect(a.record(200).to_s).to include
      ("#{Date.today.strftime('%d/%m/%Y')}||")
      expect(a.record(-200).to_s).to include('|| 200')
      expect(a.record(-200).to_s).to include
      ("#{Date.today.strftime('%d/%m/%Y')}||")
    end
  end

  describe '#display_statement' do
    it 'calls for statement display' do
      a.proceed(500)
      expect_any_instance_of(Statement).to receive(:display)
      a.display_statement
    end
  end
end
