require 'account.rb'

describe Account do

  a = Account.new

  describe '#deposit' do
    it "adds the amount" do

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

  describe '#thanks' do
    it 'thanks' do
      expect(a.thanks).to eq('Thank you!')
    end
  end

  describe '#display_balance' do
    it "displays balance" do
      expect(a.display_balance).to eq("Your current balance is 0")
    end
  end

  describe '#record' do
    it 'records change of balance' do
      expect(a.record(200).to_s).to include('|| 200')
      expect(a.record(200).to_s).to include("#{Date.today.strftime('%d/%m/%Y')}||")
    end
  end
end
