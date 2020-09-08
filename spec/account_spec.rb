require 'account.rb'

describe '#deposit' do
  it "adds the amount" do
    a = Account.new
    expect(a).to receive(:proceed)
    a.deposit
  end
end

describe '#withdraw' do
  before do
    allow_any_instance_of(Account).to receive(:withdraw).and_return(:return_value)
  end
  it 'allows to receive withdraw' do
    a = Account.new
    expect(a.withdraw).to eq(:return_value)
  end
end

describe '#thanks' do
  it 'thanks' do
    a = Account.new
    expect(a.thanks).to eq('Thank you!')
  end
end

describe '#display_balance' do
  it "displays balance" do
    a = Account.new
    expect(a.display_balance).to eq("Your current balance is 0")
  end
end

describe '#record' do
  it 'records change of balance' do
    a = Account.new
    expect(a.record(200).to_s).to include('|| 200')
    expect(a.record(200).to_s).to include("#{Date.today.strftime("%e %b %Y")}||")
  end
end

describe '#display_history_header' do
  it 'shows history' do
    a = Account.new
    a.proceed(500)
    expect(a.display_history_header.to_s).to include("date  || credit || debit || balance")
  end
end

describe '#display_balance_history' do
  it 'shows history' do
    a = Account.new
    a.proceed(500)
    expect(a.display_balance_history.to_s).to include("|| 500")
  end
end
